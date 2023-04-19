
import Foundation

var dicts = [String: Int]()
var visit = Array(repeating: false, count: 20)

func combinations(order: [String], setMenu: String, index: Int, depth: Int, len: Int) {
    if depth >= len { return }
    
    for i in index..<len {
        if visit[i] == false {
            visit[i] = true
            
            let newMenu = setMenu + order[i]
            if dicts[newMenu] == nil { dicts[newMenu] = 0 }
            dicts[newMenu]! += 1
            
            combinations(order: order, setMenu: newMenu, index: i, depth: depth + 1, len: len)
            visit[i] = false
        }
    }
}

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    for order in orders {
        combinations(order: order.map {String($0)}.sorted(), setMenu: "", index: 0, depth: 0, len: order.count)
        visit = Array(repeating: false, count: 20)
    }
    
    var answers = [String]()
    
    dicts = dicts.filter { $0.value >= 2 }
    
    for count in course {
        let targetDicts = dicts.filter { $0.key.count == count }
        let maxValue = targetDicts.values.max()
        answers += targetDicts.filter { $0.value == maxValue }.map { $0.key }
    }
    
    return answers.sorted()
}