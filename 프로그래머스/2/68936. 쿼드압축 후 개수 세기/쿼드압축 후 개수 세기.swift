import Foundation

var oneCnt = 0
var zeroCnt = 0

func quadZip(arr: inout [[Int]], si: Int, sj: Int, ei: Int, ej: Int) {
  let targetNum = arr[si][sj]
  var isSame = true

  for i in si..<ei {
    for j in sj..<ej {
      if arr[i][j] != targetNum {
        isSame = false
      }
    }
  }
  
  // S 내부의 모든 수가 같은 값이라면, 해당 수 하나로 압축하기
  if isSame {
    for i in si..<ei {
      for j in sj..<ej {
        arr[i][j] = targetNum
      }
    }
    
    if targetNum == 0 {
      zeroCnt += 1
    } else {
      oneCnt += 1
    }
  }
  // 아니라면 4개로 나누기
  else {
    let mi = (si + ei) / 2
    let mj = (sj + ej) / 2
    
    quadZip(arr: &arr, si: si, sj: sj, ei: mi, ej: mj)
    quadZip(arr: &arr, si: si, sj: mj, ei: mi, ej: ej)
    quadZip(arr: &arr, si: mi, sj: sj, ei: ei, ej: mj)
    quadZip(arr: &arr, si: mi, sj: mj, ei: ei, ej: ej)
  }
}

func solution(_ arr:[[Int]]) -> [Int] {
  let n = arr.count
  var arr = arr
  quadZip(arr: &arr, si: 0, sj: 0, ei: n, ej: n)
  
  return [zeroCnt, oneCnt]
}