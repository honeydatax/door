#include "string.bi"
#include "dir.bi" 
public const backs=5
public const brish=8
public const black=0
public const x=640
public const y=480
public const bcolrs=4
dim shared hallx(0 to 8) as integer
dim shared hally(0 to 8) as integer
dim shared dirs(0 to 500) as string
dim shared dirss as string
Sub list_files (ByRef filespec As String, ByVal attrib As Integer)
    Dim As String filename = Dir(filespec, attrib) 
    dim idx as integer
    Do While Len(filename) > 0 
        dirs(idx)= Dir() 
        idx=idx+1
        if idx>498 then exit do
    Loop
End Sub
public function center(max as integer,sizes as integer)as integer
	dim i as integer
	i=max/2-sizes/2
	return i
end function
public sub corridor(sizesx as integer,sizesy as integer)
	dim i as integer
	line(center(x,sizesx),center(y,sizesy))-(center(x,sizesx)+sizesx,center(y,sizesy)+sizesy),black,b
end sub
public sub startx()
	screenres x,y,bcolrs
	line(0,0)-(x,y),backs,bf
	line(0,0)-(x,y),black
	line(0,y)-(x,0),black
end sub

dim xi as integer
dim yi as integer
dim i as integer
dim key as integer
dim res as integer
dim xx as integer
dim yy as integer
dim buttons as integer
xi=x
yi=y

startx
for i=0 to 6
	hallx(i)=xi
	hally(i)=yi
	corridor xi,yi
	xi=xi/2
	yi=yi/2
next
list_files "*", fbArchive
while asc(inkey())=0
res = GetMouse (xx, yy, , buttons)	
for i=6 to 0 step -1
	if xx>center(x,hallx(i)) and yy>center(y,hally(i)) and xx<center(x,hallx(i))+hallx(i) and yy<center(y,hally(i))+hally(i) then 
		if dirss<>dirs(i) then
			dirss=dirs(i)
			windowtitle dirss
		end if
		exit for
		i=-1
	end if
next
wend
