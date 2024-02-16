import Foundation

var trees = [String: (l: String, r: String)]()

let n = Int(readLine()!)!

for _ in 0..<n {
  let t = readLine()!.split(separator: " ").map {String($0)}
  let (c, l, r) = (t[0], t[1], t[2])
  
  trees[c] = (l, r)
}

func preorder(_ node: String) {
  print(node, terminator: "")
  if trees[node]!.l != "." {
    preorder(trees[node]!.l)
  }
  
  if trees[node]!.r != "." {
    preorder(trees[node]!.r)
  }
}

func inorder(_ node: String) {
  if trees[node]!.l != "." {
    inorder(trees[node]!.l)
  }
  
  print(node, terminator: "")
  
  if trees[node]!.r != "." {
    inorder(trees[node]!.r)
  }
}

func postOrder(_ node: String) {
  if trees[node]!.l != "." {
    postOrder(trees[node]!.l)
  }
  
  if trees[node]!.r != "." {
    postOrder(trees[node]!.r)
  }
  
  print(node, terminator: "")
}

preorder("A")
print()
inorder("A")
print()
postOrder("A")