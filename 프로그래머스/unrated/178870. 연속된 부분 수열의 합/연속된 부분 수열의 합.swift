import Foundation

struct Model {
    let startIndex: Int
    let endIndex: Int
    
    var len: Int {
        endIndex - startIndex + 1
    }
}

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var answers = [Model]()
    var left = 0
    var right = 0
    var sum = sequence[left]
    
    while left <= right, right < sequence.count {
        // 현재 조건 만족할때, left, right + 1
        if sum == k {
            answers.append(Model(startIndex: left, endIndex: right))
            
            sum -= sequence[left]
            left += 1
            
            if right + 1 == sequence.count { break }
            right += 1
            sum += sequence[right]
        }
        
        // 현재 수열합이 너무 클때, left를 + 1
        else if sum > k {
            sum -= sequence[left]
            left += 1
        }
        
        // 현재 수열합이 너무 작을때, right를 + 1
        else if sum < k {
            if right + 1 == sequence.count { break }
            right += 1
            sum += sequence[right]
        }
        
    }
    
    answers.sort { m1, m2 in
        if m1.len == m2.len {
            return m1.startIndex < m2.startIndex
        } else {
            return m1.len < m2.len
        }
    }
    
    if let answer = answers.first {
        return [answer.startIndex, answer.endIndex]
    } else {
        return []
    }
}