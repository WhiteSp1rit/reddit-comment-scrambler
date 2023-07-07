# Reddit comment scrambler
A simple script to randomise the contents of your comments and turn them into text noise.  
Fully automatic, requires no user interaction after launch.

## Requirements
* [AutoHotkey (AHK) v2](https://www.autohotkey.com/)  
* [Reddit Enhancement Suite (RES)](https://redditenhancementsuite.com/) browser extension

## Required RES settings
Appearance -> Night Mode -> on, Night Mode On -> on, Automatic Night Mode -> Disabled  
Browsing -> Never Ending Reddit -> on, Auto Load -> on 

## How to use
1) if its your first time using the script, check the 'rcs-config.ini' file parameters, and change them if necessary.
2) launch the script
3) open your Reddit comments page
4) scroll it so that the first visible 'edit' link is under the first comment which needs to be scrambled
5) make sure that the first comment is not selected, otherwise it will be skipped
7) press 'Win+C', which will activate the script function
8) script will start scrambling the comments, up to the number specified in the config
9) press 'Esc' to close the script after you're done using it, or in case you just want to stop it. Alternatively, you can close it from the tray icon.

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

## Limitations

Reddit only allows loading the last 1000 comments.  
In order to view older comments, newer ones must be deleted.  
I'll add the delete function later.   
Deleting large numbers of comments fast, or without scrambling them first is not recommended,   
as Reddit can both restore deleted comments and suspend your account for suspicious behaviour.   
