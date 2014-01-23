on open location this_URL
	# poor man's url decoding ))
	
	# strip first part txmt://...
	set sp to text 24 thru -1 of this_URL
	
	# remove '&column=' part at the end of this URL (if it exists)
	set x to the offset of "&column=" in sp
	if x is 0 then
		set x to -1
	end if
	set sp to text 1 thru x of sp
	
	# format left text for shell 
	set sp to ReplaceText(sp, "%2F", "/")
	set sp to ReplaceText(sp, "&line=", ":")
	set sp to ReplaceText(sp, " ", "\\ ")
	
	do shell script "/usr/local/bin/mine " & sp
	tell application "RubyMine"
		activate
	end tell
end open location

(*
 * functions
 *)
-- http://lists.apple.com/archives/Applescript-users/2005/Nov/msg00008.html
on ReplaceText(theString, fString, rString)
	set current_Delimiters to AppleScript's text item delimiters
	set AppleScript's text item delimiters to fString
	set sList to every text item of theString
	set AppleScript's text item delimiters to rString
	set newString to sList as string
	set AppleScript's text item delimiters to current_Delimiters
	return newString
end ReplaceText

