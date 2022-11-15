//
//  HomeViewModelTests.swift
//  Cat TestTests
//
//  Created by Yermis Giovanny Beltrán Cuervo on 14/11/22.
//

import XCTest
@testable import Cat_Test

class HomeViewModelTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testGetCatsCount() {
        let exp = expectation(description: "testGetCatsCount")
        let SUT = createSUT()
        SUT.onLoadData = {
            XCTAssertEqual(SUT.catList.count, 2)
            XCTAssertEqual(SUT.filteredCatList.count, 2)
            exp.fulfill()
        }
        SUT.getCats()
        waitForExpectations(timeout: 1, handler: nil)
        
    }
    
    func createSUT() -> HomeViewModel {
        return HomeViewModel(api: FakeAPI(), imageLoader: FakeImageLoader())
    }

}
