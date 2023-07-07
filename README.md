# Reddit comment scrambler
A simple script to randomise the contents of your comments and turn them into text noise.  
Fully automatic, requires no user interaction after launch.

## Requirements
[AutoHotkey (AHK) v2](https://www.autohotkey.com/)
A browser with Reddit Enhancement Suite (RES) extension installed

## How to use
1) check the config file parameters if its your first time using the script, and change them if necessary
2) open your Reddit comments page
3) scroll it so that the first 'edit' link visible is under the first comment which needs to be scrambled
4) make sure that the first comment is not selected, otherwise it will be skipped
5) launch the script
6) press 'Win+C', which will activate the script function
7) script will start scrambling the comments, up to the number specified in the config
8) press 'Esc' to close the script after you're done using it, or in case you jsut want to stop it. Alternatively, you can close it from the tray icon.

## Changing the script activation key combo 
open the script in any text editor and change the following line:  
#c::  
according to:  
^ is Ctrl, + is Shift, ! is Alt, # is Win  
as an example, changing the key combo to Shift+X would be:  
+x::  
or assign it to one of the side mouse buttons like this:  
XButton1::    
or  
XButton2::  
