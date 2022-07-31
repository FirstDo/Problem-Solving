import Foundation

func solution(_ numbers:[Int]) -> String {
    let result = numbers
        .sorted { n1, n2 in
            Int("\(n1)\(n2)")! > Int("\(n2)\(n1)")!
        }
        .map { String($0) }
        .joined()
    
    return result.first == "0" ? "0" : result
}