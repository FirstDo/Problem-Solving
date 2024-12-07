func solution() -> Int {
  let (sp) = readLine()!.split(separator: " ").map {Int($0)!}
  let (s, p) = (sp[0], sp[1])
  
  let str = readLine()!.map { String($0) }
  let acgt = readLine()!.split(separator: " ")
    .map { Int($0)! }
  
  let dicts = ["A": acgt[0], "C": acgt[1], "G": acgt[2], "T": acgt[3]]
  var currentDicts: [String: Int] = ["A": 0, "C": 0, "G": 0, "T": 0]
  
  var cnt = 0
  
  for i in 0..<s where i + p - 1 < s {
    let j = i + p - 1
    
    if i == 0 {
      for index in i...j {
        currentDicts[str[index]]! += 1
      }
    } else {
      currentDicts[str[i-1]]! -= 1
      currentDicts[str[j]]! += 1
    }
    
    if dicts["A"]! <= currentDicts["A"]!,
       dicts["C"]! <= currentDicts["C"]!,
       dicts["T"]! <= currentDicts["T"]!,
       dicts["G"]! <= currentDicts["G"]! {
      cnt += 1
    }  
  }
  
  return cnt
}

let result = solution()
print(result)
