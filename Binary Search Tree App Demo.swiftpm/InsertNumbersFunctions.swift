//
//  InsertNumbersFunctions.swift
//  Binary Search Tree Demo
//
//  Created by Bruno De Vivo on 27/03/23.
//

import Foundation

@available(iOS 16.1, *)
extension InsertNumbersView {
    
    func insertIntoBinaryTree(numbersString: String) throws{
        if numbersString.isValidInsertion(){
            let numbers = castToArray(numbers: numbersString)
            numbers.forEach { i in
                model?.insertNumber(num: i)
                model?.dataset.append(i)
            }
            model?.saveTree(data: model?.dataset ?? [])
        }
        else{
            throw InsertionError.invalidNumbers
        }
        
    }
    
    
    private func castToArray(numbers: String) -> [Int] {
        var numbersInt : [Int] = []
        var numbersFiltered = numbers.filter({ $0 != " "})
        var numberOfCommas = numbersFiltered.filter({ $0 == ","}).count
        
        var i = 0
        while i < numberOfCommas {
            removeExceedingCommas(numberOfCommas: &numberOfCommas, sequence: &numbersFiltered)
            addElementToArray(numbers: &numbersInt, numbersString: &numbersFiltered)
            i += 1
        }
        if !numbersFiltered.isEmpty {
            numbersInt.append(Int(numbersFiltered)!)
        }
        
        return numbersInt
    }
    
    private func removeExceedingCommas(numberOfCommas: inout Int, sequence: inout String){
        
        var countExceedingCommas = 0
        while(sequence.first == ","){
            sequence.remove(at: sequence.startIndex)
            countExceedingCommas += 1
        }
        
        numberOfCommas = numberOfCommas - countExceedingCommas + 1
    }
    
    private func addElementToArray(numbers: inout [Int], numbersString: inout String){
        if let temp = numbersString.firstIndex(of: ","){
            let tempNumber = numbersString.prefix(upTo: temp)
            numbers.append(Int(tempNumber)!)
            numbersString.removeSubrange(numbersString.startIndex..<temp)
        }
    }
}

extension String{
    
    func isValidInsertion() -> Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ","]
        return Set(self).isSubset(of: nums)
    }
    
}

