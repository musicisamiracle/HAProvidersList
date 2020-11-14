//
//  HAProvidersListTests.swift
//  HAProvidersListTests
//
//  Created by Dane Thomas on 11/14/20.
//

import XCTest
@testable import HAProvidersList
import Combine

class HAProvidersListTests: XCTestCase {
    
    var listPresenter: ListPresenter!
    var cancellables: [AnyCancellable] = []

    override func setUp() {
        self.listPresenter = ListPresenter(interactor: MockProvidersInteractor(), router: MockRouter())
        self.cancellables = []
    }
    
    override func tearDown() {
        self.listPresenter = nil
        self.cancellables = []
    }
    
    func testLoadProviders() {
        let expectation = XCTestExpectation(description: "loading providers")
        
        self.listPresenter.proResponse.sink { (response) in
            guard !response.isEmpty else { return }
            expectation.fulfill()
        }.store(in: &self.cancellables)

        self.listPresenter.loadProviders()
        XCTAssertEqual(3, self.listPresenter.proResponse.value.count)
        XCTAssertEqual("A company", self.listPresenter.proResponse.value[0].companyName)
        
        self.wait(for: [expectation], timeout: 5)
    }

}
