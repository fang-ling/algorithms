//
//  selection-sort.swift
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
    /// - Note: It works by first finding the smallest element of `A` and
    /// exchanging it with the element in `A[0]`. Then find the second smallest
    /// element of `A`, and exchange it with `A[1]`. Continue in this manner for
    /// first n - 1 elements of `A`.
    public mutating func selection_sort() {
        var min : Int
        for i in self.indices {
            min = i
            /* Find smallest element in the currently unsorted array */
            for j in i ..< count {
                if self[j] < self[min] {
                    min = j
                }
            }
            swapAt(i, min)
        }
    }
}
