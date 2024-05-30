; Instructions: 
; - Prepare a text file with IMDb titles or IMDB codes(example: tt0137523), one per line
; - Make sure the IMDb list edit page is open in the browser before running the script. You can create a List here: https://www.imdb.com/list/create/
; - run this script 
; - use the file picker to select your text file file 
; - Let the script add your titles to your list on IMDb.
; Note: This script is a basic example and may need to be adjusted based on your specific requirements and environment.
; You may need to adjust the sleep times and key presses based on your browser, internet connection and system settings.
; Tested on Chrome / Chromium browser. Note: This script uses the AutoHotkey v2 syntax.

; Author: rorarr
; License: MIT
; Version: 1.0
; Date: 2024-05-30

#Requires AutoHotkey v2.0+
; Start an AutoHotkey script
Persistent ; Keeps the script running
SetTitleMatchMode "2" ; Allows partial matching of window titles

; Define the target window title for your Web browser
targetWindowTitle := "Testimport - Thorium"

; Ensure the Browser window is active
if !WinExist(targetWindowTitle) {
    MsgBox("Please open the IMDb list edit page in Chrome and try again.")
    ExitApp()
}

; Show a file picker dialog to select the IMDb titles file
filePath := FileSelect("Select the IMDb titles file", "*.txt")
if !filePath {
    MsgBox("No file selected. Exiting script.")
    ExitApp()
}

; Load IMDb titles from the selected text file
imdbTitles := []

; Check if the file exists
if !FileExist(filePath) {
    MsgBox("The selected file was not found.")
    ExitApp()
}

; Read the file and load the IMDb titles into the array
content := FileRead(filePath)
Loop Parse, content, "`n", "`r"
{
    if (A_LoopField != "")
        imdbTitles.Push(A_LoopField)
}

; Activate the Chrome window
WinActivate(targetWindowTitle)
WinWaitActive(targetWindowTitle)

; Navigate to the input field once
Send("{Tab 17}")
Sleep(1000)

; Loop through each IMDb title and add it to the list
for title in imdbTitles {
    ; Enter the IMDb title
    Send(title)
    Sleep(2000)
    
    ; Press down arrow to select the first suggestion
    Send("{Down}")
    Sleep(2000)
    
    ; Press enter to add the title to the list
    Send("{Enter}")
    Sleep(2000) ; Wait for the addition to complete
    
    Send("{Tab 1}")
    Send("+{Tab 1}")
    Sleep(2000)
}

MsgBox("IMDb titles have been successfully added to your list.")
ExitApp()
