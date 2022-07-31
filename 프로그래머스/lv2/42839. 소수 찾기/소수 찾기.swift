import Foundation

func permutation(_ numbers: [Int]) -> [Int] {
    let len = numbers.count
    var visit = Array(repeating: false, count: len + 1)
    var temp = [Int]()
    
    var result = [Int]()
    
    func perm(_ depth: Int) {
        if !temp.isEmpty {
            result.append(Int(temp.map{String($0)}.joined())!)
        }
        
        for i in 0..<len where !visit[i] {
            visit[i] = true
            temp.append(numbers[i])
            
            perm(depth + 1)
            
            visit[i] = false
            temp.removeLast()
        }
    }
    
    perm(0)
    
    return result
}

func isPrime(_ num: Int) -> Bool {
    switch num {
    case 0, 1:
        return false
    case 2, 3:
        return true
    default:
        break
    }
    
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 { return false }
    }
    
    return true
}

func solution(_ numbers:String) -> Int {
    let numbers = numbers.map { Int(String($0))! }
    let result = Set(permutation(numbers))
    return result.filter(isPrime(_:)).count
}
