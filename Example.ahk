#include AHKML.ahk

Init(true, "index.html", " ") ; Arg 1 - isFile(is code by file or by source) - true/false, Arg2 - filename, string, if first arg false put just " ", Arg3 - html source, if first arg is true put just " ".
ShowWebPage()
SeeHtmlCode()
EditCode(true, "index2.html", " ") ; Same thing as with init func.
