import Foundation

func solution(_ order:[Int]) -> Int {
    var boxes = Array((1...order.count).reversed())
    var stack = [Int]()
    var answer = 0
    
    for target in order {
        var isFind = false
        
        // stack에서 발견했을때
        if stack.last == target {
            stack.removeLast()
            answer += 1
            continue
        }
        
        while !boxes.isEmpty {
            let box = boxes.removeLast()
            
            // box에서 발견했을때
            if box == target {
                answer += 1
                isFind = true
                break
            }
            
            stack.append(box)
        }
        
        // stack에서도, box에서도 발견하지 못했다면 끝
        if isFind == false { break }
    }
    
    return answer
}