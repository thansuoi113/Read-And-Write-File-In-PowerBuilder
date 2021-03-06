$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type mle_1 from multilineedit within w_main
end type
type lb_1 from listbox within w_main
end type
type cb_8 from commandbutton within w_main
end type
type cb_7 from commandbutton within w_main
end type
type cb_6 from commandbutton within w_main
end type
type cb_5 from commandbutton within w_main
end type
type cb_4 from commandbutton within w_main
end type
type cb_3 from commandbutton within w_main
end type
type cb_2 from commandbutton within w_main
end type
type cb_1 from commandbutton within w_main
end type
type sle_1 from singlelineedit within w_main
end type
type st_1 from statictext within w_main
end type
end forward

global type w_main from window
integer width = 2254
integer height = 1412
boolean titlebar = true
string title = "Read And Write File Text"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mle_1 mle_1
lb_1 lb_1
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
sle_1 sle_1
st_1 st_1
end type
global w_main w_main

on w_main.create
this.mle_1=create mle_1
this.lb_1=create lb_1
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_1=create sle_1
this.st_1=create st_1
this.Control[]={this.mle_1,&
this.lb_1,&
this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.sle_1,&
this.st_1}
end on

on w_main.destroy
destroy(this.mle_1)
destroy(this.lb_1)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.st_1)
end on

type mle_1 from multilineedit within w_main
integer x = 1120
integer y = 620
integer width = 910
integer height = 644
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type lb_1 from listbox within w_main
integer x = 69
integer y = 620
integer width = 910
integer height = 644
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_8 from commandbutton within w_main
integer x = 1367
integer y = 340
integer width = 672
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Write Append Blob Text"
end type

event clicked;n_func_file ln_file
String ls_text
String ls_file
Int li_ret
Blob lblb_text

ls_file = sle_1.Text
ls_text = mle_1.Text
If IsNull(ls_file) Or Len(Trim(ls_file)) = 0 Then Return
If IsNull(ls_text) Or Len(Trim(ls_text)) = 0 Then Return

lblb_text = blob(ls_text, EncodingUTF8!)
li_ret = ln_file.appendfile( ls_file, lblb_text)
If li_ret <> 0 Then
	MessageBox("Warning", "Write File Error")
	Return
End If

end event

type cb_7 from commandbutton within w_main
integer x = 1367
integer y = 212
integer width = 672
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Write Blob Text"
end type

event clicked;n_func_file ln_file
String ls_text
String ls_file
Int li_ret
Blob lblb_text

ls_file = sle_1.Text
ls_text = mle_1.Text
If IsNull(ls_file) Or Len(Trim(ls_file)) = 0 Then Return
If IsNull(ls_text) Or Len(Trim(ls_text)) = 0 Then Return

lblb_text = blob(ls_text, EncodingUTF8!)
li_ret = ln_file.writefile( ls_file, lblb_text)
If li_ret <> 0 Then
	MessageBox("Warning", "Write File Error")
	Return
End If

end event

type cb_6 from commandbutton within w_main
integer x = 640
integer y = 340
integer width = 672
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Write Append Text"
end type

event clicked;n_func_file ln_file
String ls_text
String ls_file
Int li_ret

ls_file = sle_1.Text
ls_text = mle_1.Text
If IsNull(ls_file) Or Len(Trim(ls_file)) = 0 Then Return
If IsNull(ls_text) Or Len(Trim(ls_text)) = 0 Then Return

li_ret = ln_file.appendtext(ls_file, ls_text)
If li_ret <> 0 Then
	MessageBox("Warning", "Write File Error")
	Return
End If

end event

type cb_5 from commandbutton within w_main
integer x = 645
integer y = 212
integer width = 672
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Write Text"
end type

event clicked;n_func_file ln_file
String ls_text
String ls_file
Int li_ret

ls_file = sle_1.Text
ls_text = mle_1.Text
If IsNull(ls_file) Or Len(Trim(ls_file)) = 0 Then Return
If IsNull(ls_text) Or Len(Trim(ls_text)) = 0 Then Return

li_ret = ln_file.writetext( ls_file, ls_text)
If li_ret <> 0 Then
	MessageBox("Warning", "Write File Error")
	Return
End If

end event

type cb_4 from commandbutton within w_main
integer x = 142
integer y = 468
integer width = 448
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Read Blob Text"
end type

event clicked;n_func_file ln_file
String ls_text
String ls_file
Int li_ret, li_i
Blob lblb_text

mle_1.Text = ""
ls_file = sle_1.Text
If IsNull(ls_file) Or Len(Trim(ls_file)) = 0 Then Return
li_ret = ln_file.readfile( ls_file, lblb_text)
If li_ret <> 0 Then Return
ls_text = String(lblb_text, EncodingUTF8!)
mle_1.Text = ls_text


end event

type cb_3 from commandbutton within w_main
integer x = 1989
integer y = 40
integer width = 146
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "...."
end type

event clicked;string ls_path, ls_file
int li_rc

ls_path = sle_1.Text
li_rc = GetFileSaveName ( "Select File",  ls_path, ls_file, "*.*", "All Files (*.*),*.*" )
 
IF li_rc = 1 Then
   sle_1.Text = ls_path
End If
end event

type cb_2 from commandbutton within w_main
integer x = 137
integer y = 336
integer width = 448
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Read Text"
end type

event clicked;n_func_file ln_file
String ls_text
String ls_file
Int li_ret, li_i

mle_1.Text = ""
ls_file = sle_1.Text
If IsNull(ls_file) Or Len(Trim(ls_file)) = 0 Then Return
li_ret = ln_file.readtext( ls_file, ls_text)
If li_ret <> 0 Then Return

mle_1.Text = ls_text


end event

type cb_1 from commandbutton within w_main
integer x = 142
integer y = 212
integer width = 448
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Read Lines"
end type

event clicked;n_func_file ln_file
String ls_text[]
String ls_file
Int li_ret, li_i

lb_1.reset()
ls_file = sle_1.Text
If IsNull(ls_file) Or Len(Trim(ls_file)) = 0 Then Return
li_ret = ln_file.readlines( ls_file, ls_text)
If li_ret <> 0 Then Return

For li_i = 1 To UpperBound(ls_text)
	lb_1.additem( ls_text[li_i])
Next


end event

type sle_1 from singlelineedit within w_main
integer x = 238
integer y = 44
integer width = 1742
integer height = 104
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "pbfunc.txt"
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_main
integer x = 69
integer y = 64
integer width = 169
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "File:"
boolean focusrectangle = false
end type

