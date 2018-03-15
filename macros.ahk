Gui, New, +AlwaysOnTop +Resize, Mode
FileRead, mode, C:\Users\thewe\Documents\macros\mode.txt
Gui, Add, Text, vMode gLabel, %mode%
Gui, Show

Label:
	While(True) {
		FileRead, mode, C:\Users\thewe\Documents\macros\mode.txt
		GuiControl, , Mode, %mode%
		Sleep, 100
	}
	
GuiClose:
	ExitApp

F24::
	FileRead, buttons, C:\Users\thewe\Documents\macros\button.txt
    FileRead, mode, C:\Users\thewe\Documents\macros\mode.txt
    if (buttons == 38) {
        incressMode(mode, 1)
    } else if (buttons == 40) {
        decressMode(mode, 1)
    } else if (buttons == 33){
		incressMode(mode, 10)
	} else if (buttons == 34) {
		decressMode(mode, 10)
	} else {
		if (!FileExist(mode "\" buttons ".ahk")) {
			MsgBox, That macro %buttons% doesn't exist
		} else {
			Run %mode%\%buttons%.ahk
		}
    }
Return

intparse(str) {

	str = %str% ; removes formatting

	Loop, Parse, str ; parse through each character

		If A_LoopField in 0,1,2,3,4,5,6,7,8,9,.,+,-

			int = %int%%A_LoopField% ; build integer

	Return, int + 0 ; returns real number

}

incressMode(mode, amount) {
	mode := intparse(mode) + amount
	if (!FileExist(mode)) {
		MsgBox, That mode %mode% doesn't exist
	} else {
		FileDelete, C:\Users\thewe\Documents\macros\mode.txt
		FileAppend, %mode%, C:\Users\thewe\Documents\macros\mode.txt
	}
}

decressMode(mode, amount) {
	mode := intparse(mode) - 1
	if (mode < 0) {
		mode := 0
	} else {
		if (!FileExist(mode)) {
			MsgBox, That mode %mode% doesn't exist
		} else {
			FileDelete, C:\Users\thewe\Documents\macros\mode.txt
			FileAppend, %mode%, C:\Users\thewe\Documents\macros\mode.txt
		}
	}
}