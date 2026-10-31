#!/bin/sh
# apply.sh <game folder>: builds the English files from your own copy of Tokyo Ghoul: Jail (PCSG00615).
# <game folder> is PCSG00615, its PSP2_GAME/USRDIR, or any folder holding resource.dat, first.dat and env/.
# Nothing in it is modified: the patched files go to patched/PCSG00615/ next to this script (see README.txt).
HERE=$(cd "$(dirname "$0")" && pwd)
OUT="$HERE/patched/PCSG00615/PSP2_GAME/USRDIR"
[ -n "$1" ] || { echo 'usage: sh apply.sh "/path/to/PCSG00615"   (see README.txt)'; exit 1; }
command -v xdelta3 >/dev/null || { echo "xdelta3 not found. Install it: apt install xdelta3 / pacman -S xdelta3 / brew install xdelta"; exit 1; }
SRC=
for d in "$1/PSP2_GAME/USRDIR" "$1/USRDIR" "$1/PCSG00615/PSP2_GAME/USRDIR" "$1"; do
    [ -f "$d/resource.dat" ] && { SRC=$d; break; }
done
[ -n "$SRC" ] || { echo "resource.dat not found in \"$1\". Give the PCSG00615 folder, its PSP2_GAME/USRDIR folder, or the folder with resource.dat, first.dat and env."; exit 1; }
md5of() { if command -v md5sum >/dev/null; then md5sum < "$1" | cut -d' ' -f1; else md5 -q "$1"; fi; }   # md5 -q: macOS
echo "Game files: $SRC"
mkdir -p "$OUT/env" || exit 1
fail=0; total=0; mism=0
while read -r before after name; do
    total=$((total + 1))
    f="$SRC/$name"
    if [ ! -f "$f" ]; then echo "MISSING  $name"; fail=1; continue; fi
    have=$(md5of "$f")
    if [ "$have" = "$after" ]; then
        echo "ALREADY  $name (already English, copied as is)"
        [ "$f" -ef "$OUT/$name" ] || cp "$f" "$OUT/$name" || fail=1
        continue
    fi
    if [ "$have" != "$before" ]; then echo "MISMATCH $name (not the original Japanese file)"; fail=1; mism=$((mism + 1)); continue; fi
    if xdelta3 -d -f -s "$f" "$HERE/patches/$name.xdelta" "$OUT/$name" && [ "$(md5of "$OUT/$name")" = "$after" ]; then
        echo "OK       $name"
    else
        echo "BAD      $name"; fail=1
    fi
done < "$HERE/patches/checksums.txt"
if [ $fail != 0 ]; then
    echo "Some files could not be patched (see above, and \"If something goes wrong\" in README.txt)."
    if [ $mism = $total ]; then
        echo "None of the files is the original Japanese one. Copied from a PS Vita? Then they"
        echo "are still encrypted: copy them with VitaShell's \"Open decrypted\" (README.txt, section C)."
    fi
    exit 1
fi
echo "Done. Now copy this folder (README.txt, last step):"
echo "  $HERE/patched/PCSG00615"
echo "  Vita3K:  into ux0/app/ (replace the files)"
echo "  PS Vita: into ux0:rePatch/"
