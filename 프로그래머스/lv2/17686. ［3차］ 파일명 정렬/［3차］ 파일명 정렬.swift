import Foundation

struct File: Comparable {
    let index: Int
    let head: String
    let number: Int
    let originalString: String
    
    static func < (lhs: File, rhs: File) -> Bool {
        if lhs.head == rhs.head {
            if lhs.number == rhs.number {
                return lhs.index < rhs.index
            } else {
                return lhs.number < rhs.number
            }
            
        } else {
            return lhs.head < rhs.head
        }
    }
}

func solution(_ files:[String]) -> [String] {
    let files = files.enumerated().map { (index, file) -> File in
        let fileArr = Array(file)
        let i = fileArr.firstIndex { $0.isNumber }!
        let j = fileArr[i...].firstIndex { !$0.isNumber } ?? fileArr.count
        
        let head = String(fileArr[0..<i]).lowercased()
        let number = String(fileArr[i..<j]).count > 5 ? String(String(fileArr[i..<j]).dropLast(String(fileArr[i..<j]).count - 5)) : String(fileArr[i..<j])
        
        return File(index: index, head: head, number: Int(number)!, originalString: String(fileArr))
    }
    
    return files.sorted(by: <).map(\.originalString)
}