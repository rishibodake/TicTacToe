#!/bin/bash -x
#Discription:Tic Tac Toe challenge to  the computer
#Author:Hrishikesh Bodake
#Since:March 9 2020 /Monday
emptyFlag=0
ROW=3
COLUMN=3
player="P"
turn=1
winChecker=0
#cNumber=0
declare -A board
function initializeBoard(){  #function to create board
	for((r=0;r<$ROW;r++))
	do
		for((	c=0; c<$COLUMN; c++))
		do
			board[$r,$c]="-"
		done
	done
}
function displayBoard(){  #function to displayboard
	for((r=0;r<$ROW;r++))
	do
		echo "---------------"
		for(( c=0; c<$COLUMN; c++))
		do
			echo -n "| ${board[$r,$c]} |"
		done
		printf "\n"
	done
	echo "---------------"

}
function assignLetter(){
	if [[ $turn%2 -eq 0 ]]
	then
		player="X"
	else
		player="O"
	fi

}
function turnDecider(){
   while [[ $turn -le 9 && winChecker -eq 0 ]]
   do
      if [[ $turn%2 -eq 0 ]]
		then
				echo "Computers choice"
				computerPlay
      else
         echo "Players turn"
         read -p "Enter your choice: " ch
         putInCell $ch
      fi
	((turn++))
   done
}

function putInCell(){
		choice=$1
		assignLetter
		case $choice in
						0)
							board[0,0]=$player;;
						1)
                     board[0,1]=$player;;
						2)
                     board[0,2]=$player;;
						3)
                     board[1,0]=$player;;
						4)
                     board[1,1]=$player;;
						5)
                     board[1,2]=$player;;
						6)
                     board[2,0]=$player;;
						7)
                     board[2,1]=$player;;
						8)
                     board[2,2]=$player;;
						*)
							printf "Associative key not find "
							((turn--))
		esac
	displayBoard
	isWon
}

function isWon(){
	if [[ ${board[0,0]} == "X" && ${board[0,1]} == "X" && ${board[0,2]} == "X" ]]
	then
		winChecker=1
	elif [[ ${board[1,0]} == "X" && ${board[1,1]} == "X" && ${board[1,2]} == "X" ]]
	then
		winChecker=1
	elif [[ ${board[2,0]} == "X" && ${board[2,1]} == "X" && ${board[2,2]} == "X" ]]
	then
		winChecker=1
	elif [[ ${board[0,0]} == "O" && ${board[0,1]} == "O" && ${board[0,2]} == "O" ]]
   then
      winChecker=1
   elif [[ ${board[1,0]} == "O" && ${board[1,1]} == "O" && ${board[1,2]} == "O" ]]
   then
      winChecker=1
   elif [[ ${board[2,0]} == "O" && ${board[2,1]} == "O" && ${board[2,2]} == "O" ]]
   then
      winChecker=1
	elif [[ ${board[0,0]} == "X" && ${board[1,0]} == "X" && ${board[2,0]} == "X" ]]
	then
		winChecker=1
	elif [[ ${board[0,1]} == "X" && ${board[1,1]} == "X" && ${board[2,1]} == "X" ]]
	then
		winChecker=1
	elif [[ ${board[0,2]} == "X" && ${board[1,2]} == "X" && ${board[2,2]} == "X" ]]
	then
		winChecker=1
	elif [[ ${board[0,0]} == "O" && ${board[1,0]} == "O" && ${board[2,0]} == "O" ]]
   then
      winChecker=1
   elif [[ ${board[0,1]} == "O" && ${board[1,1]} == "O" && ${board[2,1]} == "O" ]]
   then
      winChecker=1
   elif [[ ${board[0,2]} == "O" && ${board[1,2]} == "O" && ${board[2,2]} == "O" ]]
	then
		winChecker=1
	elif [[ ${board[0,0]} == "O" && ${board[1,1]} == "O" && ${board[2,2]} == "O" ]]
   then
      winChecker=1
	elif [[ ${board[0,0]} == "X" && ${board[1,1]} == "X" && ${board[2,2]} == "X" ]]
   then
      winChecker=1
	elif [[ ${board[0,2]} == "O" && ${board[1,1]} == "O" && ${board[2,0]} == "O" ]]
   then
      winChecker=1
	elif [[ ${board[0,2]} == "X" && ${board[1,1]} == "X" && ${board[2,0]} == "X" ]]
   then
      winChecker=1
	fi
	if [[ $winChecker -eq 1 ]]
   then
      printf "player $player has won the game "
   elif [[ $turn -ge 9 ]]
   then
      printf "Match is tie: "
   fi

}
function computerPlay(){
	checkWonBlock
	return

}
function checkWonBlock(){
	if [[ ${board[0,0]} == "X"  && ${board[0,1]} == "X" && ${board[0,2]} == "-" ]]; then
				board[0,2]=X
			elif [[ ${board[1,0]} == "X"  && ${board[1,1]} == "X" && ${board[1,2]} == "-" ]]; then
				board[1,2]=X

			elif [[ ${board[2,0]} == "X"  && ${board[2,1]} == "X" && ${board[2,2]} == "-" ]]; then
				board[2,2]=X

			elif [[ ${board[0,0]} == "X"  && ${board[1,0]} == "X" && ${board[2,0]} == "-" ]]; then
				board[2,0]=X

			elif [[ ${board[0,1]} == "X"  && ${board[1,1]} == "X" && ${board[2,1]} == "-" ]]; then
				board[2,1]=X

			elif [[ ${board[0,2]} == "X"  && ${board[1,2]} == "X" && ${board[2,2]} == "-" ]]; then
			board[2,2]=X

			elif [[ ${board[0,0]} == "X"  && ${board[1,1]} == "X" && ${board[2,2]} == "-" ]]; then
				board[2,2]=X

			elif [[ ${board[0,2]} == "X"  && ${board[1,1]} == "X" && ${board[2,0]} == "-" ]]; then
				board[2,0]=X

			elif [[ ${board[0,0]} == "-"  && ${board[0,1]} == "X" && ${board[0,2]} == "X" ]]; then
				board[0,0]=X

			elif [[ ${board[1,0]} == "-"  && ${board[1,1]} == "X" && ${board[1,2]} == "X" ]]; then
				board[1,0]=X

			elif [[ ${board[2,0]} == "-"  && ${board[2,1]} == "X" && ${board[2,2]} == "X" ]]; then
				board[2,0]=X


			elif [[ ${board[0,0]} == "-"  && ${board[1,0]} == "X" && ${board[2,0]} == "X" ]]; then
				board[0,0]=X

			elif [[ ${board[0,1]} == "-"  && ${board[1,1]} == "X" && ${board[2,1]} == "X" ]]; then
				board[0,1]=X

			elif [[ ${board[0,2]} == "-"  && ${board[1,2]} == "X" && ${board[2,2]} == "X" ]]; then
				board[0,2]=X

			elif [[ ${board[0,0]} == "-"  && ${board[1,1]} == "X" && ${board[2,2]} == "X" ]]; then
				board[0,0]=X

			elif [[ ${board[0,2]} == "-"  && ${board[1,1]} == "X" && ${board[2,0]} == "X" ]]; then
				board[0,2]=X

			elif [[ ${board[0,0]} == "X"  && ${board[0,1]} == "-" && ${board[0,2]} == "X" ]]; then
				board[0,1]=X
			elif [[ ${board[1,0]} == "X"  && ${board[1,1]} == "-" && ${board[1,2]} == "X" ]]; then
				board[1,1]=X

			elif [[ ${board[2,0]} == "X"  && ${board[2,1]} == "-" && ${board[2,2]} == "X" ]]; then
				board[2,1]=X

			elif [[ ${board[0,0]} == "X"  && ${board[1,0]} == "-" && ${board[2,0]} == "X" ]]; then
				board[1,0]=X

			elif [[ ${board[0,1]} == "X"  && ${board[1,1]} == "-" && ${board[2,1]} == "X" ]]; then
				board[1,1]=X

			elif [[ ${board[0,2]} == "X"  && ${board[1,2]} == "-" && ${board[2,2]} == "X" ]]; then
				board[1,2]=X

			elif [[ ${board[0,0]} == "X"  && ${board[1,1]} == "-" && ${board[2,2]} == "X" ]]; then
				board[1,1]=X

			elif [[ ${board[0,2]} == "X"  && ${board[1,1]} == "-" && ${board[2,0]} == "X" ]]; then
				board[1,1]=X
			elif [[ ${board[0,0]} == "O"  && ${board[0,1]} == "O" && ${board[0,2]} == "-" ]]; then
				board[0,2]=X
			elif [[ ${board[1,0]} == "O"  && ${board[1,1]} == "O" && ${board[1,2]} == "-" ]]; then
				board[1,2]=X
			elif [[ ${board[2,0]} == "O"  && ${board[2,1]} == "O" && ${board[2,2]} == "-" ]]; then
				board[2,2]=X
			elif [[ ${board[0,0]} == "O"  && ${board[1,0]} == "O" && ${board[2,0]} == "-" ]]; then
				board[2,0]=X
			elif [[ ${board[0,1]} == "O"  && ${board[1,1]} == "O" && ${board[2,1]} == "-" ]]; then
				board[2,1]=X
			elif [[ ${board[0,2]} == "O"  && ${board[1,2]} == "O" && ${board[2,2]} == "-" ]]; then
				board[2,2]=X
			elif [[ ${board[0,0]} == "O"  && ${board[1,1]} == "O" && ${board[2,2]} == "-" ]]; then
				board[2,2]=X
			elif [[ ${board[0,2]} == "O"  && ${board[1,1]} == "O" && ${board[2,0]} == "-" ]]; then
				board[2,0]=X
			elif [[ ${board[0,0]} == "-"  && ${board[0,1]} == "O" && ${board[0,2]} == "O" ]]; then
				board[0,0]=X
			elif [[ ${board[1,0]} == "-"  && ${board[1,1]} == "O" && ${board[1,2]} == "O" ]]; then
				board[1,0]=X
			elif [[ ${board[2,0]} == "-"  && ${board[2,1]} == "O" && ${board[2,2]} == "O" ]]; then
				board[2,0]=X

			elif [[ ${board[0,0]} == "-"  && ${board[1,0]} == "O" && ${board[2,0]} == "O" ]]; then
				board[0,0]=X
			elif [[ ${board[0,1]} == "-"  && ${board[1,1]} == "O" && ${board[2,1]} == "O" ]]; then
				board[0,1]=X
			elif [[ ${board[0,2]} == "-"  && ${board[1,2]} == "O" && ${board[2,2]} == "O" ]]; then
				board[0,2]=X
			elif [[ ${board[0,0]} == "-"  && ${board[1,1]} == "O" && ${board[2,2]} == "O" ]]; then
				board[0,0]=X
			elif [[ ${board[0,2]} == "-"  && ${board[1,1]} == "O" && ${board[2,0]} == "O" ]]; then
				board[0,2]=X
			elif [[ ${board[0,0]} == "O"  && ${board[0,1]} == "-" && ${board[0,2]} == "O" ]]; then
				board[0,1]=X
			elif [[ ${board[1,0]} == "O"  && ${board[1,1]} == "-" && ${board[1,2]} == "O" ]]; then
				board[1,1]=X
			elif [[ ${board[2,0]} == "O"  && ${board[2,1]} == "-" && ${board[2,2]} == "O" ]]; then
				board[2,1]=X
			elif [[ ${board[0,0]} == "O"  && ${board[1,0]} == "-" && ${board[2,0]} == "O" ]]; then
				board[1,0]=X
			elif [[ ${board[0,1]} == "O"  && ${board[1,1]} == "-" && ${board[2,1]} == "O" ]]; then
				board[1,1]=X
			elif [[ ${board[0,2]} == "O"  && ${board[1,2]} == "-" && ${board[2,2]} == "O" ]]; then
				board[1,2]=X
			elif [[ ${board[0,0]} == "O"  && ${board[1,1]} == "-" && ${board[2,2]} == "O" ]]; then
				board[1,1]=X
			elif [[ ${board[0,2]} == "O"  && ${board[1,1]} == "-" && ${board[2,0]} == "O" ]]; then
				board[1,1]=X
#corner
			 elif [[ ${board[0,0]} == "-" ]]; then
         	board[0,0]="X"
         elif [[ ${board[0,2]} == "-" ]]; then
               board[0,2]="X"
         elif [[ ${board[2,0]} == "-" ]]; then
         	board[2,0]="X"
         elif [[ ${board[2,2]} == "-" ]]; then
         	board[2,2]="X"
			else
				cNumber=$((RANDOM%8+1))
				r=$(($cNumber/3))
				c=$(($cNumber%3))
			if [[ ${board[$r,$c]} == - ]]
		then
			putInCell $cNumber
		fi
		fi

displayBoard
isWon

}
#toss
initializeBoard
displayBoard
turnDecider
