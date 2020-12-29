//
//  HomeViewModelTests.swift
//  DesafioTests
//
//  Created by Vinicius Hiroshi Higa on 29/12/20.
//

import XCTest
@testable import Desafio

class HomeViewModelTests: XCTestCase {

    private var homeViewModel: HomeViewModel?
    
    override func setUp() {
        
        self.homeViewModel = HomeViewModel()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBalance() throws {

        var value = self.homeViewModel?.balance(in: .january)
        XCTAssertTrue(value == 0.0, "Sucesso!")
        
    }

}
