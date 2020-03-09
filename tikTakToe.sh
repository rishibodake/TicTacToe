#!/bin/bash -x
#Discription:Tic Tac Toe challenge to  the computer
#Author:Hrishikesh Bodake
#Since:March 9 2020 /Monday
ROW=3
COLUMN=3
player="P"
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
	if [[ $((RANDOM%2)) -eq 0 ]]
	then
		player="X"
	else
		player="O"
	fi
}
function toss(){
	if [[  $((RANDOM%2)) -eq 0 ]]
	then
		echo Player 1 Term
	else
		echo Player 2 Term
	fi
}
function putInCell(){
	assignLetter
	read -p "Enter your choice: " choice
	case $choice in
						1)
							board[0,0]=$player;;
						2)
                     board[0,1]=$player;;
						3)
                     board[0,2]=$player;;
						4)
                     board[1,0]=$player;;
						5)
                     board[1,1]=$player;;
						6)
                     board[1,2]=$player;;
						7)
                     board[2,0]=$player;;
						8)
                     board[2,1]=$player;;
						9)
                     board[2,2]=$player;;
						*)
							printf "Associative key not find "
	esac
displayBoard
}
toss
initializeBoard
displayBoard
putInCell
