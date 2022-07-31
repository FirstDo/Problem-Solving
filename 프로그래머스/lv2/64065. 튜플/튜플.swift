import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    _ = s.removeFirst()
    _ = s.removeLast()
    _ = s.removeLast()
    
    let arr = s.components(separatedBy: "},").map { $0.dropFirst() }.sorted(by: {$0.count < $1.count})
    var result = [Int]()
    
    for (index, value) in arr.enumerated() {
        if index == 0 {
            result.append(Int(value)!)
            continue
        }
        
        let subArr = Set(value.components(separatedBy: ",").map {Int($0)!})
        let nextNum = subArr.subtracting(result).first!
        result.append(nextNum)
    }
    
    return result
}