//
//  ContentViewViewModel.swift
//  Binary Search Tree Demo
//
//  Created by Bruno De Vivo on 27/03/23.
//

import Foundation
import SwiftUI

@available(iOS 16.1, *)
class ContentViewViewModel : ObservableObject {
    
    private var userdefault = UserDefaults.standard
    private var bst = BinarySearchTree<Int>()
    
    func createNewTree() -> Void {
        let emptyTree = BinarySearchTree<Int>()
        bst = emptyTree
        saveTree(data: bst)
    }
    
    private func saveTree(data: BinarySearchTree<Int>) {
        userdefault.set(data, forKey: "tree")
    }
    
    func searchNumber(num: Int) -> Bool{
        return bst.search(num)
    }
    
    func insertNumber(num: Int){
        bst.insert(num)
    }
}
