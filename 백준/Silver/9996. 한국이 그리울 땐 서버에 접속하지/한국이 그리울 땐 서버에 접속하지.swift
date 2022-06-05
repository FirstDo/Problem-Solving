// 9996번 한국이 그리울 땐 서버에 접속하지

import Foundation

let n = Int(readLine()!)!
let regex = readLine()!.components(separatedBy: "*")

let front = regex[0]
let rear = String(regex[1].reversed())

let fLen = front.count
let rLen = rear.count

for _ in 0..<n {
    let file = Array(readLine()!).map {String($0)}
    
    if file.count >= fLen + rLen,
       file[0..<fLen].joined(separator: "") == front,
       file.reversed()[0..<rLen].joined(separator: "") == rear
    {
        print("DA")
    } else {
        print("NE")
    }
}
