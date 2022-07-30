import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    let len = numbers.count
    var answer = 0
    
    func dfs(_ index: Int, _ sum: Int) {
        if index == len {
            if sum == target { answer += 1 }
            return
        }
        
        dfs(index+1, sum + numbers[index])
        dfs(index+1, sum - numbers[index])
    }
    
    dfs(0, 0)
    return answer
}
