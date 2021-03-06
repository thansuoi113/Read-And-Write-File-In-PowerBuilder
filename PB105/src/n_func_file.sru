$PBExportHeader$n_func_file.sru
forward
global type n_func_file from nonvisualobject
end type
end forward

global type n_func_file from nonvisualobject autoinstantiate
end type

forward prototypes
public function integer readfile (string as_file, ref blob rblob_file)
public function integer readtext (string as_file, ref string rs_text)
public function integer readlines (string as_file, ref string rs_line[])
public function integer writefile (string as_file, blob ablob_file)
public function integer writetext (string as_file, string as_text)
public function integer appendtext (string as_file, string as_text)
public function integer appendfile (string as_file, blob ablob_file)
end prototypes

public function integer readfile (string as_file, ref blob rblob_file);//====================================================================
// Function: n_func_file.readfile()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    	string	as_file   	
// 	reference	blob  	rblob_file	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2022/02/23
//--------------------------------------------------------------------
// Usage: n_func_file.readfile ( string as_file, ref blob rblob_file )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long ll_len
Long ll_loop,i
Int li_filenum,li_read
Blob lblob_read,lblob_file

ll_len = FileLength(as_file)
ll_loop = ll_len / 32765
If Mod(ll_len,32765) <> 0 Then ll_loop += 1

li_filenum = FileOpen(as_file,streammode!,Read!,lockread!)
If li_filenum < 0 Then Return li_filenum

For i = 1 To ll_loop
	li_read = FileRead(li_filenum,lblob_read)
	If li_read < 0 Then Return li_read
	lblob_file += lblob_read
Next
FileClose(li_filenum)

rblob_file = lblob_file
Return 0

end function

public function integer readtext (string as_file, ref string rs_text);//====================================================================
// Function: n_func_file.readtext()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    	string	as_file	
// 	reference	string	rs_text	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2022/02/23
//--------------------------------------------------------------------
// Usage: n_func_file.readtext ( string as_file, ref string rs_text )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long ll_len
Long ll_loop,i
Int li_filenum,li_read
String ls_read,ls_file

ll_len = FileLength(as_file)
ll_loop = ll_len / 32765
If Mod(ll_len,32765) <> 0 Then ll_loop += 1

li_filenum = FileOpen(as_file,streammode!,Read!,lockread!)
If li_filenum < 0 Then Return li_filenum

For i = 1 To ll_loop
	li_read = FileRead(li_filenum,ls_read)
	If li_read < 0 Then Return li_read
	ls_file += ls_read
Next
FileClose(li_filenum)

rs_text = ls_file
Return 0

end function

public function integer readlines (string as_file, ref string rs_line[]);//====================================================================
// Function: n_func_file.readlines()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    	string	as_file  	
// 	reference	string	rs_line[]	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2022/02/23
//--------------------------------------------------------------------
// Usage: n_func_file.readlines ( string as_file, ref string rs_line[] )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Int li_filenum,li_read
String ls_read,ls_line[]
Long i

li_filenum = FileOpen(as_file,LineMode!,Read!,LockRead!)
If li_filenum < 0 Then Return li_filenum

Do While FileRead(li_filenum,ls_read) >= 0
	i += 1
	ls_line[i] = ls_read
Loop

FileClose(li_filenum)

rs_line = ls_line
Return 0

end function

public function integer writefile (string as_file, blob ablob_file);//====================================================================
// Function: n_func_file.writefile()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value	string	as_file   	
// 	value	blob  	ablob_file	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2022/02/23
//--------------------------------------------------------------------
// Usage: n_func_file.writefile ( string as_file, blob ablob_file )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long ll_len
Long ll_loop,i
Int li_filenum,li_write
Blob lblob_write

ll_len = Len(ablob_file)
ll_loop = ll_len / 32765
If Mod(ll_len,32765) <> 0 Then ll_loop += 1

li_filenum = FileOpen(as_file,StreamMode!,Write!,LockWrite!,Replace!)
If li_filenum < 0 Then Return li_filenum

For i = 1 To ll_loop
	lblob_write = BlobMid(ablob_file,(i - 1)*32765 + 1,32765)
	li_write = FileWrite(li_filenum,lblob_write)
	If li_write < 0 Then Return li_write
Next

FileClose(li_filenum)
Return 0

end function

public function integer writetext (string as_file, string as_text);//====================================================================
// Function: n_func_file.writetext()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value	string	as_file	
// 	value	string	as_text	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2022/02/23
//--------------------------------------------------------------------
// Usage: n_func_file.writetext ( string as_file, string as_text )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long ll_len
Long ll_loop,i
Int li_filenum,li_write
String ls_write

ll_len = Len(as_text)
ll_loop = ll_len / 16382
If Mod(ll_len,16382) <> 0 Then ll_loop += 1

li_filenum = FileOpen(as_file,StreamMode!,Write!,LockWrite!,Replace!)
If li_filenum < 0 Then Return li_filenum

For i = 1 To ll_loop
	ls_write = Mid(as_text,(i - 1)*16382 + 1,16382)
	li_write = FileWrite(li_filenum,ls_write)
	If li_write < 0 Then Return li_write
Next

FileClose(li_filenum)
Return 0

end function

public function integer appendtext (string as_file, string as_text);//====================================================================
// Function: n_func_file.appendtext()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value	string	as_file	
// 	value	string	as_text	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2022/02/23
//--------------------------------------------------------------------
// Usage: n_func_file.appendtext ( string as_file, string as_text )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long ll_len
Long ll_loop,i
Int li_filenum,li_write
String ls_write

ll_len = Len(as_text)
ll_loop = ll_len / 16382
If Mod(ll_len,16382) <> 0 Then ll_loop += 1

li_filenum = FileOpen(as_file,StreamMode!,Write!,LockWrite!,Append!)
If li_filenum < 0 Then Return li_filenum

For i = 1 To ll_loop
	ls_write = Mid(as_text,(i - 1)*16382 + 1,16382)
	li_write = FileWrite(li_filenum,ls_write)
	If li_write < 0 Then Return li_write
Next

FileClose(li_filenum)
Return 0

end function

public function integer appendfile (string as_file, blob ablob_file);//====================================================================
// Function: n_func_file.appendfile()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value	string	as_file   	
// 	value	blob  	ablob_file	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2022/02/23
//--------------------------------------------------------------------
// Usage: n_func_file.appendfile ( string as_file, blob ablob_file )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long ll_len
Long ll_loop,i
Int li_filenum,li_write
Blob lblob_write

ll_len = Len(ablob_file)
ll_loop = ll_len / 32765
If Mod(ll_len,32765) <> 0 Then ll_loop += 1

li_filenum = FileOpen(as_file,StreamMode!,Write!,LockWrite!,Append!)
If li_filenum < 0 Then Return li_filenum

For i = 1 To ll_loop
	lblob_write = BlobMid(ablob_file,(i - 1)*32765 + 1,32765)
	li_write = FileWrite(li_filenum,lblob_write)
	If li_write < 0 Then Return li_write
Next

FileClose(li_filenum)
Return 0

end function

on n_func_file.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_func_file.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

