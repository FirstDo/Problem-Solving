import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    let defaultTime = fees[0]
    let defaultFee = fees[1]
    let unitTime = fees[2]
    let unitFee = fees[3]
    
    var dict = [Int: [Int]]()
    
    for record in records {
        let t = record.components(separatedBy: " ")
        
        let time = t[0].components(separatedBy: ":").map{ Int($0)! }
        let minute = time[0] * 60 + time[1]
        let number = Int(t[1])!
        
        if dict[number] == nil { dict[number] = [] }
        
        dict[number]!.append(minute)
    }
    
    var result = [Int]()
    
    for (_, value) in dict.sorted(by: {$0.key < $1.key}) {
        let value = value.count % 2 == 0 ? value : value + [23 * 60 + 59]
        var cost = 0
        
        var resultTime = 0
        
        for i in stride(from: 0, to: value.count, by: 2) {
            resultTime += value[i+1] - value[i]
        }
        
        // 기본 시간 / 요금 구하기
        
        resultTime -= defaultTime
        cost += defaultFee
        
        if resultTime > 0 {
            let cnt = Int(ceil(Double(resultTime) / Double(unitTime)))
            cost += cnt * unitFee
        }
        
        result.append(cost)
    }
    
    return result
}