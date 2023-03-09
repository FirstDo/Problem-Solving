
import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    let skill = Array(skill)
    var beforeLearn = [Character: Character]()
    
    for (index, value) in skill.enumerated() {
        beforeLearn[value] = index == 0 ? "-" : skill[index-1]
    }
    
    return skill_trees.reduce(0) { partialResult, skillTree in
        let value = canLearnSkillTree(skillTree, beforeLearn) ? 1 : 0
        return partialResult + value
    }
}

func canLearnSkillTree(_ tree: String, _ beforeLearn: [Character: Character]) -> Bool {
    var learn = Set<Character>()
    learn.insert("-")
    
    for target in tree {
        let previous = beforeLearn[target] ?? "-"
        
        if learn.contains(previous) {
            learn.insert(target)
        } else {
            return false
        }
    }
    
    return true
}