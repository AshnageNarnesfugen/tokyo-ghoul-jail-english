Tokyo Ghoul: Jail (PS Vita, PCSG00615) - English Fan Translation
================================================================

Translates the full story (139 scenes, about 11,400 lines), choices,
chapter titles, nameplates, menus, map, battle tutorial, battle HUD and
results, skill sheet and extras.

You need the Japanese game (PCSG00615, version 01.00) already
installed. No game data is included: the patcher builds the English
files from your own copy, and never modifies the files you give it.

Follow the section for where you play.


A) Vita3K on PC (Windows, Linux, macOS)
---------------------------------------
1. In Vita3K, right-click the game > Open Folder > Application.
   That opens the game's folder, PCSG00615. Go up one level, so that
   you see the PCSG00615 folder itself (this is Vita3K's ux0/app).
2. Patch it:
   - Windows: drag the PCSG00615 folder onto apply.bat.
   - Linux / macOS: install xdelta3 (apt install xdelta3,
     pacman -S xdelta3, or brew install xdelta), then run:
         sh apply.sh "/path/to/PCSG00615"
3. When it says "Done", copy the folder patched/PCSG00615 into the
   ux0/app folder from step 1 and choose to replace the files.


B) Vita3K on Android
--------------------
The patcher runs on a PC (Windows, Linux or macOS).
1. In Vita3K's storage folder on the phone, open
   ux0/app/PCSG00615/PSP2_GAME/USRDIR and copy resource.dat,
   first.dat and the env folder into one folder on the PC.
2. Patch that folder as in A, step 2 (drag the folder onto apply.bat,
   or run sh apply.sh "/path/to/folder").
3. Copy the folder patched/PCSG00615 into Vita3K's ux0/app folder on
   the phone and choose to replace the files.


C) PS Vita (HENkaku / h-encore / Enso)
--------------------------------------
Installed games are encrypted, so you copy the files out decrypted
with VitaShell, and the rePatch plugin loads the English files.
1. Install the rePatch reDux0 plugin if you don't have it yet:
   https://github.com/dots-tb/rePatch-reDux0
2. In VitaShell, go to ux0:app (gro0:app for a game card), highlight
   PCSG00615, press Triangle and choose "Open decrypted".
3. Open PSP2_GAME/USRDIR. Mark resource.dat, first.dat and env with
   Square and press Triangle > Copy. Then make a new folder, for
   example ux0:data/tgj (Triangle > New folder), open it and paste.
4. Move that folder to your PC (press SELECT in VitaShell to connect
   by USB or FTP) and patch it as in A, step 2.
5. Copy the folder patched/PCSG00615 into ux0:rePatch/ on the Vita
   (create the rePatch folder if it doesn't exist). You can then
   delete ux0:data/tgj.


Then start the game. Existing saves work; a save made before patching
keeps its Japanese chapter title in the save slot until you save again.

Back to Japanese: on PS Vita, delete ux0:rePatch/PCSG00615. On Vita3K,
reinstall the game.


Updating from v1.0
------------------
The patcher always starts from the original Japanese files: on files
already patched with v1.0 it reports MISMATCH.
- PS Vita: ux0:app still holds the original files. Repeat steps C2 to
  C5 and replace the files in ux0:rePatch/PCSG00615.
- Vita3K: reinstall the game, or use the copy of the original files you
  patched before if you kept it (on Android, the folder from step B1),
  then patch again.


If something goes wrong
-----------------------
The patcher checks every file before and after patching:
  OK        Patched.
  ALREADY   That file is already in English; it is copied as is.
  MISSING   The file wasn't found. Give the patcher the PCSG00615
            folder, its PSP2_GAME/USRDIR folder, or a folder with
            resource.dat, first.dat and env.
  MISMATCH  That file is not the untouched Japanese 01.00 file: it was
            modified, comes from another version, or is still
            encrypted (on PS Vita, copy it with "Open decrypted").
  BAD       Patching that file failed: it is not the original file,
            or the patch download is damaged (download it again).

Vita3K on Android, black screen after copying files as root: write
through /storage/... and not /mnt/media_rw/..., or the emulator may see
a truncated file.


Notes
-----
- Tested on Vita3K (Android). Real PS Vita hardware has not been
  tested yet.
- Ghoul terms follow the anime/manga: Ghoul, Dove/CCG, Anteiku,
  Cochlea, kagune types, Helter Skelter.
- xdelta3.exe is the official Xdelta 3.0.11 Windows build by Joshua
  MacDonald, unmodified. License: GNU GPL v2 (xdelta3-COPYING.txt).
  Source code: https://github.com/jmacd/xdelta-gpl/releases/tag/v3.0.11
