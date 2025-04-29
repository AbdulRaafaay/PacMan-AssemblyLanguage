include irvine32.inc
include macros.inc
includelib Winmm.lib

PlaySound PROTO,
pszSound: PTR BYTE,
hmod: DWORD,
fdwSound: DWORD

bufsize = 501

.data

p_name BYTE 20 dup (?)
file BYTE "Name_Score.txt",0
buffer BYTE bufsize dup (?)
handler DWORD ?
choice1 DWORD ?
back BYTE ?				; to come back to main menu
life DWORD 3
score DWORD 0
lev DWORD 1

SND_FILENAME DWORD 00020000h

pacman_beginning db 'pacman_beginning.wav', 0		; for sound
collect db 'pacman_chomp.wav', 0		; for sound
ghost_hit db 'ghost_hit.wav', 0		; for sound
over db 'gameover.wav', 0		; for sound
	
pacman_char BYTE 'X',0		; character for PACMAN


;--------------- MAP FOR LEVEL 1 ---------------------------

level1_map1  BYTE " _______________________________________________________________________________",10,0
level1_map2  BYTE "|  . . . . . . . . . . . . . . . . . . . . .  .  . . . . . . . .  . . . . . . . |",10,0
level1_map3  BYTE "|  .   ######. . .############ . . . .   ### . . .############ . . .###### . . .|",10,0
level1_map4  BYTE "|  .   #    # . . #          # . . . .   ### . .  #          #      #    # . .  |",10,0
level1_map5  BYTE "|  .   #    # . . #          # . . . .   ### . .  #          #      #    # .    |",10,0	
level1_map6  BYTE "|  .   ###### . . ############ . . . .   ### . . .############      ###### . .  |",10,0	
level1_map7  BYTE "|  .   . . . . . . . . . . . . . . . . . . .  . . .            . . . . . . .    |",10,0
level1_map8  BYTE "|  .   ######. . . . . . . . . ########################. . . . . . .  ######. . |",10,0
level1_map9  BYTE "|  .   #    #. . . . . . . . . #                      #. . . . . .  . #    #  . |",10,0
level1_map10 BYTE "|  .   #    #. . . . . . . . . #                      #. . . . . .  . #    #. . |",10,0
level1_map11 BYTE "|  .   ######              . . ##########    ########## . . . .  . . .###### . .|",10,0
level1_map12 BYTE "|  .                       . . . . . . .#    #  . . . . . . . .  . . . . . . .  |",10,0
level1_map13 BYTE "|  . . #### . . . . . . .     . . . . . #    #  .  . . . . . . . .  . . #### .  |",10,0
level1_map14 BYTE "|  . . #  #. . . . . . .     . . . . . .#    #  .  . . . . . . . .  . . #  # .  |",10,0
level1_map15 BYTE "|  . . #  ########## . . . . . .     . .###### . .  .  . . . . ##########  # . .|",10,0
level1_map16 BYTE "|  . . #           # . .     . . . . .        . .  .  . . . . .#           # . .|",10,0
level1_map17 BYTE "|  . . #  ##########. . . . . . .     . ###### . .  .  . . . . ##########  # . .|",10,0
level1_map18 BYTE "|  . . #  #. . . . . . .     . . . . . .#    # .  . . . . . . . .  . . .#  #. . |",10,0
level1_map19 BYTE "|  . . ####. . . . . . . . . . . . . . .#    # .  . . . . . . . .  . . .####. . |",10,0
level1_map20 BYTE "|  . . . . . . . . . . . . . . . . . . .#    # .  . . . . . . . .  . . . . . . .|",10,0
level1_map21 BYTE "|  . . ###################. . .##########    ##########    #################.  .|",10,0
level1_map22 BYTE "|      #                 #     #                      # . .#               #. . |",10,0
level1_map23 BYTE "|      ###################     ########################    #################. . |",10,0
level1_map24 BYTE "|  . . . . . . . . . . . . . . . . . . . . .  .  . . . . . . . .  . . . . . . . |",10,0
level1_map25 BYTE "|_______________________________________________________________________________|",10,0

;--------------- MAP FOR LEVEL 2 ---------------------------

level2_map1  BYTE " _______________________________________________________________________________",10,0
level2_map2  BYTE "|......   .....    #..............................#.............................|",10,0
level2_map3  BYTE "|......   .....    #.......#############..........#...      #############.......|",10,0
level2_map4  BYTE "|......      #.....#.......#           #......... #   ......#           #.......|",10,0
level2_map5  BYTE "|......      #.....#.......#############......... #   ......#############.......|",10,0	
level2_map6  BYTE "|......      #.....#............................                             ...|",10,0	
level2_map7  BYTE "|...####     #.....#............................                             ...|",10,0
level2_map8  BYTE "|...#  #     #.....#############################........................#.....  |",10,0
level2_map9  BYTE "|...#  #     #..............................................########....#.......|",10,0
level2_map10 BYTE "|...####     #..............................................#      #....#...... |",10,0
level2_map11 BYTE "|........    #.................#......                 .....########....#.......|",10,0
level2_map12 BYTE "|........    #.................#......                 .................#.......|",10,0
level2_map13 BYTE "|#############.....    ........#..............  ######################### ......|",10,0
level2_map14 BYTE "|.....    .....................#.   #       #      ......#......................|",10,0
level2_map15 BYTE "|.....              ############    #       #      ......#...... .......        |",10,0
level2_map16 BYTE "|.....              #    .......    #########           .#...... . ########.....|",10,0
level2_map17 BYTE "|.....              #    ................................#...... ..#      #.....|",10,0
level2_map18 BYTE "|....################...............    ...###############...... ..########.....|",10,0
level2_map19 BYTE "|....#...............    ..................#             #                      |",10,0
level2_map20 BYTE "|....#...............    ..................#             #                      |",10,0
level2_map21 BYTE "|....#...............    ..................###############........ ########.....|",10,0
level2_map22 BYTE "|....#....#############################........................... #      #.....|",10,0
level2_map23 BYTE "|.....................................#............................########.....|",10,0
level2_map24 BYTE "|.....................................#.........................................|",10,0
level2_map25 BYTE "|_______________________________________________________________________________|",10,0

;--------------- MAP FOR LEVEL 3 ---------------------------

level3_map1  BYTE " _______________________________________TT_______________________________________",10,0
level3_map2  BYTE "|                         ........................................    ..........|",10,0
level3_map3  BYTE "|           #############     ######################     ############# .........|",10,0
level3_map4  BYTE "|...........#...........................#.    ...................... #   .......|",10,0
level3_map5  BYTE "|...........#...........................#.    .......................#..........|",10,0	
level3_map6  BYTE "|..         #    .......................#.                           #  ........|",10,0	
level3_map7  BYTE "|############....  ###########        #####.........###########      ###########|",10,0
level3_map8  BYTE "|....       #    ..#....................#.....................#......#..........|",10,0
level3_map9  BYTE "|...###.    #    ..#..............##############..............#......#....###...|",10,0
level3_map10 BYTE "|...# #.....#......#..........................................#..    #....# #...|",10,0
level3_map11 BYTE "|...###.....########.........#....#.....       #   ...#...... ########.   ### ..|",10,0
level3_map12 BYTE "|..................#.........#..  #       .....#......#.......#..    ...........|",10,0
level3_map13 BYTE "|.....    .........#.........#..  #       .....#......#.......#..    ...........|",10,0
level3_map14 BYTE "|.....    .........#.........#..  #       .....#......#.......#..    ...........|",10,0
level3_map15 BYTE "|...#####..    ....###########....##############......#########.........#####...|",10,0
level3_map16 BYTE "|...#.. #                ...............##..............................#   #...|",10,0
level3_map17 BYTE "|...#####                ...............##..............................#####...|",10,0
level3_map18 BYTE "|..................###########.   # ....##.....#..... #########.................|",10,0
level3_map19 BYTE "|...................    ..........#.....##.....#..........                      |",10,0
level3_map20 BYTE "|..................################     ## ....################..........       |",10,0
level3_map21 BYTE "|...................    #               ## .....................................|",10,0
level3_map22 BYTE "|...........#############.........############## ........##################.....|",10,0
level3_map23 BYTE "|                              ..............................#..................|",10,0
level3_map24 BYTE "|                              ..............................#..................|",10,0
level3_map25 BYTE "|_______________________________________TT______________________________________|",10,0


;-------------BELOW ARE 'X' AND 'Y' INITIAL CORRDINATES OF PACMAN
pacman_x BYTE 43
pacman_y BYTE 16
pacman_oldx BYTE 0
pacman_oldy BYTE 0

;-------------BELOW ARE 'X' AND 'Y' CORRDINATES OF POINTS/COINS
Fruit1_x BYTE ?
Fruit1_y BYTE ?

;----------------------BELOW IS THE GHOST CHARACTER AND ITS COORDINATES

ghost_char BYTE 'G'
ghost1_x BYTE 74
ghost1_y BYTE 3
ghost1_oldx BYTE 0
ghost1_oldy BYTE 0
ghost2_x BYTE 15
ghost2_y BYTE 5
ghost2_oldx BYTE 0
ghost2_oldy BYTE 0
ghost3_x BYTE 78
ghost3_y BYTE 24
ghost3_oldx BYTE 0
ghost3_oldy BYTE 0
ghost4_x BYTE 78
ghost4_y BYTE 24
ghost4_oldx BYTE 0
ghost4_oldy BYTE 0
ghost5_x BYTE 78
ghost5_y BYTE 24
ghost5_oldx BYTE 0
ghost5_oldy BYTE 0


; character for input
input_char BYTE ?

.code
main PROC
	
	
	call Welcome		; Welcome PROC is defined below
comment ?
	;creating a file to store the name of the player
	mov edx,offset file
	call CreateOutputFile
	mov handler,eax
	
	;writing the name to file
	mov eax,handler
	mov edx,offset p_name
	mov ecx,lengthof p_name
	call WriteToFile
	jc error_file
?

	jmp no_error_file

error_file::
mov eax,red
call SetTextColor
mwrite "	--------     ERROR IN CREATING FILE    --------"	
exit

no_error_file:

menu_calling:
	call ClrScr
	call Menu		; Menu PROC is defined below

	; Choice1 has value at this point of what to do from menu

	cmp choice1,3
	je exiting_game
	cmp choice1,2
	je instruct
	cmp choice1,1
	je level_1
	jmp menu_calling


exiting_game:		; choice1==3
call Exiting
jmp ending

instruct:
call Instructions
jmp menu_calling

Level_1:
call Level1

ending:
mov eax,white
call SetTextColor
exit
main endp

Welcome PROC		; Welcoming screen

	mov eax,magenta
	call SetTextColor
	mwrite "					 _____           __  __              "
	call crlf
    mwrite "					|  __ \         |  \/  |              "
	call crlf
    mwrite "					| |__) |_ _  ___| \  / | __ _ _ __    "
	call crlf
    mwrite "					|  ___/ _` |/ __| |\/| |/ _` | '_ \   "
	call crlf
    mwrite "					| |  | (_| | (__| |  | | (_| | | | |  "
	call crlf
    mwrite "					|_|   \__,_|\___|_|  |_|\__,_|_| |_|  "
	call crlf
    mwrite "                                                        "
	call crlf
	
	;setting the color to yellow and printing welcome
	mov eax,yellow
	call SetTextColor
	call crlf
	call crlf
	mwrite "	_______________________________________________________________________________________________"
	call crlf
	mwrite "       |                                                                                               |"	
	call crlf
	mwrite "       |                                                                                               |"
	call crlf
	mwrite "       |                                                                                               |"
	call crlf
	mwrite "       |                                   WELCOME TO PACMAN GAME                                      |"
	call crlf
	mwrite "       |                                                                                               |"
	call crlf
	mwrite "       |                                                                                               |"
	call crlf
	mwrite "       |_______________________________________________________________________________________________|"
	call crlf
	call crlf

	INVOKE PlaySound, OFFSET pacman_beginning, NULL, SND_FILENAME

	;setting the color to cyan and getting name from the player
	mov eax,cyan
	call SetTextColor
	mov edx,offset p_name
	mov ecx,20
	mwrite "	>>>> ENTER YOUR NAME : "
	call ReadString

ret
Welcome endp

Menu PROC		; Main menu

	mov eax,magenta		;setting the color to magenta and presenting the game menu
	call SetTextColor
	mwrite "	_______________________________________________________________________________________________"
	call crlf
	mwrite "       |                                                                                               |"	
	call crlf
	mwrite "       |                                  1. START GAME                                                |"
	call crlf
	mwrite "       |                                  2. READ INSTRUCTIONS                                         |"
	call crlf
	mwrite "       |                                  3. EXIT                                                      |"
	call crlf
	mwrite "       |                                                                                               |"
	call crlf
	mwrite "       |                                                                                               |"
	call crlf
	mwrite "       |_______________________________________________________________________________________________|"
	call crlf
	call crlf

	;asking to choose an option
	mov eax,blue
	call SetTextColor
	mwrite "	>>> CHOOSE ONE OPTION : "
	call readdec
	mov choice1,eax

ret
Menu endp

Instructions PROC

instructing:
	call ClrScr
	mov eax,magenta
	call SetTextColor
	mwrite "                   _____              _                       _    _                       "
	call crlf
    mwrite "                  |_   _|            | |                     | |  (_)                      "
	call crlf
    mwrite "                    | |   _ __   ___ | |_  _ __  _   _   ___ | |_  _   ___   _ __   ___    "
	call crlf
    mwrite "                    | |  | '_ \ / __|| __|| '__|| | | | / __|| __|| | / _ \ | '_ \ / __|   "
	call crlf
    mwrite "                   _| |_ | | | |\__ \| |_ | |   | |_| || (__ | |_ | || (_) || | | |\__ \   "
	call crlf
    mwrite "                  |_____||_| |_||___/ \__||_|    \__,_| \___| \__||_| \___/ |_| |_||___/   "
	call crlf
	call crlf
	mov eax,green			; setting the color of text to green
	call SetTextColor
	mwrite "	_______________________________________________________________________________________________"
	call crlf
	mwrite "       |                                                                                               |"	
	call crlf
	mwrite "       |                             PRESS 'W' TO MOVE UPWARDS                                         |"	
	call crlf
	mwrite "       |                             PRESS 'S' TO MOVE DOWNWARDS                                       |"
	call crlf
	mwrite "       |                             PRESS 'A' TO MOVE LEFT <--                                        |"
	call crlf
	mwrite "       |                             PRESS 'D' TO MOVE RIGHT -->                                       |"
	call crlf
	mwrite "       |                             THERE ARE 3 LEVELS IN THE GAME                                    |"
	call crlf
	mwrite "       |                             YOU WILL HAVE A TOTAL OF 3 LIVES IN EACH LEVEL                    |"
	call crlf
	mwrite "       |                             TOUCHING A GHOST WILL RESULT IN 1 LIFE DEDUCTION                  |"
	call crlf
	mwrite "       |                             COLLECT POINTS TO GAIN SCORE                                      |"
	call crlf
	mwrite "       |                             LEVEL CHANGES AFTER YOU GAIN 10 POINTS                            |"
	call crlf
	mwrite "       |                             COLLECT FRUITS IF AVAILABLE TO GAIN MORE POINTS                   |"
	call crlf
	mwrite "       |_______________________________________________________________________________________________|"
	call crlf
	call crlf

	;asking to go back to main menu
	mov eax,blue
	call SetTextColor
	mwrite "	>>> ENTER 'B' TO GO BACK TO MAIN MENU : "
	call readchar
	mov back,al
	cmp back,'b'
	je main_menu
	jmp invalid
main_menu:
call crlf
call ClrScr
jmp returning

invalid:

	mov eax,red
	call SetTextColor
	call crlf
	call crlf
	mwrite "	----------		INVALID INPUT		----------"
	call crlf
	call crlf
	jmp instructing

returning:
ret
Instructions endp

Exiting PROC	; if the user enters 3 or e

	call ClrScr
	mov eax,red
	call SetTextColor
	call crlf
	call crlf
	mwrite "	----------		YOU HAVE DECIDED TO EXIT THE GAME		----------"
	call crlf
	call crlf
	mov eax,green
	call SetTextColor
	mwrite "	----------			HAVE A NICE DAY!!!		        ----------"
	call crlf
	call crlf
	mov eax,white
	call SetTextColor
	exit

ret
Exiting endp

Pausing PROC

again:
	mov eax,magenta
	call SetTextColor
	mov dl,60
	mov dh,5
	call Gotoxy
	call crlf
	mwrite  "					 _____                         _    "
	call crlf
    mwrite  "					|  __ \                       | |   "
	call crlf
    mwrite  "					| |__) |_ _ _   _ ___  ___  __| |   "
	call crlf
    mwrite  "					|  ___/ _` | | | / __|/ _ \/ _` |   "
	call crlf
    mwrite  "					| |  | (_| | |_| \__ \  __/ (_| |   "
	call crlf
    mwrite  "					|_|   \__,_|\__,_|___/\___|\__,_|   "
	call crlf
    mwrite  "					                                    "
	call crlf
	call crlf
	call crlf
	call readchar
	cmp al,'p'
	je play
	jmp again

play:
	
ret
Pausing endp

Level1 PROC
	
	call CLrScr

	mov pacman_x,43
	mov pacman_y,16
	mov ghost1_x,74
	mov ghost1_y,3
	mov ghost2_x,15
	mov ghost2_y,5

levelOnePause::
	; Displaying Score Lives and Level on top of the grid
	call Board
	
	call Map_Level1		; making the grid for Level 1 i.e walls

	;------DRAWING GHOSTS FOR LEVEL1----------
	call DrawGhost1
	call DrawGhost2

game_loop::

	call UpdateGhost1
	call UpdateGhost2

	;placing the PACMAN on the grid
	call DrawPacman

	;Movement of Pacman
	call Move_Pacman
	
	; Diplaying and it is updating 1 by 1
	call Board
jmp game_loop
	
ret
Level1 endp

Level2 PROC
	
	call CLrScr

	mov pacman_x,40
	mov pacman_y,15
	mov ghost1_x,74
	mov ghost1_y,3
	mov ghost2_x,16
	mov ghost2_y,3
	mov ghost3_x,78
	mov ghost3_y,24

levelTwoPause::	
	; Displaying Score Lives and Level on top of the grid
	call Board
	
	call Map_Level2		; making the grid for Level 2 i.e walls

	;------DRAWING GHOSTS FOR LEVEL2----------
	call DrawGhost1
	call DrawGhost2
	call DrawGhost3

	;_____________ Drawing fruits randomly
again:
	call CreateFruit1
	call DrawFruit1
cmp ebx,1
je again

	;Placing the points on the grid/map

game_loop2:
	
	call UpdateGhost1
	call UpdateGhost2
	call UpdateGhost3

	call DrawFruit1

	;placing the PACMAN on the grid
	call DrawPacman

	;Movement of Pacman
	call Move_Pacman
	
	; Diplaying and it is updating 1 by 1
	call Board
jmp game_loop2
	
ret
Level2 endp

Level3 PROC
	
	call CLrScr

	mov pacman_x,42
	mov pacman_y,13
	mov ghost1_x,74
	mov ghost1_y,2
	mov ghost2_x,16
	mov ghost2_y,2
	mov ghost3_x,78
	mov ghost3_y,21
	mov ghost4_x,3
	mov ghost4_y,20
	mov ghost5_x,40
	mov ghost5_y,24
	

levelThreePause::
	; Displaying Score Lives and Level on top of the grid
	call Board
	
	call Map_Level3		; making the grid for Level 3 i.e walls

	;------DRAWING GHOSTS FOR LEVEL3----------
	call DrawGhost1
	call DrawGhost2
	call DrawGhost3
	call DrawGhost4
	call DrawGhost5

	;_____________ Drawing fruits randomly
again:
	call CreateFruit1
	call DrawFruit1
cmp ebx,1
je again

	;Placing the fruits on the grid/map

game_loop3:

	call UpdateGhost1
	call UpdateGhost2
	call UpdateGhost3
	call UpdateGhost4
	call UpdateGhost5

	call DrawFruit1

	;placing the PACMAN on the grid
	call DrawPacman

	;Movement of Pacman
	call Move_Pacman
	
	; Diplaying and it is updating 1 by 1
	call Board
jmp game_loop3
	
ret
Level3 endp

Board PROC

	mov eax,white		; changing the text color to white
	call SetTextColor
	mov dl,0		;columns 
	mov dh,0		; rows
	call Gotoxy
	mwrite "SCORE "
	mov eax,red
	call SetTextColor
	mov eax,score
	call writedec
	mov eax,white
	call SetTextColor
	mov dl,11
	mov dh,0
	call Gotoxy
	mwrite "Lives "
	mov eax,red
	call SetTextColor
	mov eax,life
	call writedec
	mov eax,white
	call SetTextColor
	mov dl,21
	mov dh,0
	call Gotoxy
	mwrite "Level "
	mov eax,lev
	call writedec
	call crlf

ret
Board endp

DrawPacman PROC

	mov eax,white
	call SetTextColor
	mov dl,pacman_x			;column (X-coordinate)
	mov dh,pacman_y			;row (Y-coordinate)
	call Gotoxy
	mov al,pacman_char
	call writechar
	call crlf
	call crlf
	call crlf
	call crlf
	call crlf
	call crlf

ret
DrawPacman endp

Move_Pacman PROC

incorrect_char:

	;----we save the old x,y coordinates to move the pacman
	mov al,pacman_x
	mov bl,pacman_y
	
	mov pacman_oldx,al
	mov pacman_oldy,bl

	;Now we wait for user input to change the location of pacman
	mov eax,white
	call SetTextColor

	call readKey
	jz noKey
	mov input_char,al
	jmp forward
noKey:
	mov eax,50
	call Delay

forward:

	cmp input_char,'w'
	je MoveUp
	cmp input_char,'s'
	je MoveDown
	cmp input_char,'a'
	je MoveLeft
	cmp input_char,'d'
	je MoveRight
	cmp input_char,'e'
	je e_pressed		; to exit the game
	cmp input_char,'p'
	je paused			; to pause the game
	jmp incorrect_char

e_pressed:
call ClrScr
call Ending_Game

paused:
call ClrScr
call Pausing
mov input_char,"w"
cmp lev,1
je oning
cmp lev,2
je twoing

	jmp LevelThreePause
oning:
	jmp levelOnePause
twoing:
	jmp levelTwoPause

MoveUp:
	dec pacman_y
	call CheckCollision
	jmp Moved
MoveDown:
	inc pacman_y
	call CheckCollision
	jmp Moved
MoveLeft:
	dec pacman_x
	call CheckCollision
	jmp Moved
MoveRight:
	inc pacman_x
	call CheckCollision
	jmp Moved

Moved:			; After reading user input and updating the x,y coordinates

	;--------FIRST WE CLEAR THE CURRENT LOCATION OF PACMAN
	mov dl,pacman_oldx
	mov dh,pacman_oldy
	call Gotoxy		
	mov al,' '
	call writechar
	
	;Placing Pacman to its new Position
	call DrawPacman

ret
Move_Pacman endp

CheckCollision PROC

	;-------------The updated pacman_x and pacman_y-------------
	mov dl,pacman_x
	mov dh,pacman_y

	cmp lev,1
	je for_maze1
	cmp lev,2
	je for_maze2
	call offsetting_maze3
	jmp validity

for_maze1:
	call offsetting_maze1
	jmp validity
for_maze2:
	call offsetting_maze2

validity:

	;if there is a space or point/coin then and only it moves
	cmp al,"|"
	je not_valid
	cmp al,' '
	je valid			
	cmp al,'.'
	je inc_score
	cmp al,"o"
	je fruit
	cmp al,"T"
	je teleport
	jmp not_valid

not_valid:	;restoring
	mov al,pacman_oldx
	mov bl,pacman_oldy
	mov pacman_x,al
	mov pacman_y,bl
	jmp valid

fruit:
	mov bl," "
	mov [esi],bl
	add score,100
	cmp score,10000
	jge two_up
	call CreateFruit1
	call DrawFruit1
	jmp valid

teleport:
	cmp pacman_y,1
	jne second
		mov pacman_y,24
		jmp valid
	second:
	cmp pacman_y,25
	jne valid
		mov pacman_y,2
		jmp valid

inc_score:
	mov bl," "
	mov [esi],bl
	add score,10
	cmp score,500
	je level_up
	cmp score,1000
	je level_up
	cmp score,3000
	jge Ending_Game
	jmp valid

level_up:
	inc lev
	cmp lev,2
	je one_up
	cmp lev,3
	je two_up

one_up:
	mov life,3
	call level2
two_up:
	mov life,3
	call level3

game_over:
	call Ending_Game

valid:

ret
CheckCollision endp

offsetting_maze1 PROC

	cmp dh,1
	je maze1_0
	cmp dh,2
	je maze1_1
	cmp dh,3
	je maze1_2
	cmp dh,4
	je maze1_3
	cmp dh,5
	je maze1_4
	cmp dh,6
	je maze1_5
	cmp dh,7
	je maze1_6
	cmp dh,8
	je maze1_7
	cmp dh,9
	je maze1_8
	cmp dh,10
	je maze1_9
	cmp dh,11
	je maze1_10
	cmp dh,12
	je maze1_11
	cmp dh,13
	je maze1_12
	cmp dh,14
	je maze1_13
	cmp dh,15
	je maze1_14
	cmp dh,16
	je maze1_15
	cmp dh,17
	je maze1_16
	cmp dh,18
	je maze1_17
	cmp dh,19
	je maze1_18
	cmp dh,20
	je maze1_19
	cmp dh,21
	je maze1_20
	cmp dh,22
	je maze1_21
	cmp dh,23
	je maze1_22
	cmp dh,24
	je maze1_23
	cmp dh,25
	je maze1_24

maze1_0:
mov esi,offset level1_map1
call CheckCollide
jmp validity
maze1_1:
mov esi,offset level1_map2
call CheckCollide
jmp validity
maze1_2:
mov esi,offset level1_map3
call CheckCollide
jmp validity
maze1_3:
mov esi,offset level1_map4
call CheckCollide
jmp validity
maze1_4:
mov esi,offset level1_map5
call CheckCollide
jmp validity
maze1_5:
mov esi,offset level1_map6
call CheckCollide
jmp validity
maze1_6:
mov esi,offset level1_map7
call CheckCollide
jmp validity
maze1_7:
mov esi,offset level1_map8
call CheckCollide
jmp validity
maze1_8:
mov esi,offset level1_map9
call CheckCollide
jmp validity
maze1_9:
mov esi,offset level1_map10
call CheckCollide
jmp validity
maze1_10:
mov esi,offset level1_map11
call CheckCollide
jmp validity
maze1_11:
mov esi,offset level1_map12
call CheckCollide
jmp validity
maze1_12:
mov esi,offset level1_map13
call CheckCollide
jmp validity
maze1_13:
mov esi,offset level1_map14
call CheckCollide
jmp validity
maze1_14:
mov esi,offset level1_map15
call CheckCollide
jmp validity
maze1_15:
mov esi,offset level1_map16
call CheckCollide
jmp validity
maze1_16:
mov esi,offset level1_map17
call CheckCollide
jmp validity
maze1_17:
mov esi,offset level1_map18
call CheckCollide
jmp validity
maze1_18:
mov esi,offset level1_map19
call CheckCollide
jmp validity
maze1_19:
mov esi,offset level1_map20
call CheckCollide
jmp validity
maze1_20:
mov esi,offset level1_map21
call CheckCollide
jmp validity
maze1_21:
mov esi,offset level1_map22
call CheckCollide
jmp validity
maze1_22:
mov esi,offset level1_map23
call CheckCollide
jmp validity
maze1_23:
mov esi,offset level1_map24
call CheckCollide
jmp validity
maze1_24:
mov esi,offset level1_map25
call CheckCollide

validity:

ret
offsetting_maze1 endp

offsetting_maze2 PROC

	cmp dh,1
	je maze1_0
	cmp dh,2
	je maze1_1
	cmp dh,3
	je maze1_2
	cmp dh,4
	je maze1_3
	cmp dh,5
	je maze1_4
	cmp dh,6
	je maze1_5
	cmp dh,7
	je maze1_6
	cmp dh,8
	je maze1_7
	cmp dh,9
	je maze1_8
	cmp dh,10
	je maze1_9
	cmp dh,11
	je maze1_10
	cmp dh,12
	je maze1_11
	cmp dh,13
	je maze1_12
	cmp dh,14
	je maze1_13
	cmp dh,15
	je maze1_14
	cmp dh,16
	je maze1_15
	cmp dh,17
	je maze1_16
	cmp dh,18
	je maze1_17
	cmp dh,19
	je maze1_18
	cmp dh,20
	je maze1_19
	cmp dh,21
	je maze1_20
	cmp dh,22
	je maze1_21
	cmp dh,23
	je maze1_22
	cmp dh,24
	je maze1_23
	cmp dh,25
	je maze1_24

maze1_0:
mov esi,offset level2_map1
call CheckCollide
jmp validity
maze1_1:
mov esi,offset level2_map2
call CheckCollide
jmp validity
maze1_2:
mov esi,offset level2_map3
call CheckCollide
jmp validity
maze1_3:
mov esi,offset level2_map4
call CheckCollide
jmp validity
maze1_4:
mov esi,offset level2_map5
call CheckCollide
jmp validity
maze1_5:
mov esi,offset level2_map6
call CheckCollide
jmp validity
maze1_6:
mov esi,offset level2_map7
call CheckCollide
jmp validity
maze1_7:
mov esi,offset level2_map8
call CheckCollide
jmp validity
maze1_8:
mov esi,offset level2_map9
call CheckCollide
jmp validity
maze1_9:
mov esi,offset level2_map10
call CheckCollide
jmp validity
maze1_10:
mov esi,offset level2_map11
call CheckCollide
jmp validity
maze1_11:
mov esi,offset level2_map12
call CheckCollide
jmp validity
maze1_12:
mov esi,offset level2_map13
call CheckCollide
jmp validity
maze1_13:
mov esi,offset level2_map14
call CheckCollide
jmp validity
maze1_14:
mov esi,offset level2_map15
call CheckCollide
jmp validity
maze1_15:
mov esi,offset level2_map16
call CheckCollide
jmp validity
maze1_16:
mov esi,offset level2_map17
call CheckCollide
jmp validity
maze1_17:
mov esi,offset level2_map18
call CheckCollide
jmp validity
maze1_18:
mov esi,offset level2_map19
call CheckCollide
jmp validity
maze1_19:
mov esi,offset level2_map20
call CheckCollide
jmp validity
maze1_20:
mov esi,offset level2_map21
call CheckCollide
jmp validity
maze1_21:
mov esi,offset level2_map22
call CheckCollide
jmp validity
maze1_22:
mov esi,offset level2_map23
call CheckCollide
jmp validity
maze1_23:
mov esi,offset level2_map24
call CheckCollide
jmp validity
maze1_24:
mov esi,offset level2_map25
call CheckCollide

validity:

ret
offsetting_maze2 endp

offsetting_maze3 PROC

	cmp dh,1
	je maze1_0
	cmp dh,2
	je maze1_1
	cmp dh,3
	je maze1_2
	cmp dh,4
	je maze1_3
	cmp dh,5
	je maze1_4
	cmp dh,6
	je maze1_5
	cmp dh,7
	je maze1_6
	cmp dh,8
	je maze1_7
	cmp dh,9
	je maze1_8
	cmp dh,10
	je maze1_9
	cmp dh,11
	je maze1_10
	cmp dh,12
	je maze1_11
	cmp dh,13
	je maze1_12
	cmp dh,14
	je maze1_13
	cmp dh,15
	je maze1_14
	cmp dh,16
	je maze1_15
	cmp dh,17
	je maze1_16
	cmp dh,18
	je maze1_17
	cmp dh,19
	je maze1_18
	cmp dh,20
	je maze1_19
	cmp dh,21
	je maze1_20
	cmp dh,22
	je maze1_21
	cmp dh,23
	je maze1_22
	cmp dh,24
	je maze1_23
	cmp dh,25
	je maze1_24

maze1_0:
mov esi,offset level3_map1
call CheckCollide
jmp validity
maze1_1:
mov esi,offset level3_map2
call CheckCollide
jmp validity
maze1_2:
mov esi,offset level3_map3
call CheckCollide
jmp validity
maze1_3:
mov esi,offset level3_map4
call CheckCollide
jmp validity
maze1_4:
mov esi,offset level3_map5
call CheckCollide
jmp validity
maze1_5:
mov esi,offset level3_map6
call CheckCollide
jmp validity
maze1_6:
mov esi,offset level3_map7
call CheckCollide
jmp validity
maze1_7:
mov esi,offset level3_map8
call CheckCollide
jmp validity
maze1_8:
mov esi,offset level3_map9
call CheckCollide
jmp validity
maze1_9:
mov esi,offset level3_map10
call CheckCollide
jmp validity
maze1_10:
mov esi,offset level3_map11
call CheckCollide
jmp validity
maze1_11:
mov esi,offset level3_map12
call CheckCollide
jmp validity
maze1_12:
mov esi,offset level3_map13
call CheckCollide
jmp validity
maze1_13:
mov esi,offset level3_map14
call CheckCollide
jmp validity
maze1_14:
mov esi,offset level3_map15
call CheckCollide
jmp validity
maze1_15:
mov esi,offset level3_map16
call CheckCollide
jmp validity
maze1_16:
mov esi,offset level3_map17
call CheckCollide
jmp validity
maze1_17:
mov esi,offset level3_map18
call CheckCollide
jmp validity
maze1_18:
mov esi,offset level3_map19
call CheckCollide
jmp validity
maze1_19:
mov esi,offset level3_map20
call CheckCollide
jmp validity
maze1_20:
mov esi,offset level3_map21
call CheckCollide
jmp validity
maze1_21:
mov esi,offset level3_map22
call CheckCollide
jmp validity
maze1_22:
mov esi,offset level3_map23
call CheckCollide
jmp validity
maze1_23:
mov esi,offset level3_map24
call CheckCollide
jmp validity
maze1_24:
mov esi,offset level3_map25
call CheckCollide

validity:

ret
offsetting_maze3 endp

Ending_Game PROC			;;; GAME OVER DISPLAY

	;creating a file to store the name of the player
	mov edx,offset file
	call CreateOutputFile
	mov handler,eax
	
	;writing the name to file
	mov eax,handler
	mov edx,offset p_name
	mov ecx,lengthof p_name
	call WriteToFile
	jc error_file
	jmp no_error_file

no_error_file:
	mov eax,handler
	call CloseFile

	call ClrScr
	mov eax,yellow
	call SetTextColor
	mov dl,45
	mov dh,2
	call Gotoxy
	mwrite "NAME ---> "
	mov edx,offset p_name
	call writestring
	mwrite "     Score ---> "
	mov eax,score
	call writedec
	call crlf
	
	mov eax,red
	call SetTextColor
	call crlf
	call crlf
	mwrite "					   _____                           ____                       "
	call crlf
    mwrite "					 / ____|                         / __ \                      "
	call crlf
    mwrite "					| |  __   __ _  _ __ ___    ___ | |  | |__   __ ___  _ __    "
	call crlf
    mwrite "					| | |_ | / _` || '_ ` _ \  / _ \| |  | |\ \ / // _ \| '__|   "
	call crlf
    mwrite "					| |__| || (_| || | | | | ||  __/| |__| | \ V /|  __/| |      "
	call crlf
    mwrite "					 \_____| \__,_||_| |_| |_| \___| \____/   \_/  \___||_|      "
	call crlf
    mwrite "						                                                           "
	call crlf
	call crlf
	call crlf
	call crlf

	INVOKE PlaySound, OFFSET over, NULL, SND_FILENAME

	mov eax,white
	call SetTextColor
	mov eax,1000
	call Delay
	call WaitMsg

exit	
ret
Ending_Game endp

CheckCollide PROC		; to check if it can move up or down or not

	xor ecx,ecx
	mov cl,dl
check_loop:
	inc esi
loop check_loop
	
	mov al,[esi]	; the position where 'X' is about to move

ret
CheckCollide endp



Map_Level1 PROC
	
	mov eax,red		; set color to red for the walls
	call SetTextColor

	mov dl,0		; columns
	mov dh,1		; rows
	call Gotoxy

	mov edx,offset level1_map1
	call writestring
	mov edx,offset level1_map2
	call writestring
	mov edx,offset level1_map3
	call writestring
	mov edx,offset level1_map4
	call writestring
	mov edx,offset level1_map5
	call writestring
	mov edx,offset level1_map6
	call writestring
	mov edx,offset level1_map7
	call writestring
	mov edx,offset level1_map8
	call writestring
	mov edx,offset level1_map9
	call writestring
	mov edx,offset level1_map10
	call writestring
	mov edx,offset level1_map11
	call writestring
	mov edx,offset level1_map12
	call writestring
	mov edx,offset level1_map13
	call writestring
	mov edx,offset level1_map14
	call writestring
	mov edx,offset level1_map15
	call writestring
	mov edx,offset level1_map16
	call writestring
	mov edx,offset level1_map17
	call writestring
	mov edx,offset level1_map18
	call writestring
	mov edx,offset level1_map19
	call writestring
	mov edx,offset level1_map20
	call writestring
	mov edx,offset level1_map21
	call writestring
	mov edx,offset level1_map22
	call writestring
	mov edx,offset level1_map23
	call writestring
	mov edx,offset level1_map24
	call writestring
	mov edx,offset level1_map25
	call writestring
	
ret
Map_Level1 endp

Map_Level2 PROC
	
	mov eax,red		; set color to red for the walls
	call SetTextColor

	mov dl,0		; columns
	mov dh,1		; rows
	call Gotoxy
	mov edx,offset level2_map1
	call writestring
	mov edx,offset level2_map2
	call writestring
	mov edx,offset level2_map3
	call writestring
	mov edx,offset level2_map4
	call writestring
	mov edx,offset level2_map5
	call writestring
	mov edx,offset level2_map6
	call writestring
	mov edx,offset level2_map7
	call writestring
	mov edx,offset level2_map8
	call writestring
	mov edx,offset level2_map9
	call writestring
	mov edx,offset level2_map10
	call writestring
	mov edx,offset level2_map11
	call writestring
	mov edx,offset level2_map12
	call writestring
	mov edx,offset level2_map13
	call writestring
	mov edx,offset level2_map14
	call writestring
	mov edx,offset level2_map15
	call writestring
	mov edx,offset level2_map16
	call writestring
	mov edx,offset level2_map17
	call writestring
	mov edx,offset level2_map18
	call writestring
	mov edx,offset level2_map19
	call writestring
	mov edx,offset level2_map20
	call writestring
	mov edx,offset level2_map21
	call writestring
	mov edx,offset level2_map22
	call writestring
	mov edx,offset level2_map23
	call writestring
	mov edx,offset level2_map24
	call writestring
	mov edx,offset level2_map25
	call writestring
	
ret
Map_Level2 endp

Map_Level3 PROC
	
	mov eax,red		; set color to red for the walls
	call SetTextColor

	mov dl,0		; columns
	mov dh,1		; rows
	call Gotoxy
	mov edx,offset level3_map1
	call writestring
	mov edx,offset level3_map2
	call writestring
	mov edx,offset level3_map3
	call writestring
	mov edx,offset level3_map4
	call writestring
	mov edx,offset level3_map5
	call writestring
	mov edx,offset level3_map6
	call writestring
	mov edx,offset level3_map7
	call writestring
	mov edx,offset level3_map8
	call writestring
	mov edx,offset level3_map9
	call writestring
	mov edx,offset level3_map10
	call writestring
	mov edx,offset level3_map11
	call writestring
	mov edx,offset level3_map12
	call writestring
	mov edx,offset level3_map13
	call writestring
	mov edx,offset level3_map14
	call writestring
	mov edx,offset level3_map15
	call writestring
	mov edx,offset level3_map16
	call writestring
	mov edx,offset level3_map17
	call writestring
	mov edx,offset level3_map18
	call writestring
	mov edx,offset level3_map19
	call writestring
	mov edx,offset level3_map20
	call writestring
	mov edx,offset level3_map21
	call writestring
	mov edx,offset level3_map22
	call writestring
	mov edx,offset level3_map23
	call writestring
	mov edx,offset level3_map24
	call writestring
	mov edx,offset level3_map25
	call writestring
	
ret
Map_Level3 endp

CreateFruit1 PROC
	
	call randomize
	mov al,79			
	call RandomRange
	inc al				
	mov Fruit1_x,al			; X coordinate of point

	mov al,23		
	call RandomRange
	add al,2			
	mov Fruit1_y,al			; Y coordinate of point

ret
CreateFruit1 endp

DrawFruit1 PROC
	
	xor ebx,ebx
	;Placing a fruit on the grid/map
	mov dl,Fruit1_x		; setting the coordinates
	mov dh,Fruit1_y
	cmp lev,2
	je for_maze2
	call offsetting_maze3
	jmp now
for_maze2:
	call offsetting_maze2

now:
	call Gotoxy

	mov bl,[esi]	;---the place where it should be drawn
	cmp bl,"#"
	je wall
	cmp bl,"_"
	je wall
	cmp bl,"|"
	je wall
	jmp proceed

wall:
	mov ebx,1
	ret
proceed:
	mov eax,yellow
	call SetTextColor
	mov al,"o"
	mov [esi],al
	call writechar
	mov eax,white		; restoring the color to original form
	call SetTextColor
ret
DrawFruit1 endp

DrawGhost1 PROC

	mov eax,red
	call SetTextColor
	mov dl,ghost1_x
	mov dh,ghost1_y
	call Gotoxy
	mov al,ghost_char
	call writechar

ret
DrawGhost1 endp

DrawGhost2 PROC

	mov eax,magenta
	call SetTextColor
	mov dl,ghost2_x
	mov dh,ghost2_y
	call Gotoxy
	mov al,ghost_char
	call writechar
	mov eax,red
	call SetTextColor

ret
DrawGhost2 endp

DrawGhost3 PROC

	mov eax,cyan
	call SetTextColor
	mov dl,ghost3_x
	mov dh,ghost3_y
	call Gotoxy
	mov al,ghost_char
	call writechar
	mov eax,red
	call SetTextColor

ret
DrawGhost3 endp

DrawGhost4 PROC

	mov eax,white
	call SetTextColor
	mov dl,ghost4_x
	mov dh,ghost4_y
	call Gotoxy
	mov al,ghost_char
	call writechar
	mov eax,red
	call SetTextColor

ret
DrawGhost4 endp

DrawGhost5 PROC

	mov eax,brown
	call SetTextColor
	mov dl,ghost5_x
	mov dh,ghost5_y
	call Gotoxy
	mov al,ghost_char
	call writechar
	mov eax,red
	call SetTextColor

ret
DrawGhost5 endp

UpdateGhost1 PROC

	mov al,ghost1_x
	mov ghost1_oldx,al
	mov al,ghost1_y
	mov ghost1_oldy,al

	xor ebx,ebx
	mov bl,ghost1_x
	mov bh,ghost1_y

	;________for chasing the pacman _____________
	cmp pacman_y,bh
	jl moveUp
	cmp pacman_y,bh
	jg moveDown
	cmp pacman_x,bl	
	jl moveLeft
	cmp pacman_x,bl
	jg moveRight

	xor ebx,ebx
wallFound::

	call Randomize
	mov eax,4
	call RandomRange
	inc eax
	cmp ebx,eax
	je wallFound
	cmp eax,1
	je moveUp
	cmp eax,2
	je moveDown
	cmp eax,3
	je moveLeft
	cmp eax,4
	je moveRight

moveUp:
	mov ebx,1
	dec ghost1_y
	mov dl,ghost1_x
	mov dh,ghost1_y
	call WallCheckGhost
	jmp onwards
moveDown:
	mov ebx,2
	inc ghost1_y
	mov dl,ghost1_x
	mov dh,ghost1_y
	call WallCheckGhost
	jmp onwards
moveLeft:
	mov ebx,3
	dec ghost1_x
	mov dl,ghost1_x
	mov dh,ghost1_y
	call WallCheckGhost
	jmp onwards
moveRight:
	mov ebx,4
	inc ghost1_x
	mov dl,ghost1_x
	mov dh,ghost1_y
	call WallCheckGhost
	jmp onwards

onwards:

	call DrawGhost1

	mov dl,ghost1_oldx
	mov dh,ghost1_oldy

	cmp lev,1
	je for_maze1
	cmp lev,2
	je for_maze2
	jmp for_maze3

for_maze1:
	call offsetting_maze1		;sets esi from where ghost has moved
	jmp forward

for_maze2:
	call offsetting_maze2
	jmp forward

for_maze3:
	call offsetting_maze3

forward:

	mov dl,ghost1_oldx
	mov dh,ghost1_oldy
	call Gotoxy
	call writechar			; resets the place from where ghost is moved

    ret
UpdateGhost1 ENDP

UpdateGhost2 PROC
	
	mov al,ghost2_x
	mov ghost2_oldx,al
	mov al,ghost2_y
	mov ghost2_oldy,al

	xor ebx,ebx
	mov bl,ghost2_x
	mov bh,ghost2_y

	;________for chasing the pacman_______________
	cmp pacman_y,bh
	jl moveUp
	cmp pacman_y,bh
	jg moveDown
	cmp pacman_x,bl	
	jl moveLeft
	cmp pacman_x,bl
	jg moveRight

	xor ebx,ebx

wallFound2::
	
	call Randomize
	mov eax,4
	call RandomRange
	inc eax
	cmp ebx,eax
	je wallFound2
	cmp eax,1
	je moveUp
	cmp eax,2
	je moveDown
	cmp eax,3
	je moveLeft
	cmp eax,4
	je moveRight

moveUp:
	mov ebx,1
	dec ghost2_y
	mov dl,ghost2_x
	mov dh,ghost2_y
	call WallCheckGhost2
	jmp onwards
moveDown:
	mov ebx,2
	inc ghost2_y
	mov dl,ghost2_x
	mov dh,ghost2_y
	call WallCheckGhost2
	jmp onwards
moveLeft:
	mov ebx,3
	dec ghost2_x
	mov dl,ghost2_x
	mov dh,ghost2_y
	call WallCheckGhost2
	jmp onwards
moveRight:
	mov ebx,4
	inc ghost2_x
	mov dl,ghost2_x
	mov dh,ghost2_y
	call WallCheckGhost2
	jmp onwards

onwards:

	call Drawghost2

	mov dl,ghost2_oldx
	mov dh,ghost2_oldy
	
cmp lev,1
	je for_maze1
	cmp lev,2
	je for_maze2
	jmp for_maze3

for_maze1:
	call offsetting_maze1		;sets esi from where ghost has moved
	jmp forward

for_maze2:
	call offsetting_maze2
	jmp forward

for_maze3:
	call offsetting_maze3

forward:
	
	mov dl,ghost2_oldx
	mov dh,ghost2_oldy
	call Gotoxy
	call writechar			; resets the place from where ghost is moved

ret
UpdateGhost2 ENDP

UpdateGhost3 PROC

	mov al,ghost3_x
	mov ghost3_oldx,al
	mov al,ghost3_y
	mov ghost3_oldy,al

	xor ebx,ebx
	mov bl,ghost3_x
	mov bh,ghost3_y

	;________for chasing the pacman _____________
	cmp pacman_y,bh
	jl moveUp
	cmp pacman_y,bh
	jg moveDown
	cmp pacman_x,bl	
	jl moveLeft
	cmp pacman_x,bl
	jg moveRight

	xor ebx,ebx
wallFound3::

	call Randomize
	mov eax,4
	call RandomRange
	inc eax
	cmp ebx,eax
	je wallFound3
	cmp eax,1
	je moveUp
	cmp eax,2
	je moveDown
	cmp eax,3
	je moveLeft
	cmp eax,4
	je moveRight

moveUp:
	mov ebx,1
	dec ghost3_y
	mov dl,ghost3_x
	mov dh,ghost3_y
	call WallCheckGhost3
	jmp onwards
moveDown:
	mov ebx,2
	inc ghost3_y
	mov dl,ghost3_x
	mov dh,ghost3_y
	call WallCheckGhost3
	jmp onwards
moveLeft:
	mov ebx,3
	dec ghost3_x
	mov dl,ghost3_x
	mov dh,ghost3_y
	call WallCheckGhost3
	jmp onwards
moveRight:
	mov ebx,4
	inc ghost3_x
	mov dl,ghost3_x
	mov dh,ghost3_y
	call WallCheckGhost3
	jmp onwards

onwards:

	call Drawghost3

	mov dl,ghost3_oldx
	mov dh,ghost3_oldy

	cmp lev,1
	je for_maze1
	cmp lev,2
	je for_maze2
	jmp for_maze3

for_maze1:
	call offsetting_maze1		;sets esi from where ghost has moved
	jmp forward

for_maze2:
	call offsetting_maze2
	jmp forward

for_maze3:
	call offsetting_maze3

forward:

	mov dl,ghost3_oldx
	mov dh,ghost3_oldy
	call Gotoxy
	call writechar			; resets the place from where ghost is moved

    ret
UpdateGhost3 ENDP

UpdateGhost4 PROC

	mov al,ghost4_x
	mov ghost4_oldx,al
	mov al,ghost4_y
	mov ghost4_oldy,al

	xor ebx,ebx
	mov bl,ghost4_x
	mov bh,ghost4_y

	;________for chasing the pacman _____________
	cmp pacman_y,bh
	jl moveUp
	cmp pacman_y,bh
	jg moveDown
	cmp pacman_x,bl	
	jl moveLeft
	cmp pacman_x,bl
	jg moveRight

	xor ebx,ebx
wallFound4::

	call Randomize
	mov eax,4
	call RandomRange
	inc eax
	cmp ebx,eax
	je wallFound4
	cmp eax,1
	je moveUp
	cmp eax,2
	je moveDown
	cmp eax,3
	je moveLeft
	cmp eax,4
	je moveRight

moveUp:
	mov ebx,1
	dec ghost4_y
	mov dl,ghost4_x
	mov dh,ghost4_y
	call WallCheckghost4
	jmp onwards
moveDown:
	mov ebx,2
	inc ghost4_y
	mov dl,ghost4_x
	mov dh,ghost4_y
	call WallCheckghost4
	jmp onwards
moveLeft:
	mov ebx,3
	dec ghost4_x
	mov dl,ghost4_x
	mov dh,ghost4_y
	call WallCheckghost4
	jmp onwards
moveRight:
	mov ebx,4
	inc ghost4_x
	mov dl,ghost4_x
	mov dh,ghost4_y
	call WallCheckghost4
	jmp onwards

onwards:

	call Drawghost4

	mov dl,ghost4_oldx
	mov dh,ghost4_oldy

	cmp lev,1
	je for_maze1
	cmp lev,2
	je for_maze2
	jmp for_maze3

for_maze1:
	call offsetting_maze1		;sets esi from where ghost has moved
	jmp forward

for_maze2:
	call offsetting_maze2
	jmp forward

for_maze3:
	call offsetting_maze3

forward:

	mov dl,ghost4_oldx
	mov dh,ghost4_oldy
	call Gotoxy
	call writechar			; resets the place from where ghost is moved

    ret
UpdateGhost4 ENDP

UpdateGhost5 PROC

	mov al,ghost5_x
	mov ghost5_oldx,al
	mov al,ghost5_y
	mov ghost5_oldy,al

	xor ebx,ebx
	mov bl,ghost5_x
	mov bh,ghost5_y

	;________for chasing the pacman _____________
	cmp pacman_y,bh
	jl moveUp
	cmp pacman_y,bh
	jg moveDown
	cmp pacman_x,bl	
	jl moveLeft
	cmp pacman_x,bl
	jg moveRight

	xor ebx,ebx
wallFound5::

	call Randomize
	mov eax,4
	call RandomRange
	inc eax
	cmp ebx,eax
	je wallFound5
	cmp eax,1
	je moveUp
	cmp eax,2
	je moveDown
	cmp eax,3
	je moveLeft
	cmp eax,4
	je moveRight

moveUp:
	mov ebx,1
	dec ghost5_y
	mov dl,ghost5_x
	mov dh,ghost5_y
	call WallCheckghost5
	jmp onwards
moveDown:
	mov ebx,2
	inc ghost5_y
	mov dl,ghost5_x
	mov dh,ghost5_y
	call WallCheckghost5
	jmp onwards
moveLeft:
	mov ebx,3
	dec ghost5_x
	mov dl,ghost5_x
	mov dh,ghost5_y
	call WallCheckghost5
	jmp onwards
moveRight:
	mov ebx,4
	inc ghost5_x
	mov dl,ghost5_x
	mov dh,ghost5_y
	call WallCheckghost5
	jmp onwards

onwards:

	call Drawghost5

	mov dl,ghost5_oldx
	mov dh,ghost5_oldy

	cmp lev,1
	je for_maze1
	cmp lev,2
	je for_maze2
	jmp for_maze3

for_maze1:
	call offsetting_maze1		;sets esi from where ghost has moved
	jmp forward

for_maze2:
	call offsetting_maze2
	jmp forward

for_maze3:
	call offsetting_maze3

forward:

	mov dl,ghost5_oldx
	mov dh,ghost5_oldy
	call Gotoxy
	call writechar			; resets the place from where ghost is moved

    ret
UpdateGhost5 ENDP

WallCheckGhost PROC

	cmp lev,1
	je for_maze1
	cmp lev,2
	je for_maze2
	call offsetting_maze3
	jmp forward

for_maze1:
	call offsetting_maze1		;sets esi where ghost is about to move
	jmp forward

for_maze2:
	call offsetting_maze2

forward:
	
	cmp al,"_"
	je wall
	cmp al,"#"
	je wall
	cmp al,"|"
	je wall
	cmp al,"o"
	je wall
	jmp no_wall

wall:
	mov al,ghost1_oldx
	mov ghost1_x,al
	mov al,ghost1_oldy
	mov ghost1_y,al
	jmp wallFound
no_wall:
	mov dl,ghost1_oldx
	mov dh,ghost1_oldy
	call CheckCollisionWithPacman

ret
WallCheckGhost endp

WallCheckGhost2 PROC

	cmp lev,1
	je for_maze1
	cmp lev,2
	je for_maze2
	call offsetting_maze3
	jmp forward

for_maze1:
	call offsetting_maze1		;sets esi where ghost is about to move
	jmp forward

for_maze2:
	call offsetting_maze2

forward:	
	cmp al,"_"
	je wall
	cmp al,"#"
	je wall
	cmp al,"|"
	je wall
	cmp al,"o"
	je wall
	jmp no_wall

	mov dl,ghost2_oldx
	mov dh,ghost2_oldy
	cmp dl,ghost1_x
	je check
	jmp no_wall
check:
	cmp dh,ghost1_y
	je wall
	jmp no_wall

wall:
	mov al,ghost2_oldx
	mov ghost2_x,al
	mov al,ghost2_oldy
	mov ghost2_y,al
	jmp wallFound2

no_wall:
	
	mov dl,ghost2_oldx
	mov dh,ghost2_oldy
	call CheckCollisionWithPacman
	
ret
WallCheckGhost2 endp

WallCheckGhost3 PROC

	cmp lev,2
	je for_maze2
	call offsetting_maze3
	jmp forward

for_maze2:
	call offsetting_maze2

forward:	
	cmp al,"_"
	je wall
	cmp al,"#"
	je wall
	cmp al,"|"
	je wall
	cmp al,"o"
	je wall
	jmp no_wall

	mov dl,ghost3_oldx
	mov dh,ghost3_oldy
	cmp dl,ghost1_x
	je check
	jmp no_wall
check:
	cmp dh,ghost1_y
	je wall
	jmp no_wall

wall:
	mov al,ghost3_oldx
	mov ghost3_x,al
	mov al,ghost3_oldy
	mov ghost3_y,al
	jmp wallFound3

no_wall:
	
	mov dl,ghost3_oldx
	mov dh,ghost3_oldy
	call CheckCollisionWithPacman
	
ret
WallCheckGhost3 endp

WallCheckGhost4 PROC

	call offsetting_maze3
	
	cmp al,"_"
	je wall
	cmp al,"#"
	je wall
	cmp al,"|"
	je wall
	cmp al,"o"
	je wall
	jmp no_wall

	mov dl,ghost4_oldx
	mov dh,ghost4_oldy
	cmp dl,ghost1_x
	je check
	jmp no_wall
check:
	cmp dh,ghost1_y
	je wall
	jmp no_wall

wall:
	mov al,ghost4_oldx
	mov ghost4_x,al
	mov al,ghost4_oldy
	mov ghost4_y,al
	jmp wallFound4

no_wall:
	
	mov dl,ghost4_oldx
	mov dh,ghost4_oldy
	call CheckCollisionWithPacman
	
ret
WallCheckGhost4 endp

WallCheckGhost5 PROC

	call offsetting_maze3
		
	cmp al,"_"
	je wall
	cmp al,"#"
	je wall
	cmp al,"|"
	je wall
	cmp al,"o"
	je wall
	jmp no_wall

	mov dl,ghost5_oldx
	mov dh,ghost5_oldy
	cmp dl,ghost1_x
	je check
	jmp no_wall
check:
	cmp dh,ghost1_y
	je wall
	jmp no_wall

wall:
	mov al,ghost5_oldx
	mov ghost5_x,al
	mov al,ghost5_oldy
	mov ghost5_y,al
	jmp wallFound5

no_wall:
	
	mov dl,ghost5_oldx
	mov dh,ghost5_oldy
	call CheckCollisionWithPacman
	
ret
WallCheckGhost5 endp

CheckCollisionWithPacman PROC

	cmp dl,pacman_x
	jne no_ghost
	cmp dh,pacman_y
	jne no_ghost
	jmp ghost

	ghost:
		dec life
		INVOKE PlaySound, OFFSET ghost_hit, NULL, SND_FILENAME
		call Lost_Life
		cmp life,0
		je game_over
		cmp lev,1
		je leveling1
		cmp lev,2
		je leveling2
		call Level3
	leveling1:
		call Level1
	leveling2:
		call Level2

game_over:
	call Ending_Game

	no_ghost:
	mov ebx,0

	ret
CheckCollisionWithPacman endp

Lost_Life PROC
	
	mov eax,1000
	call Delay
	call ClrScr
	mov eax,red
	call SetTextColor
	call crlf
	call crlf
	mwrite "	----------		YOU LOST A LIFE		----------"
	call crlf
	call crlf
	mov eax,1000
	call Delay
	mov eax,white
	call SetTextColor


ret
Lost_Life endp



end main