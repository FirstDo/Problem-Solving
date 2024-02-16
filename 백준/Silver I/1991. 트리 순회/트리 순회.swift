import Foundation
//1991번 트리순회
let n = Int(readLine()!)!
var tree = Array(repeating: (-1,-1), count: n)
let const = 65

for _ in 0..<n {
	let t = readLine()!.split(separator: " ").map{Character(String($0))}
	let (p,l,r) = (t[0],t[1],t[2])
	
	let parent = Int(p.asciiValue!) - const
	if l != "." {
		let leftChild = Int(l.asciiValue!) - const
		tree[parent].0 = leftChild
	}

	if r != "." {
		let rightChild = Int(r.asciiValue!) - const
		tree[parent].1 = rightChild
	}
}

var number = [Int]()

func inorder(_ x: Int) {
	if x == -1 {
		return
	}
	inorder(tree[x].0)
	number.append(x)
	inorder(tree[x].1)
}
func preorder(_ x: Int) {
	if x == -1 {
		return
	}
	number.append(x)
	preorder(tree[x].0)
	preorder(tree[x].1)
}
func postorder(_ x: Int) {
	if x == -1 {
		return
	}
	postorder(tree[x].0)
	postorder(tree[x].1)
	number.append(x)
}


preorder(0)
inorder(0)
postorder(0)

print(number[0..<n].map{String(UnicodeScalar($0+const)!)}.joined())
print(number[n..<n*2].map{String(UnicodeScalar($0+const)!)}.joined())
print(number[n*2..<n*3].map{String(UnicodeScalar($0+const)!)}.joined())