//
//  NetworkTests.swift
//  DesafioTests
//
//  Created by Vinicius Hiroshi Higa on 28/12/20.
//

import XCTest
@testable import Desafio

class NetworkTests: XCTestCase {

    // Functional test case.
    // Tests the connection between the device and the /lancamentos with GET verb.
    func testGetLancamentos() throws {

        let expectation = self.expectation(description: "Got any data from GET /lancamentos")
      
        NetworkHandler.getCreditLaunches(completion: {
            creditLaunches in
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 3.0, handler: nil)
        
    }
    
    // Functional test case.
    // Tests the connection between the device and the /categorias with GET verb.
    func testGetCategorias() throws {

        let expectation = self.expectation(description: "Got any data from GET /categorias")
      
        NetworkHandler.getCategoryTypes(completion: {
            categoryTypes in
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 3.0, handler: nil)
        
    }

}
