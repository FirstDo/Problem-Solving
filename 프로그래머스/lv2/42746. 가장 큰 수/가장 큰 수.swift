import Foundation

func solution(_ numbers:[Int]) -> String {
    var result = numbers
        .sorted { n1, n2 in
            Int("\(n1)\(n2)")! > Int("\(n2)\(n1)")!
        }
        .map { String($0) }
        .joined()
    
    
    while result.first == "0" {
        result.removeFirst()
    }
    
    if result.isEmpty {
        result = "0"
    }
    
    return result
}