// 11867번 박스 나누기 게임

/*
이기기 위해서는 2개 남겨진 돌을 받아야함..!
 */

import Foundation
let nm = readLine()!.components(separatedBy: " ").map{Int($0)!}

let n = nm[0], m = nm[1]

if n % 2 != 0 && m % 2 != 0 {
    print("B")
} else {
    print("A")
}
