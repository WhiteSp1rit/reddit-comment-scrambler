# Reddit comment scrambler
A simple script to randomise the contents of your comments and turn them into text noise.  
At the moment only works on a currently selected comment,  
with the goal to eventually automate the entire process, requiring no user interaction.

## Requirements
[AutoHotkey (AHK) v2](https://www.autohotkey.com/)

## How to use
1) launch the script
2) click "edit" on your Reddit comment
3) press Win+C, which will execute the script function, and replace all letters and numbers in your comment with random ones
4) click "save"
5) repeat for any comments you need to scramble
6) press Esc to close the script after you're done using it. Alternatively, you can close it from the tray icon.

## Customisation  
If you want to change the activation key combo,   
open the script in any text editor and change the following line:  
#c::  
according to:  
^ is Ctrl, + is Shift, ! is Alt, # is Win  
as an example, changing the key combo to Shift+X would be:  
+x::  

Or assign it to one of the side mouse buttons like this:  
XButton1::  
XButton2::  
