import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dicts = [String: Int]()
    
    for c in clothes {
        if dicts[c[1]] == nil {
            dicts[c[1]] = 0
        }
        
        dicts[c[1]]! += 1
    }
    
    return dicts.values.reduce(1) { partialResult, value in
        partialResult * (value + 1)
    } - 1
}