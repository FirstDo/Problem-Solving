let N = Int(readLine()!)!
var arr: [Int] = []
var swap: Int = 0

arr = readLine()!.split(separator: " ").map{Int(String($0))!}


func mergeSort(_ s: Int, _ e: Int) {
    
    if e-s <= 1 {
        return
    }

    let mid = (s+e)/2

    //divide
    mergeSort(s,mid)
    mergeSort(mid,e)

    var newArr: [Int] = []
    var (idx1,idx2) = (s,mid)
    var cnt = 0

    //merge
    while idx1 < mid && idx2 < e {
        if arr[idx1] > arr[idx2] {
            newArr.append(arr[idx2])
            idx2 += 1
            cnt += 1
        } else {
            newArr.append(arr[idx1])
            idx1 += 1
            swap += cnt
        }
    }

    while idx1 < mid {
        newArr.append(arr[idx1])
        idx1 += 1
        swap += cnt
    }

    while idx2 < mid {
        newArr.append(arr[idx2])
        idx2 += 1
    }

    for t in 0..<newArr.count {
        arr[s + t] = newArr[t]
    }
}


mergeSort(0,N)
print(swap)