func solution(_ answers:[Int]) -> [Int] {

    let compareFirst = [1,2,3,4,5]
    let compareSecond = [2,1,2,3,2,4,2,5]
    let compareThird = [3,3,1,1,2,2,4,4,5,5]
    
    let first = answers.enumerated().filter{$0.element == compareFirst[$0.offset % compareFirst.count]}.count
    let second = answers.enumerated().filter{$0.element == compareSecond[$0.offset % compareSecond.count]}.count
    let third = answers.enumerated().filter{$0.element == compareThird[$0.offset % compareThird.count]}.count
    
    
    let result = [1: first, 2: second, 3: third]
    
    return result
        .sorted { $0.key < $1.key }
        .filter { $0.value == result.values.max() }
        .map { $0.key }
}
