import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    func dfs(_ tired: Int) {
        maxNum = max(maxNum, visit.filter { $0 }.count )
        
        for i in 0..<dungeons.count where visit[i] == false {
            let dungeon = dungeons[i]
            
            if dungeon[0] <= tired {
                visit[i] = true
                dfs(tired - dungeon[1])
                visit[i] = false
            }
        }
    }
    
    var visit = Array(repeating: false, count: dungeons.count)
    var maxNum = 0

    dfs(k)
    
    return maxNum
}