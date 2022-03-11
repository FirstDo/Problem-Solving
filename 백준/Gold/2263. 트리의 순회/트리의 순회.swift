let N = Int(readLine()!)!
var inOrder = readLine()!.split(separator: " ").map{Int(String($0))!}
var postOrder = readLine()!.split(separator: " ").map{Int(String($0))!}


var idx = [Int](repeating: 0, count: N+1)
for i in 0..<N {
    idx[inOrder[i]] = i
}

func preOrder(_ inL: Int, _ inR: Int, _ postL: Int, _ postR: Int) {

    if inL > inR || postL > postR {
        return
    }

    let parent = postOrder[postR]
    print(parent, terminator: " ")

    let S_idx = idx[parent]
    let left = S_idx - inL

    preOrder(inL, S_idx - 1, postL, (postL + left) - 1)
    preOrder(S_idx + 1, inR, postL + left, postR - 1)
}




preOrder(0,N-1,0,N-1)
