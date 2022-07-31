import Foundation

var candidateKeys = [Set<Int>]()

func isCandidate(_ temp: [Int], relation: [[String]]) -> Bool {
    var dict = Set<String>()
    
    for row in relation {
        let key = temp.reduce("") { return $0 + row[$1] }
        dict.insert(key)
    }
    
    return dict.count == relation.count
}

func combination(_ k: Int, _ relation: [[String]]) {
    let len = relation[0].count
    
    func combi(_ index: Int, _ depth: Int, _ temp: [Int]) {
        if depth == k {
            // 유일성을 확인
            if isCandidate(temp, relation: relation) {
                // 최소성을 확인
                for key in candidateKeys {
                    if key.isSubset(of: temp) { return }
                }
                candidateKeys.append(Set(temp))
            }
            
            return
        }
        
        for i in index..<len {
            combi(i + 1, depth + 1, temp + [i])
        }
    }
    
    combi(0, 0, [])
}

func solution(_ relation:[[String]]) -> Int {
    let len = relation[0].count
    
    for i in 1...len {
        combination(i, relation)
    }
    
    return candidateKeys.count
}