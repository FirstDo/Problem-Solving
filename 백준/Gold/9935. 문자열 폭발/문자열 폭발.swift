//9935번 문자열 폭발
let input = Array(readLine()!).map{String($0)}
let target = readLine()!
let targetLen = target.count

let lastCh = String(target.last!)
var stack = [String]()

for ch in input {
    stack.append(ch)
    
    if ch == lastCh {
        let len = stack.count
        if len >= targetLen && stack[(len-targetLen)...].joined() == target{
            (0..<targetLen).forEach{_ in
                stack.removeLast()
            }
        }
    }
}

let ans = stack.joined()
print(ans.isEmpty ? "FRULA" : ans)