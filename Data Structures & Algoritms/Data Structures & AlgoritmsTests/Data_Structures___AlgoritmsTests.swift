//___FILEHEADER___

import XCTest
@testable import Data_Structures___Algoritms

final class ___FILEBASENAMEASIDENTIFIER___: XCTestCase {
    
    //Here we check if the binarySearch method is giving out the proper index for the looked for value for a given array.x
    func test_binarySearch() {
        
        let array = [1,5,18,32,33,33,47,49,50,60,70,678]
        
        XCTAssertEqual(array.binarySearch(for: 1), 0)
    }
    

}
