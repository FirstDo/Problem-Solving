import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let total = (1...count).reduce(0) { partialResult, cnt in
        partialResult + cnt * price
    }
    
    if money - total < 0 {
        return Int64(total - money)
    } else {
        return 0
    }
}
