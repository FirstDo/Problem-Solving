func solution() -> Int {
  var queue = Array(1...Int(readLine()!)!)
  var index = 0
  
  if queue.count == 1 { return 1 }
  
  while true {
    index += 1
    
    let card = queue[index]
    queue.append(card)
    index += 1
    
    if queue.count == index + 1 {
      break
    }
  }
  
  return queue[index]
}

let result = solution()
print(result)
