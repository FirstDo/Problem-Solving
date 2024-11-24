import Foundation

func canLearn(prevSkill: [Character: Character], skillTree: String) -> Bool {
  var learnedSkill = Set<Character>() // 이미 배운스킬
  
  for skill in skillTree {
    // 선행 스킬이 없다면 현재스킬 배우기
    if prevSkill[skill] == nil {
      learnedSkill.insert(skill)
      continue
    }
    
    // 선행 스킬이 있지만, 이미 배웠을경우 현재 스킬 배우킬
    if let prev = prevSkill[skill], learnedSkill.contains(prev) {
      learnedSkill.insert(skill)
      continue
    }
    
    // 선행스킬 있고, 해당 스킬을 배우지 않았다면, 스킬을 배울수 없음
    return false
  }
  
  return true
}

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
  
  // 선행 스킬 정보 저장
  let skill = Array(skill)
  var prevSkill = [Character: Character]()
  for i in 0..<skill.count - 1 {
    prevSkill[skill[i+1]] = skill[i]
  }
  
  let ans = skill_trees
    .filter { canLearn(prevSkill: prevSkill, skillTree: $0) }
    .count
  
  return ans
}