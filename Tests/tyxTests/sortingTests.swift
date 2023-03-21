import XCTest
@testable import tyx

final class sortingTests: XCTestCase {
    func test_merge_sort() {
        var array = [Int]()
        array.merge_sort()
        
        XCTAssertEqual(array, [])
        
        array.append(19358)
        array.merge_sort()
        XCTAssertEqual(array, [19358])
        array.removeLast()
        
        var output = [Int](0 ..< 65536)
        output += output
        output.sort()
        
        array = (0 ..< 65536).shuffled()
        array += array
        array.merge_sort()
        
        XCTAssertEqual(array, output)
    }
    
    func test_bubble_sort() {
        var array = [Int]()
        array.bubble_sort()
        
        XCTAssertEqual(array, [])
        
        array.append(19358)
        array.merge_sort()
        XCTAssertEqual(array, [19358])
        array.removeLast()
        
        var output = [Int](0 ..< 1024)
        output += output
        output.sort()
        
        array = (0 ..< 1024).shuffled()
        array += array
        array.bubble_sort()
        
        XCTAssertEqual(array, output)
    }
    
    func test_selection_sort() {
        var array = [Int]()
        array.selection_sort()
        
        XCTAssertEqual(array, [])
        
        array.append(19358)
        array.merge_sort()
        XCTAssertEqual(array, [19358])
        array.removeLast()
        
        var output = [Int](0 ..< 1024)
        output += output
        output.sort()
        
        array = (0 ..< 1024).shuffled()
        array += array
        array.selection_sort()
        
        XCTAssertEqual(array, output)
    }
    
    func test_insertion_sort() {
        var array = [Int]()
        array.insertion_sort()
        
        XCTAssertEqual(array, [])
        
        array.append(19358)
        array.merge_sort()
        XCTAssertEqual(array, [19358])
        array.removeLast()
        
        var output = [Int](0 ..< 1024)
        output += output
        output.sort()
        
        array = (0 ..< 1024).shuffled()
        array += array
        array.insertion_sort()
        
        XCTAssertEqual(array, output)
    }
}
