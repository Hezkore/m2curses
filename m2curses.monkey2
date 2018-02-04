Namespace m2curses

#Import "<std>"
'#Import "<libc>"

#If __TARGET__="windows"
	
	#Import "makefile_windows"
	#Import "<curses.h>"
	
#ElseIf __TARGET__="macos"
	
	'#Import "makefile_macos"
	
#ElseIf __TARGET__="linux"
	
	#Import "<libncurses.a>"
	#Import "<ncurses.h>"
#Endif

Extern
	Struct mmask_t
	End
	
	Struct MoveEvent="MEVENT"
		field id:Short
		field x:Int
		field y:Int
		field z:Int
		field bstate:mmask_t
	End
	
	Class Window Extends Void="WINDOW"
	End
	
	Const ALL_MOUSE_EVENTS:mmask_t
	
	Const OK:Int
	
	Const stdscr:Window
	Const A_STANDOUT:Int
	Const A_UNDERLINE:Int
	Const A_REVERSE:Int
	Const A_PROTECT:Int
	Const A_INVIS:Int
	Const A_DIM:Int
	Const A_BOLD:Int
	Const A_BLINK:Int
	Const A_ALTCHARSET:Int
	
	Const A_ATTRIBUTES:Int
	Const A_CHARTEXT:Int
	Const A_COLOR:Int
	
	Global COLS:Int
	Global LINES:Int
	
	Const KEY_MOUSE:Int
	Const KEY_DOWN:Int
	Const KEY_UP:Int
	Const KEY_LEFT:Int
	Const KEY_RIGHT:Int
	Const KEY_HOME:Int
	Const KEY_BACKSPACE:Int
	Const KEY_DC:Int
	Const KEY_IC:Int
	Const KEY_ENTER:Int
	Const KEY_F1:Int
	Const KEY_F2:Int
	Const KEY_F3:Int
	
	Const COLOR_BLACK:Int
	Const COLOR_BLUE:Int
	Const COLOR_GREEN:Int
	Const COLOR_CYAN:Int
	Const COLOR_RED:Int
	Const COLOR_MAGENTA:Int
	Const COLOR_YELLOW:Int
	Const COLOR_WHITE:Int
	
	Function initscr()
	Function noecho()
	Function nodelay:Int( Window, Bool )
	Function echo()
	Function raw()
	Function noraw()
	Function prIntw:Int(text:CString)
	Function refresh:Int()
	Function clear:Int()
	Function getch:Int()
	Function curs_set(cursor:Int)
	
	Function use_default_colors:Int()
	Function assume_default_colors:Int(fg:Int, bg:Int)
	Function has_colors:Bool()
	Function start_color:Int()
	Function init_pair:Int(pair:Short, fg:Short, bg:Short)
	Function can_change_color:Bool()
	Function init_color(color:Short, r:Short, g:Short, b:Short)
	
	Function newwin:Window(w:Int,h:Int,x:Int,y:Int)
	Function wclear(window:Window)
	Function wrefresh(window:Window)
	Function box(window:Window,a:Int,b:Int)
	Function wprIntw(window:Window,text:CString)
	Function mvwprintw(window:Window,y:Int,x:Int,text:CString)
	Function delwin(window:Window)
	Function wgetch:Int(window:Window)
	Function endwin:Int()
	
	Function wattron(window:Window,attribute:Int)
	Function wattroff(window:Window,attribute:Int)
	
	Function keypad(window:Window,enable:Bool)
	
	#If __TARGET__="windows"
		Function getmouse:Int(event:MoveEvent Ptr)="nc_getmouse"
	#Else
		Function getmouse:Int(event:MoveEvent Ptr)
	#Endif
	
	Function mousemask:mmask_t(events:mmask_t, oldmask:mmask_t ptr)
	
	Function COLOR_PAIR:Int(pair:Short)
Public

Function Main()
	
	initscr()
	nodelay( stdscr, True )
	noecho()
	
	curs_set(0)
	start_color()
'	assume_default_colors(8,-1)
'	use_default_colors()
	
	
	
	Local w:=newwin(10,32,4,(COLS-32)/2)
	'Local p:=init_pair(1, COLOR_GREEN, COLOR_BLACK)
	
	init_pair(1, COLOR_RED, COLOR_BLACK)
	init_pair(2, COLOR_GREEN, COLOR_BLACK)
	init_pair(3, COLOR_CYAN, COLOR_BLACK)
	
	wattron(w,COLOR_PAIR(0))
	
	Local oldmask:mmask_t
	Local newmask:=mousemask(ALL_MOUSE_EVENTS, Varptr oldmask)
	
	box(w,0,0)
	wattron(w,COLOR_PAIR(1))
	mvwprintw(w,1,2,"has_colors="+(has_colors()?"True"Else"false"))
	wattroff(w,COLOR_PAIR(1))
	mvwprintw(w,2,2,"can_change_colors="+(can_change_color()?"True"Else"false"))
	wattron(w,A_BOLD)
	mvwprintw(w,4,2,"("+LINES+","+COLS+")")
	wattroff(w,A_BOLD)
	mvwprintw(w,8,2,"Escape/Q To Quit")
	
	wrefresh(w)
	
	keypad(w,True)
	
	Local e:MoveEvent
	
	While True
		Local key:=wgetch(w)
		wattron(w, COLOR_PAIR(2) )
		mvwprintw(w,6,2,"key="+key+"  ")
		wattroff(w, COLOR_PAIR(2) )
		If key=27 exit
		If key=113 exit
		If key=KEY_MOUSE
			Local r:=getmouse(Varptr e)
			If r=OK
				Local bits:Int'=e.bstate
				wattron(w, COLOR_PAIR(3) )
				mvwprintw(w,5,2,"mouse="+e.id+","+e.x+","+e.y+","+e.z+","+bits)
				wattroff(w, COLOR_PAIR(3) )
			Endif
		Endif
	Wend
	
	endwin()
End