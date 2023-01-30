func solution(_ numbers:[Int]) -> [Int] {
    var answer = Array(repeating: -1, count: numbers.count)
    var stack = [(Int, Int)]()
    var array = numbers.enumerated().reversed()
    
    while !array.isEmpty {
        let (index, number) = array.removeLast()
        
        while !stack.isEmpty && stack.last!.1 < number {
            let (idx, num) = stack.removeLast()
            answer[idx] = number
        }
        
        stack.append((index, number))
    }
    
    return answer
}