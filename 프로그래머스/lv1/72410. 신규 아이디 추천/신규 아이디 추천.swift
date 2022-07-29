// 신규 아이디 추천

import Foundation

private func level1(_ id: String) -> String {
    return id.lowercased()
}

private func level2(_ id: String) -> String {
    return id.filter { ch in
        ch.isLetter || ch.isNumber || ch == "-" || ch == "_" || ch == "."
    }
}

private func level3(_ id: String) -> String {
    var temp = id
    
    while temp.contains("..") {
        temp = temp.replacingOccurrences(of: "..", with: ".")
    }
    
    return temp
}

private func level4(_ id: String) -> String {
    var temp = id
    
    if temp.first == "." {
        temp.removeFirst()
    }
    
    if temp.last == "." {
        temp.removeLast()
    }
    
    return temp
}

private func level5(_ id: String) -> String {
    if id.isEmpty {
        return "a"
    } else {
        return id
    }
}

private func level6(_ id: String) -> String {
    let len = id.count
    
    if len >= 16 {
        var temp = String(id.dropLast(len-15))
        if temp.last == "." {
            temp.removeLast()
        }
        
        return temp
    } else {
        return id
    }
}

private func level7(_ id: String) -> String {
    let len = id.count
    
    if len <= 2 {
        return id + String(repeating: id.last!, count: 3-len)
    } else {
        return id
    }
}

func solution(_ new_id:String) -> String {
    let id1 = level1(new_id)
    let id2 = level2(id1)
    let id3 = level3(id2)
    let id4 = level4(id3)
    let id5 = level5(id4)
    let id6 = level6(id5)
    let id7 = level7(id6)
    
    return id7
}
