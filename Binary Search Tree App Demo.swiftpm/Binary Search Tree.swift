//
//  Binary Search Tree.swift
//  Binary Search Tree App Demo
//
//  Created by Bruno De Vivo on 27/03/23.
//

class TreeNode<T: Comparable> {
    var value: T
    var leftChild: TreeNode?
    var rightChild: TreeNode?
    
    init(value: T) {
        self.value = value
    }
}

class BinarySearchTree<T: Comparable> {
    var root: TreeNode<T>?
    
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
