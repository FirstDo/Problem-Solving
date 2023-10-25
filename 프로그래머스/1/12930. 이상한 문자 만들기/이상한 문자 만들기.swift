import Foundation

func solution(_ s:String) -> String {
    
    var result = [String]()
    
    for word in s.components(separatedBy: " ") {
        var str = ""
        
        for (index, value) in word.enumerated() {
            if index % 2 == 0 {
                str.append(value.uppercased())
            } else {
                str.append(value.lowercased())
            }
        }
        
        result.append(str)
    }
    
    return result.joined(separator: " ")
}