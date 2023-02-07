func solution(_ num:Int, _ total:Int) -> [Int] {
    
    let x = (total - (0..<num).reduce(0, +)) / num
    return (x..<x+num).map { $0 }
}