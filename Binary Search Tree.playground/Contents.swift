class TreeNode<T: Comparable> {
    var value: T
    var leftChild: TreeNode?
    var rightChild: TreeNode?
    
    init(value: T) {
        self.value = value
    }
}

class BinarySearchTree<T: Comparable> {
    private var root: TreeNode<T>?
    
    func insert(_ value: T) {
        root = insertNode(root, withValue: value)
    }
    
    private func insertNode(_ node: TreeNode<T>?, withValue value: T) -> TreeNode<T> {
        guard let currentNode = node else {
            return TreeNode(value: value)
        }
        
        if value < currentNode.value {
            currentNode.leftChild = insertNode(currentNode.leftChild, withValue: value)
        } else {
            currentNode.rightChild = insertNode(currentNode.rightChild, withValue: value)
        }
        
        return currentNode
    }
    
    func search(_ value: T) -> Bool {
        return searchNode(root, forValue: value)
    }
    
    private func searchNode(_ node: TreeNode<T>?, forValue value: T) -> Bool {
        guard let currentNode = node else {
            return false
        }
        
        if value == currentNode.value {
            return true
        } else if value < currentNode.value {
            return searchNode(currentNode.leftChild, forValue: value)
        } else {
            return searchNode(currentNode.rightChild, forValue: value)
        }
    }
}

// Example usage
let bst = BinarySearchTree<Int>()
bst.insert(5)
bst.insert(3)
bst.insert(7)
bst.insert(2)
bst.insert(4)
bst.insert(6)
bst.insert(8)

print(bst.search(42)) // Output: true
print(bst.search(12)) // Output: false

