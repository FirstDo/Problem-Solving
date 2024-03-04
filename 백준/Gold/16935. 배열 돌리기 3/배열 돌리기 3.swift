import Foundation

let l = readLine()!.split(separator: " ").map {Int($0)!}
var (n, m, r) = (l[0], l[1], l[2])

var arr = (0..<n).map { _ in readLine()!.split(separator: " ").map {Int($0)! }}

let cmds = readLine()!.split(separator: " ").map {Int($0)!}

for cmd in cmds {
  switch cmd {
  case 1:
    cmd_1()
  case 2:
    cmd_2()
  case 3:
    cmd_3()
  case 4:
    cmd_4()
  case 5:
    cmd_5()
  case 6:
    cmd_6()
  default:
    fatalError()
  }
}

func cmd_1() {
  let temp = arr
  for i in 0..<n {
    arr[i] = temp[n-1-i]
  }
}

func cmd_2() {
  for i in 0..<n {
    arr[i].reverse()
  }
}

func cmd_3() {
  (n, m) = (m, n)
  
  var result = Array(repeating: Array(repeating: 0, count: m), count: n)
  
  for i in 0..<n {
    for j in 0..<m {
      result[i][j] = arr[m-1-j][i]
    }
  }
  
  arr = result
}

func cmd_4() {
  (n, m) = (m, n)
  
  var result = Array(repeating: Array(repeating: 0, count: m), count: n)
  
  for i in 0..<n {
    for j in 0..<m {
      result[i][j] = arr[j][n-1-i]
    }
  }
  
  arr = result
}

func cmd_5() {
  
  let temp = arr
  
  for i in 0..<n/2 {
    for j in 0..<m/2 {
      // 1->2
      arr[i][j+m/2] = temp[i][j]

      // 2->3
      arr[i+n/2][j+m/2] = temp[i][j+m/2]
      
      // 3->4
      arr[i+n/2][j] = temp[i+n/2][j+m/2]
      
      // 4->1
      arr[i][j] = temp[i+n/2][j]
    }
  }
}

func cmd_6() {
  let temp = arr
  
  for i in 0..<n/2 {
    for j in 0..<m/2 {
      // 1<-2
      arr[i][j] = temp[i][j+m/2]

      // 2<-3
      arr[i][j+m/2] = temp[i+n/2][j+m/2]
      
      // 3<-4
      arr[i+n/2][j+m/2] = temp[i+n/2][j]
      
      // 4<-1
      arr[i+n/2][j] = temp[i][j]
    }
  }
}

for line in arr {
  print(line.map {String($0)}.joined(separator: " "))
}
