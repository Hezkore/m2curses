Namespace m2curses

#Import "<std>"
#Import "<libc>"
Using std..
Using libc..

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
	
	Class Window Extends Void="WINDOW"
	End
	
	Class Screen Extends Void="SCREEN"
	End
	
	Struct mmask_t
	End
	
	Struct MouseEvent="MEVENT"
		field id:Short
		field x:Int
		field y:Int
		field z:Int
		field bstate:mmask_t
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
	
	#If __TARGET__="windows"
		Function getmouse:Int(event:MouseEvent Ptr)="nc_getmouse"
	#Else
		Function getmouse:Int(event:MouseEvent Ptr)
	#Endif
	
	'/Standard /
	
	Function addch:Int( Int )
	Function addchnstr:Int( Int, Int )
	Function addchstr:Int( Int )
	Function addnstr:Int( CString, Int )
	Function addstr:Int( CString )
	Function attroff:Int( Int )
	Function attron:Int( Int )
	Function attrset:Int( Int )
	Function attr_get:Int( attribute:Int, Short )
	Function attr_off:Int( attribute:Int )
	Function attr_on:Int( attribute:Int )
	Function attr_set:Int( attribute:Int, Short )
	Function baudrate:Int()
	Function beep:Int()
	Function bkgd:Int( Int )
	Function bkgdset:Void( Int )
	Function border:Int( Int, Int, Int, Int, Int, Int, Int, Int )
	Function box:Int( Window, Int, Int )
	Function can_change_color:Bool()
	Function cbreak:Int()
	Function chgat:Int( Int, attribute:Int, Short )
	Function clearok:Int( Window, Bool )
	Function clear:Int()
	Function clrtobot:Int()
	Function clrtoeol:Int()
	Function color_content:Int( Short, Short, Short, Short )
	Function color_set:Int( Short )
	Function copywin:Int( Window, Window, Int, Int, Int, Int, Int, Int, Int )
	Function curs_set:Int( Int )
	Function def_prog_mode:Int()
	Function def_shell_mode:Int()
	Function delay_output:Int( Int )
	Function delch:Int()
	Function deleteln:Int()
	Function delscreen:Void( Screen )
	Function delwin:Int( Window )
	Function derwin:Window( Window, Int, Int, Int, Int )
	Function doupdate:Int()
	Function dupwin:Window( Window )
	Function echochar:Int( Int )
	Function echo:Int()
	Function endwin:Int()
	Function erasechar:CString()
	Function erase:Int()
	Function filter:Void()
	Function flash:Int()
	Function flushinp:Int()
	Function getbkgd:Int( Window )
	Function getnstr:Int( CString, Int )
	Function getstr:Int( CString )
	Function getwin:Window( FILE )
	Function halfdelay:Int( Int )
	Function has_colors:Bool()
	Function has_ic:Bool()
	Function has_il:Bool()
	Function hline:Int( Int, Int )
	Function idcok:Void( Window, Bool )
	Function idlok:Int( Window, Bool )
	Function immedok:Void( Window, Bool )
	Function inchnstr:Int( Int, Int )
	Function inchstr:Int( Int )
	Function inch:Int()
	Function init_color:Int( Short, Short, Short, Short )
	Function init_pair:Int( Short, Short, Short )
	Function initscr:Window()
	Function innstr:Int( CString, Int )
	Function insch:Int( Int )
	Function insdelln:Int( Int )
	Function insertln:Int()
	Function insnstr:Int( CString, Int )
	Function insstr:Int( CString )
	Function instr:Int( CString )
	Function intrflush:Int( Window, Bool )
	Function isendwin:Bool()
	Function is_linetouched:Bool( Window, Int )
	Function is_wintouched:Bool( Window )
	Function keyname:CString( Int )
	Function keypad:Int( Window, Bool )
	Function killchar:CString()
	Function leaveok:Int( Window, Bool )
	Function longname:CString()
	Function meta:Int( Window, Bool )
	Function move:Int( Int, Int )
	Function mvaddch:Int( Int, Int, Int )
	Function mvaddchnstr:Int( Int, Int, Int, Int )
	Function mvaddchstr:Int( Int, Int, Int )
	Function mvaddnstr:Int( Int, Int, CString, Int )
	Function mvaddstr:Int( Int, Int, CString )
	Function mvchgat:Int( Int, Int, Int, attribute:Int, Short )
	Function mvcur:Int( Int, Int, Int, Int )
	Function mvdelch:Int( Int, Int )
	Function mvderwin:Int( Window, Int, Int )
	Function mvgetch:Int( Int, Int )
	Function mvgetnstr:Int( Int, Int, CString, Int )
	Function mvgetstr:Int( Int, Int, CString )
	Function mvhline:Int( Int, Int, Int, Int )
	Function mvinch:Int( Int, Int )
	Function mvinchnstr:Int( Int, Int, Int, Int )
	Function mvinchstr:Int( Int, Int, Int )
	Function mvinnstr:Int( Int, Int, CString, Int )
	Function mvinsch:Int( Int, Int, Int )
	Function mvinsnstr:Int( Int, Int, CString, Int )
	Function mvinsstr:Int( Int, Int, CString )
	Function mvinstr:Int( Int, Int, CString )
	Function mvprintw:Int( Int, Int, CString )
	Function mvscanw:Int( Int, Int, CString )
	Function mvvline:Int( Int, Int, Int, Int )
	Function mvwaddchnstr:Int( Window, Int, Int, Int, Int )
	Function mvwaddchstr:Int( Window, Int, Int, Int )
	Function mvwaddch:Int( Window, Int, Int, Int )
	Function mvwaddnstr:Int( Window, Int, Int, CString, Int )
	Function mvwaddstr:Int( Window, Int, Int, CString )
	Function mvwchgat:Int( Window, Int, Int, Int, attribute:Int, Short )
	Function mvwdelch:Int( Window, Int, Int )
	Function mvwgetch:Int( Window, Int, Int )
	Function mvwgetnstr:Int( Window, Int, Int, CString, Int )
	Function mvwgetstr:Int( Window, Int, Int, CString )
	Function mvwhline:Int( Window, Int, Int, Int, Int )
	Function mvwinchnstr:Int( Window, Int, Int, Int, Int )
	Function mvwinchstr:Int( Window, Int, Int, Int )
	Function mvwinch:Int( Window, Int, Int )
	Function mvwinnstr:Int( Window, Int, Int, CString, Int )
	Function mvwinsch:Int( Window, Int, Int, Int )
	Function mvwinsnstr:Int( Window, Int, Int, CString, Int )
	Function mvwinsstr:Int( Window, Int, Int, CString )
	Function mvwinstr:Int( Window, Int, Int, CString )
	Function mvwin:Int( Window, Int, Int )
	Function mvwprintw:Int( Window, Int, Int, CString )
	Function mvwscanw:Int( Window, Int, Int, CString )
	Function mvwvline:Int( Window, Int, Int, Int, Int )
	Function napms:Int( Int )
	Function newpad:Window( Int, Int )
	Function newterm:Screen( CString, FILE, FILE )
	Function newwin:Window( Int, Int, Int, Int )
	Function nl:Int()
	Function nocbreak:Int()
	Function nodelay:Int( Window, Bool )
	Function noecho:Int()
	Function nonl:Int()
	Function noqiflush:Void()
	Function noraw:Int()
	Function notimeout:Int( Window, Bool )
	Function overlay:Int( Window, Window )
	Function overwrite:Int( Window, Window )
	Function pair_content:Int( Short, Short, Short )
	Function pechochar:Int( Window, Int )
	Function pnoutrefresh:Int( Window, Int, Int, Int, Int, Int, Int )
	Function prefresh:Int( Window, Int, Int, Int, Int, Int, Int )
	Function printw:Int( CString )
	Function putwin:Int( Window, FILE )
	Function qiflush:Void()
	Function raw:Int()
	Function redrawwin:Int( Window )
	Function refresh:Int()
	Function reset_prog_mode:Int()
	Function reset_shell_mode:Int()
	Function resetty:Int()
	Function ripoffline:Int( Int, func:Int(Window, int) )
	Function savetty:Int()
	Function scanw:Int( CString )
	Function scr_dump:Int( CString )
	Function scr_init:Int( CString )
	Function scr_restore:Int( CString )
	Function scr_set:Int( CString )
	Function scrl:Int( Int )
	Function scroll:Int( Window )
	Function scrollok:Int( Window, Bool )
	Function set_term:Screen( Screen )
	Function setscrreg:Int( Int, Int )
	Function slk_attroff:Int( Int )
	Function slk_attr_off:Int( attribute:Int )
	Function slk_attron:Int( Int )
	Function slk_attr_on:Int( attribute:Int )
	Function slk_attrset:Int( Int )
	Function slk_attr_set:Int( attribute:Int, Short )
	Function slk_clear:Int()
	Function slk_color:Int( Short )
	Function slk_init:Int( Int )
	Function slk_label:CString( Int )
	Function slk_noutrefresh:Int()
	Function slk_refresh:Int()
	Function slk_restore:Int()
	Function slk_set:Int( Int, CString, Int )
	Function slk_touch:Int()
	Function standend:Int()
	Function standout:Int()
	Function start_color:Int()
	Function subpad:Window( Window, Int, Int, Int, Int )
	Function subwin:Window( Window, Int, Int, Int, Int )
	Function syncok:Int( Window, Bool )
	Function termattrs:Int()
	Function term_attrs:Int()
	Function termname:CString()
	Function timeout:Void( Int )
	Function touchline:Int( Window, Int, Int )
	Function touchwin:Int( Window )
	Function typeahead:Int( Int )
	Function untouchwin:Int( Window )
	Function use_env:Void( Bool )
	Function vidattr:Int( Int )
	Function vid_attr:Int( attribute:Int, Short )
	Function vidputs:Int( Int, func:Int( Int ) )
	Function vid_puts:Int( attribute:Int, Short, void, func:Int( Int ) )
	Function vline:Int( Int, Int )
'	Function vw_printw:Int( Window, CString, va_list )
'	Function vwprintw:Int( Window, CString, va_list )
'	Function vw_scanw:Int( Window, CString, va_list )
'	Function vwscanw:Int( Window, CString, va_list )
	Function waddchnstr:Int( Window, Int, Int )
	Function waddchstr:Int( Window, Int )
	Function waddch:Int( Window, Int )
	Function waddnstr:Int( Window, CString, Int )
	Function waddstr:Int( Window, CString )
	Function wattroff:Int( Window, Int )
	Function wattron:Int( Window, Int )
	Function wattrset:Int( Window, Int )
	Function wattr_get:Int( Window, attribute:Int, Short )
	Function wattr_off:Int( Window, attribute:Int )
	Function wattr_on:Int( Window, attribute:Int )
	Function wattr_set:Int( Window, attribute:Int, Short )
	Function wbkgdset:Void( Window, Int )
	Function wbkgd:Int( Window, Int )
	Function wborder:Int( Window, Int, Int, Int, Int, Int, Int, Int, Int )
	Function wchgat:Int( Window, Int, attribute:Int, Short )
	Function wclear:Int( Window )
	Function wclrtobot:Int( Window )
	Function wclrtoeol:Int( Window )
	Function wcolor_set:Int( Window, Short )
	Function wcursyncup:Void( Window )
	Function wdelch:Int( Window )
	Function wdeleteln:Int( Window )
	Function wechochar:Int( Window, Int )
	Function werase:Int( Window )
	Function wgetch:Int( Window )
	Function wgetnstr:Int( Window, CString, Int )
	Function wgetstr:Int( Window, CString )
	Function whline:Int( Window, Int, Int )
	Function winchnstr:Int( Window, Int, Int )
	Function winchstr:Int( Window, Int )
	Function winch:Int( Window )
	Function winnstr:Int( Window, CString, Int )
	Function winsch:Int( Window, Int )
	Function winsdelln:Int( Window, Int )
	Function winsertln:Int( Window )
	Function winsnstr:Int( Window, CString, Int )
	Function winsstr:Int( Window, CString )
	Function winstr:Int( Window, CString )
	Function wmove:Int( Window, Int, Int )
	Function wnoutrefresh:Int( Window )
	Function wprintw:Int( Window, CString )
	Function wredrawln:Int( Window, Int, Int )
	Function wrefresh:Int( Window )
	Function wscanw:Int( Window, CString )
	Function wscrl:Int( Window, Int )
	Function wsetscrreg:Int( Window, Int, Int )
	Function wstandend:Int( Window )
	Function wstandout:Int( Window )
	Function wsyncdown:Void( Window )
	Function wsyncup:Void( Window )
	Function wtimeout:Void( Window, Int )
	Function wtouchln:Int( Window, Int, Int, Int )
	Function wvline:Int( Window, Int, Int )
	
	'/Wide-character functions /
	
	#rem PDC_WIDE
	Function int addnwstr( wchar_t, Int )
	Function int addwstr( wchar_t )
	Function int add_wch( cchar_t )
	Function int add_wchnstr( cchar_t, Int )
	Function int add_wchstr( cchar_t )
	Function int bkgrnd( cchar_t )
	Function void bkgrndset( cchar_t )
	Function int border_set( cchar_t, cchar_t, cchar_t ,
	 cchar_t, cchar_t, cchar_t ,
	 cchar_t, cchar_t )
	Function int box_set(Window, cchar_t, cchar_t )
	Function int echo_wchar( cchar_t )
	Function int erasewchar(wchar_t )
	Function int getbkgrnd(cchar_t )
	Function int getcchar( cchar_t, wchar_t, attribute:Int, Short )
	Function int getn_wstr(wint_t, Int )
	Function int get_wch(wint_t )
	Function int get_wstr(wint_t )
	Function int hline_set( cchar_t, Int )
	Function int innwstr(wchar_t, Int )
	Function int ins_nwstr( wchar_t, Int )
	Function int ins_wch( cchar_t )
	Function int ins_wstr( wchar_t )
	Function int inwstr(wchar_t )
	Function int in_wch(cchar_t )
	Function int in_wchnstr(cchar_t, Int )
	Function int in_wchstr(cchar_t )
	Function CString key_name(wchar_t )
	Function int killwchar(wchar_t )
	Function int mvaddnwstr(Int, Int, wchar_t, Int )
	Function int mvaddwstr(Int, Int, wchar_t )
	Function int mvadd_wch(Int, Int, cchar_t )
	Function int mvadd_wchnstr(Int, Int, cchar_t, Int )
	Function int mvadd_wchstr(Int, Int, cchar_t )
	Function int mvgetn_wstr(Int, Int, wint_t, Int )
	Function int mvget_wch(Int, Int, wint_t )
	Function int mvget_wstr(Int, Int, wint_t )
	Function int mvhline_set(Int, Int, cchar_t, Int )
	Function int mvinnwstr(Int, Int, wchar_t, Int )
	Function int mvins_nwstr(Int, Int, wchar_t, Int )
	Function int mvins_wch(Int, Int, cchar_t )
	Function int mvins_wstr(Int, Int, wchar_t )
	Function int mvinwstr(Int, Int, wchar_t )
	Function int mvin_wch(Int, Int, cchar_t )
	Function int mvin_wchnstr(Int, Int, cchar_t, Int )
	Function int mvin_wchstr(Int, Int, cchar_t )
	Function int mvvline_set(Int, Int, cchar_t, Int )
	Function int mvwaddnwstr(Window, Int, Int, wchar_t, Int )
	Function int mvwaddwstr(Window, Int, Int, wchar_t )
	Function int mvwadd_wch(Window, Int, Int, cchar_t )
	Function int mvwadd_wchnstr(Window, Int, Int, cchar_t, Int )
	Function int mvwadd_wchstr(Window, Int, Int, cchar_t )
	Function int mvwgetn_wstr(Window, Int, Int, wint_t, Int )
	Function int mvwget_wch(Window, Int, Int, wint_t )
	Function int mvwget_wstr(Window, Int, Int, wint_t )
	Function int mvwhline_set(Window, Int, Int, cchar_t, Int )
	Function int mvwinnwstr(Window, Int, Int, wchar_t, Int )
	Function int mvwins_nwstr(Window, Int, Int, wchar_t, Int )
	Function int mvwins_wch(Window, Int, Int, cchar_t )
	Function int mvwins_wstr(Window, Int, Int, wchar_t )
	Function int mvwin_wch(Window, Int, Int, cchar_t )
	Function int mvwin_wchnstr(Window, Int, Int, cchar_t, Int )
	Function int mvwin_wchstr(Window, Int, Int, cchar_t )
	Function int mvwinwstr(Window, Int, Int, wchar_t )
	Function int mvwvline_set(Window, Int, Int, cchar_t, Int )
	Function int pecho_wchar(Window, cchar_t)
	Function int setcchar(cchar_t, wchar_t, attribute:Int,
	 Short, void)
	Function int slk_wset(Int, wchar_t, Int )
	Function int unget_wch( wchar_t )
	Function int vline_set( cchar_t, Int )
	Function int waddnwstr(Window, wchar_t, Int )
	Function int waddwstr(Window, wchar_t )
	Function int wadd_wch(Window, cchar_t )
	Function int wadd_wchnstr(Window, cchar_t, Int )
	Function int wadd_wchstr(Window, cchar_t )
	Function int wbkgrnd(Window, cchar_t )
	Function void wbkgrndset(Window, cchar_t )
	Function int wborder_set(Window, cchar_t, cchar_t ,
	 cchar_t, cchar_t, cchar_t ,
	 cchar_t, cchar_t, cchar_t )
	Function int wecho_wchar(Window, cchar_t )
	Function int wgetbkgrnd(Window, cchar_t )
	Function int wgetn_wstr(Window, wint_t, Int )
	Function int wget_wch(Window, wint_t )
	Function int wget_wstr(Window, wint_t )
	Function int whline_set(Window, cchar_t, Int )
	Function int winnwstr(Window, wchar_t, Int )
	Function int wins_nwstr(Window, wchar_t, Int )
	Function int wins_wch(Window, cchar_t )
	Function int wins_wstr(Window, wchar_t )
	Function int winwstr(Window, wchar_t )
	Function int win_wch(Window, cchar_t )
	Function int win_wchnstr(Window, cchar_t, Int )
	Function int win_wchstr(Window, cchar_t )
	Function wchar_t wunctrl(cchar_t )
	Function int wvline_set(Window, cchar_t, Int )
	#end
	
	'/Quasi-standard /
	
	Function getattrs:Int( Window )
	Function getbegx:Int( Window )
	Function getbegy:Int( Window )
	Function getmaxx:Int( Window )
	Function getmaxy:Int( Window )
	Function getparx:Int( Window )
	Function getpary:Int( Window )
	Function getcurx:Int( Window )
	Function getcury:Int( Window )
	Function traceoff:Void()
	Function traceon:Void()
	Function unctrl:CString( Int )
	Function crmode:Int()
	Function nocrmode:Int()
	Function draino:Int( Int )
	Function resetterm:Int()
	Function fixterm:Int()
	Function saveterm:Int()
	Function setsyx:Int( Int, Int )
	Function mouse_set:Int( ULong )
	Function mouse_on:Int( ULong )
	Function mouse_off:Int( ULong )
	Function request_mouse_pos:Int()
	Function map_button:Int( ULong )
	Function wmouse_position:Void( Window, Int, Int )
'	Function getmouse:ULong()
	Function getbmap:ULong()
	
	'/ncurses /
	
	Function assume_default_colors:Int( Int, Int )
	Function curses_version:CString()
	Function has_key:Bool( Int )
	Function use_default_colors:Int()
	Function wresize:Int( Window, Int, Int )
	Function mouseinterval:Int( Int )
	Function mousemask:mmask_t( mmask_t, mmask_t Ptr )
	Function mouse_trafo:Bool( Int, Int, Bool )
'	Function nc_getmouse:Int(MouseEvent )
	Function ungetmouse:Int(MouseEvent )
	Function wenclose:Bool( Window, Int, Int )
	Function wmouse_trafo:Bool( Window, Int, Int, Bool )
	
	'/*** Functions defined as macros ***/
	
	'/* getch() and ungetch() conflict with some DOS libraries */
	
	'#define getch()            wgetch(stdscr)
	'#define ungetch(ch)        PDC_ungetch(ch)
	
	Function COLOR_PAIR:Int( pair:Int )
	Function PAIR_NUMBER:Int( number:Int )

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
	
	Local e:MouseEvent
	
	While True
		Local key:=wgetch(w)
		wattron(w, COLOR_PAIR(2) )
		mvwprintw(w,6,2,"key="+key+" ")
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