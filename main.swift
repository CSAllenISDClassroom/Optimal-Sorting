import Foundation

//var words = ["John", "Josh", "joe", "Zach", "Haris", "Alex"]
var words = [String]()
var sortedWords = [String]()
let completedWords = words.sorted()
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
words = getList()
//words = readLine(strippingNewline: false).components(separatedBy: "\n")
print("input of words:\(words)")
sortedWords = sorted(words: words)
print("output of words:\(sortedWords)")
print("actual sorted word:\(completedWords)")
printResults(words: sortedWords)
