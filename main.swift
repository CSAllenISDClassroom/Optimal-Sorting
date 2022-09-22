var line : String?
var words = ["test"]
repeat {
    print("type quit to stop")
    line = readLine()
    if line != nil {
        words.append(line!)
    }
} while line != "quit"

extension Array where Element: Comparable {

    //This function makes the quicksort function be able to run itself
    mutating func quickSort() {
        quickSort(&self[...])
    }  

    //This function attempts to find a good pivot inbetween two numbers
    func pivotFinder(in words: inout ArraySlice<Element>) {
        let start = words.startIndex
        let middle = (words.startIndex + words.endIndex) / 2
        let end = words.endIndex - 1
        
        if words[start] > words[middle] {
            words.swapAt(start, middle)
        }
        
        if words[middle] > words[end] {
            words.swapAt(middle, end)
        }
        
        if words[start] > words[middle] {
            words.swapAt(start, middle)
        }
    }

    //This function puts everything less than the pivot point before everything bigger than the pivot
    func sort(_ words: inout ArraySlice<Element>) -> ArraySlice<Element>.Index {
        let midPoint = (words.startIndex + words.endIndex) / 2
        words.swapAt(midPoint, words.startIndex)
        let pivot = words[words.startIndex]
        
        var lower = words.startIndex
        var upper = words.endIndex - 1
        
        repeat {
            while lower < words.endIndex - 1 && words[lower] <= pivot {
                lower += 1
            }
            while words[upper] > pivot {
                upper -= 1
            }
            
            if lower < upper {
                words.swapAt(lower, upper)
            }
        } while lower < upper
        
        words.swapAt(words.startIndex, upper)
        return upper
    }

    //This function sorts a pivot, then does the same for the section inbetween the pivot and after the pivot
    func quickSort(_ words: inout ArraySlice<Element>) {
        if words.count < 2 {
            return
        }
        
        pivotFinder(in: &words)
        let pivot = sort(&words)
        
        quickSort(&words[words.startIndex..<pivot])
        quickSort(&words[pivot + 1..<words.endIndex])
    }
}



words.quickSort()
print(words)
print(words.count)
