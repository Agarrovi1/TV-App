//
//  TV_AppTests.swift
//  TV-AppTests
//
//  Created by Angela Garrovillas on 9/10/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import XCTest
@testable import TV_App

class TV_AppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testGetData() {
        let url = "http://api.tvmaze.com/search/shows?q=girls"
        NetworkManager.shared.getData(urlString: url) { (result) in
            switch result {
            case .failure(let error):
                print(error)
                XCTAssert(false)
            case .success(let data):
                XCTAssertTrue(data.isEmpty == false, "expected data got \(data)")
            }
        }
    }
//    func testGetShowsNotEmpty() {
//        let url = "http://api.tvmaze.com/search/shows?q=girls"
//        var shows = [TVShows]()
//        TVShows.getShows(from: url) {(result) in
//            DispatchQueue.main.async {
//                switch result {
//                case .failure(let error):
//                    print(error)
//                case .success(let showsFromURL):
//                    shows = showsFromURL
//                    print(shows.count)
//                    XCTAssertTrue(shows.count > 0, "expected shows got \(shows.count)")
//                }
//            }
//        }
//    }
//    func testShowName() {
//        let url = "http://api.tvmaze.com/search/shows?q=girls"
//        var shows = [Show]() {
//            didSet {
//                XCTAssertTrue(shows[0].showInfo.name.isEmpty, "expected \(shows[0].showInfo.name)")
//            }
//        }
//        DispatchQueue.main.async {
//            TVShows.getShows(from: url) {(result) in
//                switch result {
//                case .failure(let error):
//                    print(error)
//                case .success(let showsFromURL):
//                    shows = showsFromURL
//                    print(shows.count)
//                }
//            }
//        }
//    }

}
