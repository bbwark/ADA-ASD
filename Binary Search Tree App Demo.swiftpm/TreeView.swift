//
//  TreeView.swift
//  Binary Search Tree Demo
//
//  Created by Bruno De Vivo on 28/03/23.
//

import SwiftUI

struct TreeView: View {
    
    var bst : BinarySearchTree<Int>
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false){
                drawNode(bst.root, geometry: geometry, x: geometry.size.width / 2, y: 0)
                    .offset(y: 40)
            }
        }
    }
    
    
    func drawNode(_ node: TreeNode<Int>?, geometry: GeometryProxy, x: CGFloat, y: CGFloat, depth: Int = 0) -> some View {
        
        if let currentNode = node {
            let xOffset = geometry.size.width / pow(2, CGFloat(depth + 2))
            let yOffset: CGFloat = 40
            
            
            return AnyView(ZStack {
                
                if let leftNode = currentNode.leftChild{
                    Path { path in
                        path.move(to: CGPoint(x: x, y: y))
                        path.addLine(to: CGPoint(x: x - xOffset, y: y + yOffset))
                    }
                    .stroke(Color.accentColor, lineWidth: 1)
                    drawNode(leftNode, geometry: geometry, x: x - xOffset, y: y + yOffset, depth: depth + 1)
                }
                if let rightNode = currentNode.rightChild{
                    Path { path in
                        path.move(to: CGPoint(x: x, y: y))
                        path.addLine(to: CGPoint(x: x + xOffset, y: y + yOffset))
                    }
                    .stroke(Color.accentColor, lineWidth: 1)
                    drawNode(rightNode, geometry: geometry, x: x + xOffset, y: y + yOffset, depth: depth + 1)
                }
                
                ZStack{
                    Circle()
                        .foregroundColor(.accentColor)
                    Text("\(currentNode.value)")
                        .foregroundColor(.white)
                }
                .frame(width: 30, height: 30)
                .position(x: x, y: y)
            })
        }
        else
        {
            return AnyView(EmptyView())
        }
    }
}


struct TreeView_Previews: PreviewProvider {
    static var previews: some View {
        let tree = BinarySearchTree<Int>()
        let numbers : [Int] = [89, 44, 54, 33, 54, 67, 89, 32, 33, 56, 57, 32, 67, 43, 102, 122, 104, 154, 90, 87]
        numbers.forEach { i in
            tree.insert(i)
        }
        
        return TreeView(bst: tree)
    }
}

struct TreeView2: View {
    
    var bst : BinarySearchTree<Int>
    
    var body: some View {
            ScrollView(showsIndicators: false){
                drawNode(bst.root)
            }
    }
    
    
    func drawNode(_ node: TreeNode<Int>?) -> some View {
        
        if let currentNode = node {
            return AnyView(VStack {
                ZStack{
                    Circle()
                        .foregroundColor(.accentColor)
                    Text("\(currentNode.value)")
                        .foregroundColor(.white)
                }
                .frame(width: 30, height: 30)
                
                HStack(spacing: 12){
                    if let leftNode = currentNode.leftChild{
                        drawNode(leftNode)
                        //TODO: Line which connect LeftNode with CurrentNode
                        //Difficulty: it has to be done dynamically using Stacks, otherwise the circles would be get out of the bounds of the screen or will overlap each other
                    }
                    if let rightNode = currentNode.rightChild{
                        drawNode(rightNode)
                        //TODO: Line which connect RightNode with CurrentNode
                        //Difficulty: it has to be done dynamically using Stacks, otherwise the circles would be get out of the bounds of the screen or will overlap each other
                    }
                }
            })
        }
        else
        {
            return AnyView(EmptyView())
        }
    }
}
