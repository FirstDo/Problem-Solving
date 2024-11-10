import Foundation

private extension Character {
  var asciiCode: Int {
    Int(asciiValue!)
  }
}

func solution(_ name:String) -> Int {
  
  let len = name.count
  let target = Array(name)

  let upDownCnt = target.reduce(0) {
    let up = Character("Z").asciiCode - $1.asciiCode + 1
    let down = $1.asciiCode - Character("A").asciiCode
    return $0 + min(up, down)
  }
  
  var leftRightCnt = len - 1
  
  for i in 0..<len {
    var j = i+1
    
    // A가 아닌 지점을 찾는다
    while j < target.count, target[j] == "A" {
      j += 1
    }
    // case1:
    leftRightCnt = min(leftRightCnt, (i * 2 + len - j), ((len - j) * 2 + i))
  }
  
  return upDownCnt + leftRightCnt
}
