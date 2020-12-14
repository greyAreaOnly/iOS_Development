import UIKit

func secondLargest(numbers: [Int])-> (Int){
    
    var newArray = numbers.sorted(by:>)
    var second: Int
    
    for i in newArray{
        if newArray[i] != newArray[i+1]{
            second = newArray[i]
        }else{
            continue
        }
    }

        return second
}



secondLargest(numbers: [1,2,3,4,5,5])
