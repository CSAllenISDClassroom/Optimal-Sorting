import Foundation

//var words = ["John", "Josh", "joe", "Zach", "Haris", "Alex"]
var words = [String]()
var sortedWords = [String]()
let completedWords = words.sorted()


//Use this if we are using a file to get words
func getList() -> [String]{    
    if let listOfWordsURL = Bundle.main.url(forResource: "List",
                                            withExtension:"txt"){
        if let listOfWords = try? String(contentsOf: listOfWordsURL){
            words = listOfWords.components(separatedBy: "\n")
        }
    }

    if words.isEmpty {
        words = ["hi"]
    }
    return words
}

//use this to get words manually from the user
func getWords(array: [String]) -> [String]{
    var list = array

    print("Please enter a word:")
    print("(To stop typing in words type 'quit')")

    while let input = readLine() {
        guard input != "quit" else{
            break
        }

        if !list.contains(input) && input != "" {
            list.append(input)

            print("You entered: \(input)")
        }else if input == ""{
            print("Sorry, you can not leave this blank. Please type something in next time.")
        }else{
            print("Sorry, \"\(input)\" already exits")
        }

        print()
        print("Please enter a word:")
    }
    return list
}
func sorted(words:[String]) -> [String]{

    var sortedWords = words
    var isSorted = false
    while !isSorted{
        isSorted = true
        for i in 0 ..< (sortedWords.count - 1) {
            if sortedWords[i].lowercased() > sortedWords[i + 1].lowercased(){
                sortedWords = rearrange(array: sortedWords, fromIndex: i, toIndex: i + 1)
                isSorted = false
            }
        }
    }
    return sortedWords
}

func prop(originalWords: [String], sortedWords: [String]) -> String{
    if originalWords == sortedWords{
        return "Yes"
    } else {
        return "No"
    }    
}

func rearrange<T>(array: Array<T>, fromIndex: Int, toIndex: Int) -> Array<T> {
    var arr = array
    let element = arr.remove(at: fromIndex)
    arr.insert(element, at: toIndex)

    return arr
}
func printResults(words:[String]){
    for word in words{
        print(word)
    }
}

func likeToPrint(words: [String]){
    print("Would you like to print the results? (Yes or No)")
    while let line = readLine(){
        guard line.lowercased() != "yes" else{
            printResults(words: words)
            break
        }
        guard line.lowercased() != "no" else{
            break
        }
        
    }
}
var same : String

//Get it from a file
words = getList()

//Manually imput words 
//words = getWords(array: words)

//print("input of words:\(words)")

sortedWords = sorted(words: words)
likeToPrint(words:sortedWords)
let wordsSorted = words.sorted{$0.localizedCompare($1) == .orderedAscending}
same = prop(originalWords: wordsSorted, sortedWords: sortedWords)

print("The words sorted correced: \(same)")
