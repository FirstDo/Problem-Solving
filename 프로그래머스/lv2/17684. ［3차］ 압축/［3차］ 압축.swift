var dicts: [String: Int] = [
    "A": 1, "B": 2, "C": 3,
    "D": 4, "E": 5, "F": 6,
    "G": 7, "H": 8, "I": 9,
    "J": 10, "K": 11, "L": 12,
    "M": 13, "N": 14, "O": 15,
    "P": 16, "Q": 17, "R": 18,
    "S": 19, "T": 20, "U": 21,
    "V": 22, "W": 23, "X": 24,
    "Y": 25, "Z": 26
]

func solution(_ msg:String) -> [Int] {
    if dicts[msg] != nil { return [dicts[msg]!] }
    
    var msg = msg.map { String($0) }
    
    var startIndex = 0
    var endIndex = 0
    
    var result = [Int]()
    
    while true {
        if endIndex == msg.count {
            result.append(dicts[msg[startIndex..<endIndex].joined()]!)
            break
        }
        
        let targetKey = msg[startIndex...endIndex].joined()
        
        if dicts[targetKey] == nil {
            dicts[targetKey] = dicts.count + 1

            let key = msg[startIndex...endIndex-1].joined()
            result.append(dicts[key]!)
            
            startIndex = endIndex
            endIndex = startIndex
        } else {
            endIndex += 1
        }
    }
    
    return result
}