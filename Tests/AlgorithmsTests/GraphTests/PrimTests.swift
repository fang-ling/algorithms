//
//  PrimTests.swift
//
//
//  Created by Fang Ling on 2023/8/16.
//

import XCTest
@testable import Algorithms
import Collections

final class PrimTests : XCTestCase {
  func test_prim() {
    let G = AdjacencyList(
      count: 9,
      edges: [
        (0, 1, 4),  (0, 2, 8),  (1, 0, 4),  (2, 0, 8),
        (1, 2, 11), (1, 5, 8),  (2, 1, 11), (5, 1, 8),
        (2, 3, 7),  (2, 4, 1),  (3, 2, 7),  (4, 2, 1),
        (3, 5, 2),  (3, 4, 6),  (5, 3, 2),  (4, 3, 6),
        (4, 6, 2),              (6, 4, 2),
        (5, 6, 4),  (5, 7, 7),  (6, 5, 4),  (7, 5, 7),
        (6, 7, 14), (6, 8, 10), (7, 6, 14), (8, 6, 10),
        (7, 8, 9),              (8, 7, 9)
      ]
    )
    XCTAssertEqual(prim(G: G, r: 0).1, 37)
  }
}
