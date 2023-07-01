#Requires AutoHotkey v2.0
#Warn
#SingleInstance Force
Persistent true
SendMode "Input"

#c:: {
	SendInput "{LCtrl down}a{LCtrl up}"
	Sleep 40
	SendInput "{LCtrl down}c{LCtrl up}"
	Sleep 40
	
	new_text := ""
	old_text := A_Clipboard

	Loop Parse, old_text
	{
		char := A_LoopField
		if (IsDigit(char))
			new_text .= Chr(Random(48, 57))
		else if (IsLower(char))
			new_text .= Chr(Random(97, 122))
		else if (IsUpper(char))
			new_text .= Chr(Random(65, 90))
		else
			new_text .= char
	}

	A_Clipboard := new_text

	Sleep 40
	SendInput "{LCtrl down}v{LCtrl up}"
}

esc:: {
	exitapp
}
