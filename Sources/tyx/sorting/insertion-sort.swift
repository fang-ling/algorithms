//
//  insertion-sort.swift
//  
//
//  Created by Fang Ling on 2023/3/21.
//

import Foundation

extension Array where Element : Comparable {
    /// Sorts the collection.
    ///
    /// - Complexity: O($n^2$), where $n$ is the length of the collection.
    ///
    /// - Note: We start with an empty sorted array. We then remove an element
    /// at a time from the unsorted portion of array and insert it into the
    /// correct position in the sorted array. To find the correct position for
    /// an element, we compare it with each of the elements already in the
    /// sorted array, from right to left.
    public mutating func insertion_sort() {
        if count <= 1 {
            return
        }
        var key : Element
        var i : Int
        for j in 1 ..< count {
            key = self[j]
            /* Insert A[j] into the sorted sequence A[0 ..< j] */
            i = j - 1
            while i >= 0 && self[i] > key {
                self[i + 1] = self[i]
                i -= 1
            }
            self[i + 1] = key
        }
    }
}
