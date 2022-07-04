// 14425번 문자열 집합

import Foundation

final class Node<Item: Hashable> {
    var item: Item?
    weak var parent: Node?
    var children: [Item: Node] = [:]
    var isTerminating = false
    
    init(item: Item?, parent: Node?) {
        self.item = item
        self.parent = parent
    }
}

final class Trie<CollectionType: Collection> where CollectionType.Element: Hashable {
    typealias TrieNode = Node<CollectionType.Element>
    private let root = TrieNode(item: nil, parent: nil)
    init() {}
    
    func insert(_ collection: CollectionType) {
        var current = root
        
        for element in collection {
            if current.children[element] == nil {
                current.children[element] = Node(item: element, parent: current)
            }
            current = current.children[element]!
        }
        current.isTerminating = true
    }
    
    func contains(_ collection: CollectionType) -> Bool {
        var current = root
        
        for element in collection {
            guard let child = current.children[element] else { return false }
            current = child
        }
        
        return current.isTerminating
    }
    
    func remove(_ collection: CollectionType) {
        var current = root
        
        for element in collection {
            guard let child = current.children[element] else { return }
            current = child
        }
        
        guard current.isTerminating else { return }
        current.isTerminating = false
        
        while current.children.isEmpty && !current.isTerminating {
            current.parent!.children[current.item!] = nil
            current = current.parent!
        }
    }
}

let t = readLine()!.components(separatedBy: " ").map{Int($0)!}
let (n, m) = (t[0], t[1])
var answer = 0

let words = Set((0..<n).map{ _ in readLine()! })
let querysCount = (0..<m).map{ _ in readLine()! }.filter { words.contains($0) }.count

print(querysCount)