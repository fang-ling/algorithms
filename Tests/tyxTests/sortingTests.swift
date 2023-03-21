import XCTest
@testable import tyx

final class sortingTests: XCTestCase {
    func test_merge_sort() throws {
        var array = [Int]()
        array.merge_sort()
        
        XCTAssertEqual(array, [])
        
        var output = [Int](0 ..< 65536)
        output += output
        output.sort()
        
        array = (0 ..< 65536).shuffled()
        array += array
        array.merge_sort()
        
        XCTAssertEqual(array, output)
    }
}
