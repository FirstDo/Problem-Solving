func solution(_ n:Int) -> Int {
  var arr = [Int]()
  var dev = n
  var result = 0
  var three = 1

  if dev < 3 {
    return n
  }

  while dev >= 3 {
    arr.append(dev % 3)
    dev /= 3
  }

  arr.append(dev % 3)
  
  print(arr)
  
  arr.reverse()
  arr.forEach { value in
    if value == 0 {
      result += 0
    } else {
      result += value * three
    }

    three *= 3
  }
    return result
}