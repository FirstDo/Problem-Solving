import Foundation

var bag = [String: Int]()

func solution(_ gems:[String]) -> [Int] {
    let len = gems.count
    let gemCount = Set(gems).count
    
    var start = 0
    var end = 0
    
    var answer = [(start: Int, end: Int, length: Int)]()
    
    bag[gems.first!] = 1
    
    while start <= end {
        // 이미 보석을 다 포함했을 경우
        if bag.count == gemCount {
            // 정답을 기록한다
            answer.append((start, end, end - start + 1))
            
            // bag에서 start를 지우고, start + 1
            
            bag[gems[start]]! -= 1
            if bag[gems[start]] == 0 {
                bag[gems[start]] = nil
            }
            
            start += 1
        }
        // 아직 보석을 포함하지 못했을 경우
        else {
            // end + 1
            if end + 1 == len { break }
            end += 1
            
            if bag[gems[end]] == nil {
                bag[gems[end]] = 0
            }
            
            bag[gems[end]]! += 1
        }
    }
    
    let result = answer.sorted { lhs, rhs in
        if lhs.length == rhs.length {
            return lhs.start < rhs.start
        } else {
            return lhs.length < rhs.length
        }
    }.first!

    return [result.start + 1, result.end + 1]
}