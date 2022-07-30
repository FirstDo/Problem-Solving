import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportList = [String: Set<String>]()
    var mails = [String: Int]()
    
    id_list.forEach {
        reportList[$0] = Set<String>()
        mails[$0] = 0
    }

    for r in report {
        let r = r.components(separatedBy: " ")
        reportList[r[1]]!.insert(r[0])
    }
    
    for (_, value) in reportList where value.count >= k {
        value.forEach { mails[$0]! += 1 }
    }
    
    return id_list.map { id in
        mails[id]!
    }
}
