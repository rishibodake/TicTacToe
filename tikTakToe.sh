#!/bin/bash -x
#Discription:Tic Tac Toe challenge to  the computer
#Author:Hrishikesh Bodake
#Since:March 9 2020 /Monday
emptyFlag=0
ROW=3
COLUMN=3
player="O"
turn=1
Computer="X"
playerTwo="O"
winChecker=0
temp=0
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
		player=$playerOne
	else
		player=$playerTwo
	fi
}
function toss(){
	if [[ $((RANDOM%2)) -eq 0 ]]
	then
		temp=1
	else
		temp=0
	fi
}
function turnDecider(){
   while [[ $turn -le 9 && winChecker -eq 0 ]]
   do
      if [[ $turn%2 -eq $temp ]]
		then
				echo "Players turn"
            read -p "Enter your choice: " ch
            putInCell $ch
      else
				echo "Computers Turn"
            computerPlay

      fi
	((turn++))
   done
}

function putInCell(){
		choice=$1
#		assignLetter
		r=$(($choice/3))
		c=$(($choice%3))

		board[$r,$c]=$player
		displayBoard
		isWon
}

function isWon(){
	if [[ ${board[0,0]} == "$Computer" && ${board[0,1]} == "$Computer" && ${board[0,2]} == "$Computer" ]]
	then
		winChecker=1
	elif [[ ${board[1,0]} == "$Computer" && ${board[1,1]} == "$Computer" && ${board[1,2]} == "$Computer" ]]
	then
		winChecker=1
	elif [[ ${board[2,0]} == "$Computer" && ${board[2,1]} == "$Computer" && ${board[2,2]} == "$Computer" ]]
	then
		winChecker=1
	elif [[ ${board[0,0]} == "$playerTwo" && ${board[0,1]} == "$playerTwo" && ${board[0,2]} == "$playerTwo" ]]
   then
      winChecker=1
   elif [[ ${board[1,0]} == "$playerTwo" && ${board[1,1]} == "$playerTwo" && ${board[1,2]} == "$playerTwo" ]]
   then
      winChecker=1
   elif [[ ${board[2,0]} == "$playerTwo" && ${board[2,1]} == "$playerTwo" && ${board[2,2]} == "$playerTwo" ]]
   then
      winChecker=1
	elif [[ ${board[0,0]} == "$Computer" && ${board[1,0]} == "$Computer" && ${board[2,0]} == "$Computer" ]]
	then
		winChecker=1
	elif [[ ${board[0,1]} == "$Computer" && ${board[1,1]} == "$Computer" && ${board[2,1]} == "$Computer" ]]
	then
		winChecker=1
	elif [[ ${board[0,2]} == "$Computer" && ${board[1,2]} == "$Computer" && ${board[2,2]} == "$Computer" ]]
	then
		winChecker=1
	elif [[ ${board[0,0]} == "$playerTwo" && ${board[1,0]} == "$playerTwo" && ${board[2,0]} == "$playerTwo" ]]
   then
      winChecker=1
   elif [[ ${board[0,1]} == "$playerTwo" && ${board[1,1]} == "$playerTwo" && ${board[2,1]} == "$playerTwo" ]]
   then
      winChecker=1
   elif [[ ${board[0,2]} == "$playerTwo" && ${board[1,2]} == "$playerTwo" && ${board[2,2]} == "$playerTwo" ]]
	then
		winChecker=1
	elif [[ ${board[0,0]} == "$playerTwo" && ${board[1,1]} == "$playerTwo" && ${board[2,2]} == "$playerTwo" ]]
   then
      winChecker=1
	elif [[ ${board[0,0]} == "$Computer" && ${board[1,1]} == "$Computer" && ${board[2,2]} == "$Computer" ]]
   then
      winChecker=1
	elif [[ ${board[0,2]} == "$playerTwo" && ${board[1,1]} == "$playerTwo" && ${board[2,0]} == "$playerTwo" ]]
   then
      winChecker=1
	elif [[ ${board[0,2]} == "$Computer" && ${board[1,1]} == "$Computer" && ${board[2,0]} == "$Computer" ]]
   then
      winChecker=1
	fi
	if [[ $winChecker -eq 1 ]]
   then
      if [[ $player -eq $Computer ]]
		then
			printf "\n Computer has Won "
		else
			printf "\n You have Won the game "
		fi
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
	if [[ ${board[0,0]} == "$Computer"  && ${board[0,1]} == "$Computer" && ${board[0,2]} == "-" ]]; then
				board[0,2]=X
			elif [[ ${board[1,0]} == "$Computer"  && ${board[1,1]} == "$Computer" && ${board[1,2]} == "-" ]]; then
				board[1,2]=X

			elif [[ ${board[2,0]} == "$Computer"  && ${board[2,1]} == "$Computer" && ${board[2,2]} == "-" ]]; then
				board[2,2]=X

			elif [[ ${board[0,0]} == "$Computer"  && ${board[1,0]} == "$Computer" && ${board[2,0]} == "-" ]]; then
				board[2,0]=X

			elif [[ ${board[0,1]} == "$Computer"  && ${board[1,1]} == "$Computer" && ${board[2,1]} == "-" ]]; then
				board[2,1]=X

			elif [[ ${board[0,2]} == "$Computer"  && ${board[1,2]} == "$Computer" && ${board[2,2]} == "-" ]]; then
			board[2,2]=X

			elif [[ ${board[0,0]} == "$Computer"  && ${board[1,1]} == "$Computer" && ${board[2,2]} == "-" ]]; then
				board[2,2]=X

			elif [[ ${board[0,2]} == "$Computer"  && ${board[1,1]} == "$Computer" && ${board[2,0]} == "-" ]]; then
				board[2,0]=X

			elif [[ ${board[0,0]} == "-"  && ${board[0,1]} == "$Computer" && ${board[0,2]} == "$Computer" ]]; then
				board[0,0]=X

			elif [[ ${board[1,0]} == "-"  && ${board[1,1]} == "$Computer" && ${board[1,2]} == "$Computer" ]]; then
				board[1,0]=X

			elif [[ ${board[2,0]} == "-"  && ${board[2,1]} == "$Computer" && ${board[2,2]} == "$Computer" ]]; then
				board[2,0]=X


			elif [[ ${board[0,0]} == "-"  && ${board[1,0]} == "$Computer" && ${board[2,0]} == "$Computer" ]]; then
				board[0,0]=X

			elif [[ ${board[0,1]} == "-"  && ${board[1,1]} == "$Computer" && ${board[2,1]} == "$Computer" ]]; then
				board[0,1]=X

			elif [[ ${board[0,2]} == "-"  && ${board[1,2]} == "$Computer" && ${board[2,2]} == "$Computer" ]]; then
				board[0,2]=X

			elif [[ ${board[0,0]} == "-"  && ${board[1,1]} == "$Computer" && ${board[2,2]} == "$Computer" ]]; then
				board[0,0]=X

			elif [[ ${board[0,2]} == "-"  && ${board[1,1]} == "$Computer" && ${board[2,0]} == "$Computer" ]]; then
				board[0,2]=X

			elif [[ ${board[0,0]} == "$Computer"  && ${board[0,1]} == "-" && ${board[0,2]} == "$Computer" ]]; then
				board[0,1]=X
			elif [[ ${board[1,0]} == "$Computer"  && ${board[1,1]} == "-" && ${board[1,2]} == "$Computer" ]]; then
				board[1,1]=X

			elif [[ ${board[2,0]} == "$Computer"  && ${board[2,1]} == "-" && ${board[2,2]} == "$Computer" ]]; then
				board[2,1]=X

			elif [[ ${board[0,0]} == "$Computer"  && ${board[1,0]} == "-" && ${board[2,0]} == "$Computer" ]]; then
				board[1,0]=X

			elif [[ ${board[0,1]} == "$Computer"  && ${board[1,1]} == "-" && ${board[2,1]} == "$Computer" ]]; then
				board[1,1]=X

			elif [[ ${board[0,2]} == "$Computer"  && ${board[1,2]} == "-" && ${board[2,2]} == "$Computer" ]]; then
				board[1,2]=X

			elif [[ ${board[0,0]} == "$Computer"  && ${board[1,1]} == "-" && ${board[2,2]} == "$Computer" ]]; then
				board[1,1]=X

			elif [[ ${board[0,2]} == "$Computer"  && ${board[1,1]} == "-" && ${board[2,0]} == "$Computer" ]]; then
				board[1,1]=X
			elif [[ ${board[0,0]} == "$playerTwo"  && ${board[0,1]} == "$playerTwo" && ${board[0,2]} == "-" ]]; then
				board[0,2]=X
			elif [[ ${board[1,0]} == "$playerTwo"  && ${board[1,1]} == "$playerTwo" && ${board[1,2]} == "-" ]]; then
				board[1,2]=X
			elif [[ ${board[2,0]} == "$playerTwo"  && ${board[2,1]} == "$playerTwo" && ${board[2,2]} == "-" ]]; then
				board[2,2]=X
			elif [[ ${board[0,0]} == "$playerTwo"  && ${board[1,0]} == "$playerTwo" && ${board[2,0]} == "-" ]]; then
				board[2,0]=X
			elif [[ ${board[0,1]} == "$playerTwo"  && ${board[1,1]} == "$playerTwo" && ${board[2,1]} == "-" ]]; then
				board[2,1]=X
			elif [[ ${board[0,2]} == "$playerTwo"  && ${board[1,2]} == "$playerTwo" && ${board[2,2]} == "-" ]]; then
				board[2,2]=X
			elif [[ ${board[0,0]} == "$playerTwo"  && ${board[1,1]} == "$playerTwo" && ${board[2,2]} == "-" ]]; then
				board[2,2]=X
			elif [[ ${board[0,2]} == "$playerTwo"  && ${board[1,1]} == "$playerTwo" && ${board[2,0]} == "-" ]]; then
				board[2,0]=X
			elif [[ ${board[0,0]} == "-"  && ${board[0,1]} == "$playerTwo" && ${board[0,2]} == "$playerTwo" ]]; then
				board[0,0]=X
			elif [[ ${board[1,0]} == "-"  && ${board[1,1]} == "$playerTwo" && ${board[1,2]} == "$playerTwo" ]]; then
				board[1,0]=X
			elif [[ ${board[2,0]} == "-"  && ${board[2,1]} == "$playerTwo" && ${board[2,2]} == "$playerTwo" ]]; then
				board[2,0]=X

			elif [[ ${board[0,0]} == "-"  && ${board[1,0]} == "$playerTwo" && ${board[2,0]} == "$playerTwo" ]]; then
				board[0,0]=X
			elif [[ ${board[0,1]} == "-"  && ${board[1,1]} == "$playerTwo" && ${board[2,1]} == "$playerTwo" ]]; then
				board[0,1]=X
			elif [[ ${board[0,2]} == "-"  && ${board[1,2]} == "$playerTwo" && ${board[2,2]} == "$playerTwo" ]]; then
				board[0,2]=X
			elif [[ ${board[0,0]} == "-"  && ${board[1,1]} == "$playerTwo" && ${board[2,2]} == "$playerTwo" ]]; then
				board[0,0]=X
			elif [[ ${board[0,2]} == "-"  && ${board[1,1]} == "$playerTwo" && ${board[2,0]} == "$playerTwo" ]]; then
				board[0,2]=X
			elif [[ ${board[0,0]} == "$playerTwo"  && ${board[0,1]} == "-" && ${board[0,2]} == "$playerTwo" ]]; then
				board[0,1]=X
			elif [[ ${board[1,0]} == "$playerTwo"  && ${board[1,1]} == "-" && ${board[1,2]} == "$playerTwo" ]]; then
				board[1,1]=X
			elif [[ ${board[2,0]} == "$playerTwo"  && ${board[2,1]} == "-" && ${board[2,2]} == "$playerTwo" ]]; then
				board[2,1]=X
			elif [[ ${board[0,0]} == "$playerTwo"  && ${board[1,0]} == "-" && ${board[2,0]} == "$playerTwo" ]]; then
				board[1,0]=X
			elif [[ ${board[0,1]} == "$playerTwo"  && ${board[1,1]} == "-" && ${board[2,1]} == "$playerTwo" ]]; then
				board[1,1]=X
			elif [[ ${board[0,2]} == "$playerTwo"  && ${board[1,2]} == "-" && ${board[2,2]} == "$playerTwo" ]]; then
				board[1,2]=X
			elif [[ ${board[0,0]} == "$playerTwo"  && ${board[1,1]} == "-" && ${board[2,2]} == "$playerTwo" ]]; then
				board[1,1]=X
			elif [[ ${board[0,2]} == "$playerTwo"  && ${board[1,1]} == "-" && ${board[2,0]} == "$playerTwo" ]]; then
				board[1,1]=X
#corner
			elif [[ ${board[0,0]} == "-" ]]; then
         	board[0,0]="$Computer"
         elif [[ ${board[0,2]} == "-" ]]; then
               board[0,2]="$Computer"
         elif [[ ${board[2,0]} == "-" ]]; then
         	board[2,0]="$Computer"
         elif [[ ${board[2,2]} == "-" ]]; then
         	board[2,2]="$Computer"

			# Center

         elif [[ ${board[1,1]} == "-" ]]; then
               board[1,1]="$Computer"
			# Sides
         elif [[ ${board[0,1]} == "-" ]]; then
               board[0,1]="$Computer"
         elif [[ ${board[1,0]} == "-" ]]; then
               board[1,0]="$Computer"
         elif [[ ${board[1,2]} == "-" ]]; then
               board[1,2]="$Computer"
         elif [[ ${board[2,1]} == "-" ]]; then
               board[2,1]="$Computer"
		fi

displayBoard
isWon

}
initializeBoard
displayBoard
toss
turnDecider
