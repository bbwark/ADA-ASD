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
    
    private var persistency = UserDefaults.standard
    var bst = BinarySearchTree<Int>()
    var dataset : [Int] = []
    
    init() {
        if let data = persistency.object(forKey: "tree"){
            dataset = data as! [Int]
            dataset.forEach { i in
                bst.insert(i)
            }
        }
    }
    
    func clearTree() -> Void {
        dataset = []
        bst = BinarySearchTree<Int>()
        saveTree(data: dataset)
    }
    
    func saveTree(data: [Int]) {
        persistency.set(dataset, forKey: "tree")
    }
    
    func searchNumber(num: Int) -> Bool{
        return bst.search(num)
    }
    
    func insertNumber(num: Int){
        bst.insert(num)
    }
}
