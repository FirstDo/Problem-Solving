import Foundation

var dict = [String: [Int]]()

func resetDict() {
    // 딕셔너리 초기화
    for lang in ["cpp", "java", "python", "-"] {
        for job in ["backend", "frontend", "-"] {
            for career in ["junior", "senior", "-"] {
                for food in ["chicken", "pizza", "-"] {
                    dict[lang + job + career + food] = []
                }
            }
        }
    }
}

func saveDict(_ info: [String]) {
    for t in info {
        let t = t.components(separatedBy: " ")
        for lang in [t[0], "-"] {
            for job in [t[1], "-"] {
                for career in [t[2], "-"] {
                    for food in [t[3], "-"] {
                        dict[lang + job + career + food]!.append(Int(t[4])!)
                    }
                }
            }
        }
    }
}

func lowerBound(_ arr: [Int], _ target: Int) -> Int {
    var start = 0
    var end = arr.count
    
    while start < end {
        let mid = (start + end)/2
        
        if arr[mid] < target {
            start = mid + 1
        } else {
            end = mid
        }
    }
    
    return end
}

func solution(_ info:[String], _ query:[String]) -> [Int] {
    resetDict()
    saveDict(info)

    for (key, value) in dict {
        dict[key] = value.sorted()
    }
    
    var result = [Int]()
    
    for q in query {
        var q = q.components(separatedBy: " ").filter { $0 != "and" }
        
        let target = Int(q.removeLast())!
        let arr = dict[q.joined()]!
        
        let index = lowerBound(arr, target)
        result.append(arr.count - index)
    }
    
    return result
}