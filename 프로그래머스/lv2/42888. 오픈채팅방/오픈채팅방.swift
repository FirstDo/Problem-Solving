import Foundation

func solution(_ record:[String]) -> [String] {
    var userNameDict = [String: String]()
    var result = [(uuid: String, state: String)]()
    
    for r in record {
        let r = r.components(separatedBy: " ")
        
        let state = r[0]
        let uuid = r[1]
        let name = r[safe: 2] ?? ""
        
        switch state {
        case "Enter":
            userNameDict[uuid] = name
            result.append((uuid, "들어왔습니다."))
        case "Leave":
            result.append((uuid, "나갔습니다."))
        case "Change":
            userNameDict[uuid] = name
        default:
            break
        }
    }
    
    return result.map { (uuid, state) in
        userNameDict[uuid]! + "님이 " + state
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}