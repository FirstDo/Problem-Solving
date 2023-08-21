import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var charts = [String: Int]()
    
    clothes.map { $0[1] }
        .forEach { type in
            if charts[type] == nil { charts[type] = 0 }
            charts[type]! += 1
        }
    
    let result = charts.values.reduce(1) { partialResult, value in
        partialResult * (value + 1)
    }
    
    return result - 1
}