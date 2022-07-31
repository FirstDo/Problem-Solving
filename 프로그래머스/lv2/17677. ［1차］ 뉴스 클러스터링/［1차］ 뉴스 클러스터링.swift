import Foundation

func makeDict(_ str: String) -> [String: Int] {
    let str = Array(str)
    let len = str.count
    
    var result = [String: Int]()
    
    for i in 0..<len-1 where str[i].isLetter && str[i+1].isLetter {
        let key = String([str[i], str[i+1]]).lowercased()
        if result[key] == nil { result[key] = 0 }
        result[key]! += 1
    }
    
    return result
}

func solution(_ str1:String, _ str2:String) -> Int {
    let mux: Double = 65536
    
    let s1 = makeDict(str1)
    let s2 = makeDict(str2)
    
    let s1Key = Set(s1.keys.map { String($0) })
    let s2Key = Set(s2.keys.map { String($0) })
    
    let commonKey = s1Key.intersection(s2Key)
    let sumKey = s1Key.union(s2Key)
    
    let intersectionCount = commonKey.reduce(0) { partialResult, key in
        partialResult + min(s1[key]!, s2[key]!)
    }
    
    let unionCount = sumKey.reduce(0) { partialResult, key in
        partialResult + max(s1[key] ?? 0, s2[key] ?? 0)
    }
    
    if unionCount == 0 { return Int(mux) }
    return Int(Double(intersectionCount)/Double(unionCount) * mux)
}
