import Foundation

// 전역변수
var answer = 0
var visit = [Bool]()

func dfs(dungeons: [[Int]], currentK: Int, numberOfDungeon: Int) {
  answer = max(answer, numberOfDungeon) 
  
  let len = dungeons.count
  
  for i in 0..<len {
    // 방문하지 않았고, 최소 필요 피로도보다 현재 피로도가 높은경우
    if visit[i] == false, currentK >= dungeons[i][0] {
      visit[i] = true
      dfs(dungeons: dungeons, currentK: currentK - dungeons[i][1], numberOfDungeon: numberOfDungeon + 1)
      visit[i] = false
    }
  }
  
}

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
  visit = Array(repeating: false, count: dungeons.count)
  dfs(dungeons: dungeons, currentK: k, numberOfDungeon: 0)
  return answer
}
