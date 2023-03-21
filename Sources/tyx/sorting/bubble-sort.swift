//
//  bubble-sort.swift
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
    /// - Note: It works by repeatedly swapping adjacent elements that are out
    /// of order.
    public mutating func bubble_sort() {
        for i in self.indices {
            for j in i + 1 ..< count {
                if self[i] > self[j] {
                    swapAt(i, j)
                }
            }
        }
    }
}
