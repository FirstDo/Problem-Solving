import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return zip(arr1, arr2)
        .map { $0.0 | $0.1 }
        .map { num -> String in
            let binary = String(num, radix: 2, uppercase: true)
            
            if binary.count < n {
                return String(repeating: "0", count: n - binary.count) + binary
            } else {
                return binary
            }
        }
        .map { str in
            str.replacingOccurrences(of: "1", with: "#")
                .replacingOccurrences(of: "0", with: " ")
        }
}