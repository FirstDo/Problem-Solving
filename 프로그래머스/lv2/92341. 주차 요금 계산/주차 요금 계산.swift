import Foundation

struct CarInfo {
    let time: Int
    let id: Int
    let state: State
    
    enum State: String {
        case `in` = "IN"
        case out = "OUT"
    }
    
    static func convert(records: [String]) -> [Self] {
        return records.map { record in
            let str = record.components(separatedBy: " ")
            
            let temp = str[0].components(separatedBy: ":").map { Int($0)! }
            let time = temp[0] * 60 + temp[1]
            
            let id = Int(str[1])!
            let state = State(rawValue: str[2])!
            
            return CarInfo(time: time, id: id, state: state)
        }
    }
}

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    let (basicTime, basicFee, unitTime, unitFee) = (fees[0], fees[1], fees[2], fees[3])
    let records = CarInfo.convert(records: records)
    
    var calcDict = [Int: Int]()
    var totalInfo = [Int: Int]()
    
    records.forEach {
        totalInfo[$0.id] = 0
    }
    
    for record in records {
        // 주차장에 차가 이미 있으면 출차
        if let value = calcDict[record.id] {
            let usedTime = record.time - value
            totalInfo[record.id]! += usedTime
            
            calcDict[record.id] = nil
        }
        // 주차장에 차가 없으면 입차
        else {
            calcDict[record.id] = record.time
        }
    }
    
    // 주차장에 남아있는 차 모두 출차시키기
    calcDict.forEach { id, value in
        totalInfo[id]! += 23 * 60 + 59 - value
    }
    
    // 주차 요금 계산하기
    var result = [(id: Int, fee: Int)]()
    
    totalInfo.forEach { id, parkTime in
        // 누적주차 시간이 기본시간 이하라면, 기본요금 청구
        if parkTime <= basicTime {
            result.append((id, basicFee))
        }
        // 기본 요금 + 초과한 시간에 대해 단위시간 * 단위요금
        else {
            var (q, r) = (parkTime - basicTime).quotientAndRemainder(dividingBy: unitTime)
            if r != 0 { q += 1 }
            
            result.append((id, basicFee + q * unitFee))
        }
    }
    
    return result.sorted { $0.id < $1.id }.map { $0.fee }
}