import Foundation

func isSatisfy(_ want: [String], _ number: [Int], _ dicts: [String: Int]) -> Bool {
    for (fruit, needCount) in zip(want, number) {
        guard let count = dicts[fruit], count >= needCount else { return false }
    }
    return true
}

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var answer = 0
    var dicts = [String: Int]()
    
    let len = discount.count
    var left = 0
    var right = 9
    
    for i in left...right {
        let fruit = discount[i]
        
        if dicts[fruit] == nil {
            dicts[fruit] = 0
        }
        
        dicts[fruit]! += 1
    }

    while left < len {
        // 현재 조건을 만족하는지 확인
        if isSatisfy(want, number, dicts) {
            answer += 1
        }
        
        // 조건을 만족한다면 left ++ , right ++
        
        /// 이전 날짜의 할인과일 빼기
        let deleteTarget = discount[left]
        dicts[deleteTarget]! -= 1
        left += 1
        
        /// 다음 날짜의 할인 과일 더하기
        if right + 1 < len {
            right += 1
            let addTarget = discount[right]
            
            if dicts[addTarget] == nil {
                dicts[addTarget] = 0
            }
            
            dicts[addTarget]! += 1
        }
    }
    
    return answer
}