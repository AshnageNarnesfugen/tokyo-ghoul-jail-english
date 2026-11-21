# Tokyo Ghoul: Jail — English Fan Translation (PS Vita)

English patch for **Tokyo Ghoul: Jail** (東京喰種トーキョーグール JAIL, PS Vita, PCSG00615).

It translates the full story (139 scenes, about 11,400 lines), choices, chapter titles, nameplates, menus, map, battle tutorial, battle HUD and results, skill sheet and extras.

### [⬇ Download the patch: TGJ-English-Patch.zip](https://github.com/AshnageNarnesfugen/tokyo-ghoul-jail-english/releases/latest)

You need your own copy of the Japanese game (PCSG00615, version 01.00) already installed. The patch contains no game data: it builds the English files from your copy and never modifies the files you give it.

## How to apply

Extract the zip, then follow the part for where you play. The same guide is in `README.txt` inside the zip.

### Vita3K on PC (Windows, Linux, macOS)

1. In Vita3K, right-click the game → **Open Folder → Application**. Go up one level, so that you see the `PCSG00615` folder itself (this is Vita3K's `ux0/app`).
2. Patch it:
   - **Windows:** drag the `PCSG00615` folder onto `apply.bat`.
   - **Linux / macOS:** install xdelta3 (`apt install xdelta3`, `pacman -S xdelta3` or `brew install xdelta`), then run `sh apply.sh "/path/to/PCSG00615"`.
3. When it says **Done**, copy the folder `patched/PCSG00615` into `ux0/app` and choose to replace the files.

### Vita3K on Android

The patcher runs on a PC.

1. In Vita3K's storage folder on the phone, open `ux0/app/PCSG00615/PSP2_GAME/USRDIR` and copy `resource.dat`, `first.dat` and the `env` folder into one folder on the PC.
2. Patch that folder as above (drag it onto `apply.bat`, or `sh apply.sh "/path/to/folder"`).
3. Copy the folder `patched/PCSG00615` into Vita3K's `ux0/app` on the phone and choose to replace the files.

### PS Vita (HENkaku / h-encore / Enso)

Installed games are encrypted, so you copy the files out decrypted with VitaShell, and the rePatch plugin loads the English files.

1. Install the [rePatch reDux0](https://github.com/dots-tb/rePatch-reDux0) plugin if you don't have it yet.
2. In VitaShell, go to `ux0:app` (`gro0:app` for a game card), highlight `PCSG00615`, press △ and choose **Open decrypted**.
3. Open `PSP2_GAME/USRDIR`, mark `resource.dat`, `first.dat` and `env` with □ and press △ → **Copy**. Make a new folder such as `ux0:data/tgj`, open it and paste.
4. Move that folder to your PC (press SELECT in VitaShell to connect by USB or FTP) and patch it as above.
5. Copy the folder `patched/PCSG00615` into `ux0:rePatch/` on the Vita (create `rePatch` if it doesn't exist).

Then start the game. Existing saves work. To go back to Japanese, delete `ux0:rePatch/PCSG00615` (PS Vita) or reinstall the game (Vita3K).

### Updating from v1.0

The patcher always starts from the original Japanese files: on files already patched with v1.0 it reports `MISMATCH`.

- **PS Vita:** `ux0:app` still holds the original files. Repeat steps 2–5 and replace the files in `ux0:rePatch/PCSG00615`.
- **Vita3K:** reinstall the game, or use the copy of the original files you patched before if you kept it (on Android, the folder from step 1), then patch again.

## If something goes wrong

The patcher checks every file before and after patching:

| Message | Meaning |
|---|---|
| `OK` | Patched. |
| `ALREADY` | That file is already in English; it is copied as is. |
| `MISSING` | The file wasn't found. Give the patcher the `PCSG00615` folder, its `PSP2_GAME/USRDIR` folder, or a folder with `resource.dat`, `first.dat` and `env`. |
| `MISMATCH` | Not the untouched Japanese 01.00 file: it was modified, comes from another version, or is still encrypted (on PS Vita, copy it with **Open decrypted**). |
| `BAD` | Patching that file failed: it is not the original file, or the download is damaged. |

## Notes

- Tested on Vita3K (Android). Real PS Vita hardware has not been tested yet.
- Ghoul terms follow the anime/manga: Ghoul, Dove/CCG, Anteiku, Cochlea, kagune types, Helter Skelter.
- `xdelta3.exe` is the official Xdelta 3.0.11 Windows build by Joshua MacDonald, unmodified. License: GNU GPL v2 (`xdelta3-COPYING.txt`). Source code: https://github.com/jmacd/xdelta-gpl/releases/tag/v3.0.11
