//
//  InfoModalView.swift
//  Binary Search Tree Demo
//
//  Created by Bruno De Vivo on 27/03/23.
//

import SwiftUI

struct InfoModalView: View {
    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Binary Search Trees (BST)")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    
                    Text("Important Characteristics:")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("1. Ordered Structure: In a BST, all the nodes in the left subtree have values less than the parent node, and all nodes in the right subtree have values greater than the parent node.")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Text("2. Search Efficiency: Due to the ordered structure, searching in a BST takes O(h) time, where h is the height of the tree.")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Text("3. Insertion and Deletion: Insertion and deletion operations in a BST also take O(h) time.")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Text("4. Balanced vs. Unbalanced: A balanced BST has a minimal height, ensuring optimal search, insertion, and deletion times. An unbalanced BST can degrade to a linked list, resulting in less efficient O(n) operations.")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Text("5. Self-Balancing BSTs: Some BST variants, like AVL trees and Red-Black trees, maintain a balanced structure by adjusting the tree's height during insertion and deletion operations.")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                .padding()
            }
        }
    }
}

struct InfoModalView_Previews: PreviewProvider {
    static var previews: some View {
        InfoModalView()
    }
}
