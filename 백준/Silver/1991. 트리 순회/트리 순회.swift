import Foundation


func preOrder(cur: String, _ tree: [String: (left: String, right: String)]) {
  if cur == "." { return }
  
  print(cur, terminator: "")
  preOrder(cur: tree[cur]!.left, tree)
  preOrder(cur: tree[cur]!.right, tree)
}

func inOrder(cur: String, _ tree: [String: (left: String, right: String)]) {
  if cur == "." { return }
  
  
  inOrder(cur: tree[cur]!.left, tree)
  print(cur, terminator: "")
  inOrder(cur: tree[cur]!.right, tree)
}

func postOrder(cur: String, _ tree: [String: (left: String, right: String)]) {
  if cur == "." { return }
  
  postOrder(cur: tree[cur]!.left, tree)
  postOrder(cur: tree[cur]!.right, tree)
  print(cur, terminator: "")
}

func solution() {
  let n = Int(readLine()!)!
  var tree = [String: (left: String, right: String)]()
  
  for _ in 0..<n {
    let t = readLine()!.split(separator: " ").map {String($0)}
    tree[t[0]] = (t[1], t[2])
  }
  
  preOrder(cur: "A", tree)
  print()
  inOrder(cur: "A", tree)
  print()
  postOrder(cur: "A", tree)
}

solution()
