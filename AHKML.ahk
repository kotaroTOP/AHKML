#Requires AutoHotkey v2.0
#include libs/AhkSoup.ahk
#include libs/WebView2.ahk
ui := Gui()
inited := false
gotHtml := false
html := ""
Init(&isFile, &filename &html)
  if (!(inited))
  {
    if isFile{
      ui.OnEvent('Close', (*) => (wvc := wv := 0))
      ui.Show(Format('w{} h{}', A_ScreenWidth * 0.6, A_ScreenHeight * 0.6))
      wvc := WebView2.CreateControllerAsync(ui.Hwnd).await2()
      wv := wvc.CoreWebView2
      wv.Navigate("file:///", A_ScriptDir, "\", filename)
      inited := true
    }
    else{
      ui.OnEvent('Close', (*) => (wvc := wv := 0))
      ui.Show(Format('w{} h{}', A_ScreenWidth * 0.6, A_ScreenHeight * 0.6))
      wvc := WebView2.CreateControllerAsync(ui.Hwnd).await2()
      wv := wvc.CoreWebView2
      wv.Navigate(html)
      inited := true
    }
  }else{MsgBox "Program already got initialized!}
SeeWebPage()
  if inited
  {
    wv.AddHostObjectToScript('ahk', {str:'str from ahk',func:MsgBox})
    ui.Show(Format('w{} h{}', A_ScreenWidth * 0.6, A_ScreenHeight * 0.6))
  }else{MsgBox "Program need init!"}
SeeHtmlCode(&isFile, &filename, &htmlVar)
  if inited || gotHtml{
    if isFile{MsgBox(Open(filename))}
    else{MsgBox(htmlVar)}
  }else{MsgBox "program need init or any html code!"}
EditCode(&isFile, $newFilename, &newHtml)
  if (!(isFile))
  {
    html := newHtml
    gotHtml := true
  }
  else
  {
    html := Open(newFilename)
    gotHtml = true
  }
