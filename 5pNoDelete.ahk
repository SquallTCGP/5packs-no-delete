#Requires AutoHotkey v2.0
#SingleInstance Force

; Process 1.ahk file
ProcessFile(filePath) {
    try {
        ; Read the file
        fileContent := FileRead(filePath)
        
        ; Split into lines
        lines := StrSplit(fileContent, "`n")
        newLines := []
        
        ; Process lines
        i := 1
        while (i <= lines.Length) {
            line := lines[i]
            
            ; Check for the first pattern
            if (InStr(line, "if(wonderPicked)")) {
                newLines.Push(line)  ; Keep the if line
                i += 1  ; Skip next line
                newLines.Push(A_Tab A_Tab A_Tab . ";friendsAdded := AddFriends(true)" A_Tab ";dpp")
                newLines.Push(A_Tab A_Tab A_Tab . "FindImageAndClick(120, 500, 155, 530, , " . Chr(34) . "Social" . Chr(34) . ", 143, 518, 500)" . A_Tab . ";dpp")
                newLines.Push(A_Tab A_Tab A_Tab . "FindImageAndClick(20, 500, 55, 530, , " . Chr(34) . "Home" . Chr(34) . ", 40, 516, 500)" . A_Tab . ";dpp")
            }

            ; Check for the second pattern
            else if (InStr(line, "if(packs = 3)")) {
                newLines.Push(A_Tab . ";if(packs = 3)" A_Tab ";dpp")
                newLines.Push(A_Tab A_Tab . ";packs := 0" A_Tab ";dpp")
                i += 1  ; Skip the next line
            }
            else {
                newLines.Push(line)
            }
            i += 1
        }
        
        ; Join lines back together and write to file
        newContent := ""
        for line in newLines {
            newContent .= line . "`n"
        }

        ; Correct way to write the file in AHK v2
        file := FileOpen(filePath, "w")  ; Open file for writing (overwrite mode)
        if (file) {
            file.Write(newContent)
            file.Close()
            MsgBox("Successfully processed: " filePath)
        } else {
            MsgBox("Failed to write to file: " filePath)
        }
    }
    catch as err {
        MsgBox("Error processing " filePath "`nError: " err.Message)
    }
}

; Delete .ahk files in Scripts folder except 1.ahk and Main.ahk
CleanScriptsFolder(scriptsPath) {
    try {
        Loop Files, scriptsPath "\*.ahk" {
            if (A_LoopFileName != "1.ahk" && A_LoopFileName != "Main.ahk") {
                FileDelete(A_LoopFileFullPath)
            }
        }
        MsgBox("Successfully cleaned the .ahk files in the Scripts folder (except 1.ahk and Main.ahk)")
    }
    catch as err {
        MsgBox("Error cleaning Scripts folder:`n" err.Message)
    }
}

; Main function
Main() {
    ; Define paths relative to script location
    rootDir := A_ScriptDir
    scriptsDir := rootDir "\Scripts"
    script1Path := scriptsDir "\1.ahk"
    
    ; Clean Scripts folder
    CleanScriptsFolder(scriptsDir)
    
    ; Process 1.ahk
    if FileExist(script1Path) {
        ProcessFile(script1Path)
    } else {
        MsgBox("Warning: 1.ahk not found in Scripts folder")
    }
}

; Run the script
Main()
