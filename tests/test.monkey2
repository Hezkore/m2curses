#Import "../m2curses"
Using m2curses..

Function Main()
	
	Local mainwin:Window
	Local childwin:Window
	Local ch:Int
	
	
	'/*  Set the dimensions and initial
	'	position for our child window   */
	
	Local width:Int = 23
	Local height:Int = 7
	Local rows:Int  = 25
	Local cols:Int   = 80
	Local x:Int = (cols - width)  / 2
	Local y:Int = (rows - height) / 2
	
	
	'/*  Initialize ncurses  */
	mainwin=initscr()
	If Not mainwin
		Print("Error initialising ncurses")
		Return
	Endif
	
	'/*  Switch of echoing and enable keypad (for arrow keys)  */
	
	noecho()
	keypad(mainwin, True)
	
	
	'/*  Make our child window, and add
	'	a border and some text to it.   */
	
	childwin = subwin(mainwin, height, width, y, x)
	box(childwin, 0, 0)
	mvwaddstr(childwin, 1, 4, "Move the window")
	mvwaddstr(childwin, 2, 2, "with the arrow keys")
	mvwaddstr(childwin, 3, 6, "or HOME/END")
	mvwaddstr(childwin, 5, 3, "Press 'q' to quit")
	
	'refresh()
	
	'/*  Loop until user hits 'q' to quit  */
	
	While ch<>"q"[0]
		ch=getch()
		
		Select ch
			Case KEY_UP
				If y>0 Then y-=1
			
			Case KEY_DOWN
				If y<rows-height Then y+=1
				
			Case KEY_LEFT
				If x>0 x-=1
			
			Case KEY_RIGHT
				If x<cols-width Then x+=1
			
			Case KEY_HOME
				x=0
				y=0
			
			Case KEY_END
				x=(cols - width)
				y=(rows - height)
			
		End
		
		mvwin(childwin, y, x)
		wrefresh( childwin )
	Wend
	
	
	'/*  Clean up after ourselves  */
	
'	delwin(childwin)
'	delwin(mainwin)
	endwin()
End