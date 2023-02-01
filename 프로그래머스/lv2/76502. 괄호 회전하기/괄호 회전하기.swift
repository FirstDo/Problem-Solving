import Foundation

func solution(_ s:String) -> Int {
    var s = s
    var result = 0
    
    for _ in 0..<s.count {
        if isRightBracket(str: s) {
            result += 1
        }
        
        let target = s.removeFirst()
        s.append(target)
    }

    return result
}


func isRightBracket(str: String) -> Bool {
    var stack = [Character]()
    
    for ch in str {
        if ch == "(" || ch == "[" || ch == "{" {
            stack.append(ch)
        } else {
            if stack.isEmpty { return false }
            
            switch (stack.last!, ch) {
            case ("(", ")"):
                _ = stack.removeLast()
            case ("[", "]"):
                _ = stack.removeLast()
            case ("{", "}"):
                _ = stack.removeLast()
            default:
                return false
            }
        }
    }
    
    return stack.isEmpty
}
