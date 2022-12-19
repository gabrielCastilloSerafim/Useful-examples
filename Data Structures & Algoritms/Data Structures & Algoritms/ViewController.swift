//
//  ViewController.swift
//  Data Structures & Algoritms
//
//  Created by Gabriel Castillo Serafim on 19/12/22.
//

import Foundation

//We extend the RandomAccessCollection where a generic Element conforms to the comparable protocol because we want to apply this binary search method to arrays.

//To perform a binary search the Element must be comparable and be sorted.

extension RandomAccessCollection where Element: Comparable {
    
    //The binary search method takes two parameters a value of the generic type element and a optional range that most of the time will be assigned a value by the own function for the next iteration.
    func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
        
        //First we check if a range value was assigned when the function got called, if it was than we are going to use it else we will use the full range of the given array.
        let range = range ?? startIndex..<endIndex
        
        //Here we check if range is not a empty range before proceding
        guard range.lowerBound < range.upperBound else { return nil }
        
        //Get the number of elements of the array
        let size = distance(from: range.lowerBound, to: range.upperBound)
        
        //Create a index to represent the center of the array
        let middle = index(range.lowerBound, offsetBy: size / 2)
        
        //Check if the given array's value at the middle index is equal to the value that we are looking for, if it is then we return that index, if it is not equal then we check if the value at the middle index is lower or greater then the value that we are looking for, if it is lower, then we call the function again passing in as the range the lower half range of the array and if it is grater then we pass in the grater half of the array as the range parameter.
        if self[middle] == value {
            
            return middle
            
        } else if self[middle] > value {
            
            return binarySearch(for: value, in: range.lowerBound..<middle)
            
        } else {
            
            return binarySearch(for: value, in: index(after: middle)..<range.upperBound)
        }
    }
}
