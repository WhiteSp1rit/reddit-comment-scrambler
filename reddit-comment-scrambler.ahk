#Requires AutoHotkey v2.0+
#Warn
#SingleInstance Force
Persistent true
SendMode "Input"
CoordMode "Mouse", "Client"
CoordMode "Pixel", "Client"

config_file := ".\rcs-config.ini"
config_section := "user_config"

browser_exe := IniRead(config_file, config_section, "browser_exe")
scroll_height := IniRead(config_file, config_section, "scroll_height")
content_area_start_y := IniRead(config_file, config_section, "content_area_start_y")
content_area_start_x := IniRead(config_file, config_section, "content_area_start_x")
color_selected := IniRead(config_file, config_section, "color_selected")
num_comments := IniRead(config_file, config_section, "num_comments")
ahk_exe := "ahk_exe " . browser_exe

#HotIf WinActive(ahk_exe)
#c:: {
    WinActivate ahk_exe
    WinGetClientPos &client_x, &client_y, &client_width, &client_height, ahk_exe

	Loop(num_comments){

		Sleep 300
		search_res := ImageSearch(&edit_x, &edit_y, 0, 0, client_width, client_height, ".\img\edit.png")
		
		if (!search_res) {
			MsgBox "can't find the 'edit' link, stopping the script"	
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
		
		search_res := ImageSearch(&FoundX, &FoundY, 0, 0, client_width, client_height, ".\img\save.png")
		
		if (!search_res) {
			MsgBox "can't find the 'save' link, stopping the script"	
			exitapp	
		}
		
		Sleep 350
		Click FoundX+20, FoundY+10

		Sleep 1100
		
		PixelSearch(&selected_x, &selected_y, client_width-150, client_height-100, content_area_start_x+225, content_area_start_y+10, color_selected)

		scroll_num := Ceil((selected_y-content_area_start_y-10) / scroll_height)
		
		Send "{Down " . scroll_num . "}"
		Sleep 400
	}
}

esc:: {
	exitapp
}
