//
//  ShowTreeView.swift
//  Binary Search Tree Demo
//
//  Created by Bruno De Vivo on 28/03/23.
//

import SwiftUI

@available(iOS 16.1, *)
struct ShowTreeView: View {
    
    var model: ContentViewViewModel?
    
    var body: some View {
        VStack{
            Text("Binary Tree\nGraphic Representation")
                .foregroundColor(.accentColor)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            TreeView(bst: model!.bst)
        }
    }
}

@available(iOS 16.1, *)
struct ShowTreeView_Previews: PreviewProvider {
    static var previews: some View {
        let model = ContentViewViewModel()
        let bst = BinarySearchTree<Int>()
        let numbers : [Int] = [55, 43, 56, 84, 23, 53, 77]
        numbers.forEach { i in
            bst.insert(i)
        }
        model.bst = bst
        return ShowTreeView(model: model)
    }
}
