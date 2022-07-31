import Foundation

func balancedString(_ str: String) -> (String, String) {
    let str = Array(str).map { String($0) }
    
    var u = ""
    var v = ""
    
    var cnt = 0
    
    for (index, value) in str.enumerated() {
        u.append(value)
        
        if value == "(" { cnt += 1 }
        else { cnt -= 1 }
        
        if cnt == 0 {
            if index + 1 < str.count  {
                v = str[(index+1)...].joined()
            }
            break
        }
    }
    
    return (u, v)
}

func isCorrectString(_ str: String) -> Bool {
    var stack = [Character]()
    
    for ch in str {
        if ch == "(" {
            stack.append(ch)
        } else {
            guard stack.popLast() != nil else { return false }
        }
    }
    
    return stack.isEmpty
}

func solve(_ str: String) -> String {
    if str.isEmpty { return str }
    
    var (u, v) = balancedString(str)
    
    if isCorrectString(u) {
        return u + solve(v)
    } else {
        var res = "(" + solve(v) + ")"
        
        _ = u.removeFirst()
        _ = u.removeLast()
        
        for ch in u {
            if ch == "(" {
                res.append(")")
            } else {
                res.append("(")
            }
        }
        
        return res
    }
    
}

func solution(_ p:String) -> String {
    if isCorrectString(p) { return p }
    return solve(p)
}