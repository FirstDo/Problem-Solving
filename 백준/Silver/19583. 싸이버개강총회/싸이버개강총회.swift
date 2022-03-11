import Foundation
//19583번 개강총회

func convertToMinute(str: String) -> Int {
    let t = str.split(separator: ":").map{Int(String($0))!}
    return t[0] * 60 + t[1]
}

let t = readLine()!.split(separator: " ").map{convertToMinute(str: String($0))}
let (S,E,Q) = (t[0],t[1],t[2])

var attendList: [String: Int] = [:]

var enterSet: Set<String> = []
var leaveSet: Set<String> = []

while let input = readLine()?.split(separator: " ").map({String($0)}) {
    let timeStamp = convertToMinute(str: input[0])
    let name = input[1]
    
    if (0...S).contains(timeStamp) {
        enterSet.insert(name)
    } else if (E...Q).contains(timeStamp) {
        leaveSet.insert(name)
    }
}

print(enterSet.intersection(leaveSet).count)


