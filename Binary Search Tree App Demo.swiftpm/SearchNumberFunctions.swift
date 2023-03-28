//
//  SearchNumberFunctions.swift
//  Binary Search Tree Demo
//
//  Created by Bruno De Vivo on 28/03/23.
//

import Foundation

@available(iOS 16.1, *)
extension SearchNumberView{
    
    func searchIntoBinaryTree(number: String) throws -> Bool {
        
        if number.isValidSearching(){
            let tempNumber = number.filter({ $0 != "."})
            
            guard let found = model?.searchNumber(num: Int(tempNumber)!) else { return false}
            //we can put a not significative value in the return because we know that the model will ever exists, but the syntax requires a control on a optional value
            return found
        }
        else{
            throw InsertionError.invalidNumber
        }
    }
    
}

extension String{
    
    func isValidSearching() -> Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."]
        return Set(self).isSubset(of: nums)
    }
    
}
