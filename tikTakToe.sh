#!/bin/bash -x
#Discription:Tic Tac Toe challenge to  the computer
#Author:Hrishikesh Bodake
#Since:March 9 2020 /Monday
ROW=3
COLUMN=3
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
initializeBoard
displayBoard
