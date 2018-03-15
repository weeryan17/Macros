if WinActive("ahk_exe DiscordCanary.exe") {
	Send, {BS}
}
SendRaw, ¯\_(ツ)_/¯
if WinActive("ahk_exe DiscordCanary.exe") {
	Send, {Shift down}{Enter}{Shift up}
}
ExitApp