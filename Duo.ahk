SetKeyDelay, 20

$!4::
	SendInput, {$!y}
	Suspend, On
	Pause, On,1
Return

$!3:: 
	Suspend, Off
	Pause, Off,1
Return


$!x::
   Loop
   {
     SendInput, !y
     Sleep, 2000
     SendInput, ^{Tab}
     Sleep, 1000
     SendInput, !y
     Sleep, 2000
     SendInput, ^{Tab}
     Sleep, 1000
     SendInput, !y
     Sleep, 2000
     SendInput, ^{Tab}
     Sleep, 16000
     SendInput, ^{Tab}
    }
Return