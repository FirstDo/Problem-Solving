import Foundation

struct File: CustomStringConvertible {
    let originalString: String
    let head: String
    let number: Int
    let id: Int
    
    var description: String {
        return "head: \(head)\nnumber: \(number)\nid: \(id)\n"
    }
}

func parse(str: EnumeratedSequence<[String]>.Element) -> File {
    let index = str.offset
    let file = Array(str.element)
    
    let numberIndex = file.firstIndex { $0.isNumber }!
    let tailIndex = file[numberIndex...].firstIndex { !$0.isNumber } ?? file.count
    
    return File(
        originalString: str.element,
        head: String(file[0..<numberIndex]).lowercased(),
        number: Int(String(file[numberIndex..<tailIndex]))!,
        id: index
    )
}

func solution(_ files:[String]) -> [String] {
    
    var parsedFile = files.enumerated().map(parse)
    
    parsedFile.sort { f1, f2 in
        if f1.head.lowercased() == f2.head.lowercased() {
            if f1.number == f2.number {
                return f1.id < f2.id
            } else {
                return f1.number < f2.number
            }
            
        } else {
            return f1.head.lowercased() < f2.head.lowercased()
        }
    }
    
    return parsedFile.map { $0.originalString }
}
