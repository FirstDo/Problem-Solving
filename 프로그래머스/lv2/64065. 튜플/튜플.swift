import Foundation

func solution(_ s:String) -> [Int] {
    var s = s.dropLast(2)
    _ = s.removeFirst()
    
    var result = [Int]()
    
    let array = s
        .components(separatedBy: "},")
        .map { str -> Set<Int> in
            let temp = str[str.startIndex...]
                .dropFirst()
                .components(separatedBy: ",")
                .map { Int($0)! }
            return Set(temp)
        }
        .sorted {
            $0.count < $1.count
        }

    for value in array {
        let element = value.subtracting(result).first!
        result.append(element)
    }
    
    return result
}