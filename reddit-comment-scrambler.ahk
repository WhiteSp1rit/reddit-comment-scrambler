#Requires AutoHotkey v2.0+
#Warn
#SingleInstance Force
Persistent true
SendMode "Input"
CoordMode "Mouse", "Client"
CoordMode "Pixel", "Client"

; user config
ahk_exe := "ahk_exe firefox.exe"
scroll_height := 65
content_area_start_y := 88
content_area_start_x := 375
color_background := 0x262626
color_selected := 0x373737


#HotIf WinActive(ahk_exe)
#v:: {
	WinActivate ahk_exe
    WinGetClientPos &client_x, &client_y, &client_width, &client_height, ahk_exe
	
	;PixelSearch(&Px, &Py, content_area_start_x+300, content_area_start_y+10, client_width-200, client_height, color_selected)
	PixelSearch(&Px, &Py, client_width-100, client_height, content_area_start_x+300, content_area_start_y+10, color_selected)
	;MsgBox "coords: " Px " ," Py
	
	MouseMove(Px,Py,30)
	
	scroll_num := Ceil((Py-content_area_start_y-10) / scroll_height)
	
	;MsgBox "need to scroll " scroll_num " times"
	Send "{Down " . scroll_num . "}"
}

#HotIf WinActive(ahk_exe)
#c:: {
    WinActivate ahk_exe
    WinGetClientPos &client_x, &client_y, &client_width, &client_height, ahk_exe

	Loop(100){

	Sleep 800
    search_res := ImageSearch(&edit_x, &edit_y, 0, 0, client_width, client_height, ".\edit.png")
	
	if (!search_res) {
		MsgBox "can't find the 'Edit' button, stopping the script"	
		exitapp	
	}
	
	Click edit_x+20, edit_y+10
    Sleep 500
    
	SendInput "{LCtrl down}a{LCtrl up}"
	Sleep 80
    
	SendInput "{LCtrl down}c{LCtrl up}"
	Sleep 80
	
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
	Sleep 70
    
	SendInput "{LCtrl down}v{LCtrl up}"
    Sleep 250
    
    search_res := ImageSearch(&FoundX, &FoundY, 0, 0, client_width, client_height, ".\save.png")
    
	if (!search_res) {
		MsgBox "can't find the 'Save' button, stopping the script"	
		exitapp	
	}
	
	Sleep 200
	Click FoundX+20, FoundY+10
	
	;MsgBox "need to scroll " scroll_num " times"
	Sleep 800
	
	PixelSearch(&selected_x, &selected_y, client_width-100, client_height, content_area_start_x+300, content_area_start_y+10, color_selected)

	scroll_num := Ceil((selected_y-content_area_start_y-10) / scroll_height)
	
	;MsgBox "need to scroll " scroll_num " times"
	Send "{Down " . scroll_num . "}"
	}
	Sleep 1400
}

esc:: {
	exitapp
}
