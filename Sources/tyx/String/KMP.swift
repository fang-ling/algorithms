//
//  KMP.swift
//  
//
//  Created by Fang Ling on 2023/5/19.
//

import Foundation

extension String {
    @inlinable public func indicesOf(pattern : String) -> [Int] {
        if pattern.count > self.count || pattern.isEmpty {
            return []
        }
        
        /* Encapsulate knowledge about how the pattern matches against shifts of
         * itself. We want the longest proper prefix P that is also a proper
         * suffix of pattern[:q].
         */
        /// - Returns: prefix function where π[q] is the length of the longest
        /// prefix of pattern that is a proper suffix of pattern[:q]
        @inline(__always)
        func compute_prefix_function(_ pattern : [Character]) -> [Int] {
            let m = pattern.count
            var π = [Int](repeating: 0, count: m)
            π[0] = -1 /* adjust for 0-origin indexing */
            var k = -1 /* also for 0-origin indexing */
            
            for q in 1 ..< m {
                /* adjust for 0-origin indexing */
                while k > -1 && pattern[k + 1] != pattern[q] {
                    k = π[k] /* character does not match */
                }
                if pattern[k + 1] == pattern[q] {
                    k += 1 /* character matches, continue */
                }
                /* assign prefix to position of last character matched */
                π[q] = k
            }
            return π
        }
        
        var result = [Int]()
        let pattern_array = Array(pattern)
        let text_array = Array(self)
        let π = compute_prefix_function(pattern_array)
        let m = pattern.count - 1 /* adjust for 0-origin indexing. */
        var q = -1 /* index in pattern of last character matched */
        for i in text_array.indices {
            /* again, adjust q for 0-origin indexing */
            while q > -1 && pattern_array[q + 1] != text_array[i] {
                q = π[q] /* next character matches */
            }
            if pattern_array[q + 1] == text_array[i] {
                q += 1 /* next character matches */
            }
            if q == m {
                result.append(i - m)
                q = π[q]
            }
        }
        return result
    }
}

/* Notes: (To compute π array manually)
 * Let π[i] be the longest proper prefix of pattern[0 ... i] which is also a
 * suffix of pattern[0 ... i].
 * (A proper prefix is a prefix with a whole string not allowed.)
 *
 * Example: for the pattern "ABAABC"
 * i = 0: p-prefix: ø; suffix: ø   --> π[0 - 1] = 0 // Trivial case
 * i = 1: p-prefix: ø; suffix: ø                        --> π[1 - 1] = 0
 * i = 2: p-prefix: {A}; suffix: {B, AB}                --> π[2 - 1] = 0
 * i = 3: p-prefix: {A, AB}; suffix: {A, BA, ABA}       --> π[3 - 1] = 1
 * i = 4: p-prefix: {A, AB, ABA};
 *          suffix: {A, AA, BAA, ABAA}                  --> π[4 - 1] = 1
 * i = 5: p-prefix: {A, AB, ABA, ABAA};
 *          suffix: {B, AB, AAB, BAAB, ABAAB}           --> π[5 - 1] = 2
 * i = 6: p-prefix: {A, AB, ABA, ABAA, ABAAB};
 *          suffix: {C, BC, ABC, AABC, BAABC, ABAABC}   --> π[6 - 1] = 0
 *
 * That is, π = [0, 0, 1, 1, 2, 0]. (Aka partial match array).
 * Our program's π is every element decreased by one: [-1, -1, 0, 0, 1, -1].
 * To get something call `next`, right shift π by one with π[0] = -1:
 * next = [-1, 0, 0, 1, 1, 2].
 * You may also add next by one:
 * next' = [0, 1, 1, 2, 2, 3]
 */
