# README for 5pNoDelete.ahk

This AutoHotkey (AHK) script is designed to clean the Scripts folder of the PTCGPB Bot by retaining only `1.ahk` and `Main.ahk`. Additionally, it modifies the `1.ahk` file to enable the opening of 5 packs without the need to delete and re-add friends after opening 3 packs.

## Background

This script is based on the contributions of `DietPepperPhD` from the Discord community, specifically the community mod he created where the modifications aimed at increasing packs per minute by 30% using the "5Pack Method" without removing friends after the third pack.

## Usage

1. **Run Once After Update**: Execute this script whenever Arturo's bot is updated to a newer version. The update may overwrite the changes that allow opening 5 packs without friend deletion.
   
2. **Backup**: If you encounter any issues while running the script, ensure that the latest version of `1.ahk` from Arturo's bot is copied back into the Scripts folder. This ensures that the script can replace the lines in the most recent version of `1.ahk`.

3. **Requirements**: 
   - Place this script (`5pNoDelete.ahk`) in the root folder of Arturo's bot.
   - Ensure that `1.ahk` is located in the Scripts folder.

This operation is straightforward, and as long as the above conditions are met, the script should run smoothly and perform the necessary replacements.
