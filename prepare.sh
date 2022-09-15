#!/bin/bash

function makeList() {
  	echo "Creating a random list of words. This will take a moment...";
	cat /usr/share/dict/words | sort --random-sort > randomWords.txt;
}

function getWords() {
    echo "How many words would you like to sort?"
    read numWords

    if ! [[ ${numWords} =~ ^[0-9]+$ ]];
    then
	echo "Expected Whole number"
    fi
    
    echo "Where would you like to start - Top or Bottom?"
    read start
    
    if [ ${start,,} = "top" ];
    then
       head -n $numWords randomWords.txt > List.txt
    elif [ ${start,,} = "bottom" ];
    then
	tail -n $numWords randomWords.txt > List.txt	 
    else
	echo "Expected Top or Bottom please try again."
    fi
    
    
}

sh ./make.sh
makeList
getWords
sh ./run.sh
