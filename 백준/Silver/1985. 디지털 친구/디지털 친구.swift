// 1985번 디지털 친구

import Foundation

func isFriend(_ n1: [Int], _ n2: [Int]) -> Bool {
    return Set(n1) == Set(n2)
}

func isAlmostFriend(_ n1: [Int], _ n2: [Int]) -> Bool {
    let n2Set = Set(n2)
    
    let len = n1.count
    var temp = n1
    
    for i in 0..<len-1 {
        // 앞에거 빼고, 뒤에꺼 더하기
        if temp[i] > 0 && temp[i+1] < 9 {
            temp[i] -= 1
            temp[i+1] += 1
            
            if temp[0] != 0 && Set(temp) == n2Set {
                return true
            }
            
            temp[i] += 1
            temp[i+1] -= 1
        }
        
        // 앞에거 더하고, 뒤에꺼 빼기
        
        if temp[i] < 9 && temp[i+1] > 0 {
            temp[i] += 1
            temp[i+1] -= 1
            
            if Set(temp) == n2Set {
                return true
            }
            
            temp[i] -= 1
            temp[i+1] += 1
        }
    }
    
    return false
}

for _ in 0..<3 {
    let t = readLine()!.components(separatedBy: " ").map { Array($0).map{Int(String($0))!} }
    let (n1, n2) = (t[0], t[1])
    
    if isFriend(n1, n2) {
        print("friends")
    } else if isAlmostFriend(n1, n2) || isAlmostFriend(n2, n1) {
        print("almost friends")
    } else {
        print("nothing")
    }
}
