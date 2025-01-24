import Foundation

func solution() {
  let n = Int(readLine()!)!
  let size = readLine()!.split(separator: " ").map {Int($0)!}
  let tp = readLine()!.split(separator: " ").map {Int($0)!}
  let (t, p) = (tp[0], tp[1]) // t: 티셔츠의 묶음, p: 펜의 묶음
  
  print(size.map { $0 % t == 0 ? $0/t : $0/t + 1 }.reduce(0, +))
  print(n/p, n%p)
}

solution()
