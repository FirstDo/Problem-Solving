import Foundation

func solution(_ s:String) -> Bool {
    var stack = [Character]()
    
    for ch in s {
        if ch == "(" {
            stack.append(ch)
        } else {
            if stack.isEmpty { return false }
            _ = stack.removeLast()
        }
    }

    return stack.isEmpty
}
