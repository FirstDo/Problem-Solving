import Foundation

func solution(_ record:[String]) -> [String] {
  
  var result = [(type: String, uid: String)]()
  var nameDB = [String: String]()
  
  for line in record {
    let t = line.components(separatedBy: " ")
    
    switch t[0].lowercased() {
    case "enter":
      result.append(("enter", t[1]))
      nameDB[t[1]] = t[2]
    case "leave":
      result.append(("leave", t[1]))
    case "change":
      nameDB[t[1]] = t[2]
    default:
      fatalError()
    }
  }
  
  return result.map { (type, uid) in
    return nameDB[uid]! + "님이 " + (type == "enter" ? "들어왔습니다." : "나갔습니다.")
  }
}

