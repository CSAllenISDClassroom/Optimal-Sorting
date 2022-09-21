#!/usr/bin/python3.9
import sys
read = sys.stdin.read()
lower = read.lower()

#The command .split() converts the input of strings and puts those strings into an array
words = lower.split()



def sortWords(words):
    #this is the first step that start from the first variable of the array, and the for loop will allow us to reuse the loop untill the words are properly sorted
    for index in range(1, len(words)):
        sortedWords = words[index]
        nextIndex = index

        #This while lopp allows the main function to push the alphabetically decending lower var to the right, or atleast down while keeping the higehr of the two in the same place
        while nextIndex > 0 and words[nextIndex -1] > sortedWords:
            words[nextIndex] = words[nextIndex - 1]

            nextIndex = nextIndex - 1
            words[nextIndex] = sortedWords


sortWords(words)

print(" ")
print(*words, sep="\n")
