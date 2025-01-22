import Foundation

func solution() -> Int {
  // 사람수 n, 파티수 m
  let nm = readLine()!.split(separator: " ").map {Int($0)!}
  let (n, m) = (nm[0], nm[1])

  // 진실아는사람들
  var truePeople = Set<Int>()
  truePeople.formUnion(readLine()!.split(separator: " ").map {Int($0)!}[1...])
  // 진실아는 파티
  var trueParty = Set<Int>()
  
  let parties = (0..<m).map { _ in
    Array(readLine()!.split(separator: " ").map {Int($0)!}[1...])
  }
  
  for _ in 0..<m {
    for i in 0..<m {
      let temp = Set(parties[i])
      
      if truePeople.intersection(temp).isEmpty == false {
        truePeople.formUnion(temp)
        trueParty.insert(i)
      }
    }
  }
  
  return m - trueParty.count
}

print(solution())
