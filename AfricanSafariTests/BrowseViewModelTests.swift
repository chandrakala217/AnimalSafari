//
//  BrowseViewModelTests.swift
//  AfricanSafariTests
//
//  Created by chandrakala pushpala on 9/17/22.
//

import XCTest
@testable import AfricanSafari

class BrowseViewModelTests: XCTestCase {
    
    var testViewModel: BrowseViewModel?
    var testDataManager: BrowseMockDataManager = BrowseMockDataManager()

    func testViewModelSetUp() {
        XCTAssertNil(testViewModel)
       testViewModel = BrowseViewModel(model: nil, dataManager: testDataManager)
        XCTAssertNotNil(testViewModel)
    }
    
    func testFetchData() {
        testViewModel = BrowseViewModel(model: nil, dataManager: testDataManager)
        XCTAssertNil(testViewModel?.getResponseModel())
        testViewModel?.fetchData()
        XCTAssertNotNil(testViewModel?.getResponseModel())
    }
    
    func testNumberOfRowsInSection() {
        testViewModel = BrowseViewModel(model: nil, dataManager: testDataManager)
        XCTAssertEqual(testViewModel?.numberOfRowsInSection(), 0, "numberOfRowsInSection not set correctly")
        testViewModel?.fetchData()
        XCTAssertEqual(testViewModel?.numberOfRowsInSection(), 12, "numberOfRowsInSection not set correctly")
    }
    
    func testNameData() {
        let indexPath = IndexPath(row: 0, section: 1)
        testViewModel = BrowseViewModel(model: nil, dataManager: testDataManager)
        XCTAssertEqual(testViewModel?.nameData(indexPath), nil, "nameData not set correctly")
        testViewModel?.fetchData()
        XCTAssertEqual(testViewModel?.nameData(indexPath), "Lion", "nameData not set correctly")
    }
    
    func testHeadlineData() {
        let indexPath = IndexPath(row: 0, section: 1)
        testViewModel = BrowseViewModel(model: nil, dataManager: testDataManager)
        XCTAssertEqual(testViewModel?.headlineData(indexPath), nil, "headlineData not set correctly")
        testViewModel?.fetchData()
        XCTAssertEqual(testViewModel?.headlineData(indexPath), "The world\'s most social felines, lions roam the savannas and grasslands of the African continent, hunting cooperatively and raising cubs in prides. ", "headlineData not set correctly")
    }
    
    func testImageData() {
        let indexPath = IndexPath(row: 0, section: 1)
        testViewModel = BrowseViewModel(model: nil, dataManager: testDataManager)
        XCTAssertEqual(testViewModel?.imageData(indexPath), nil, "imageData not set correctly")
        testViewModel?.fetchData()
        XCTAssertEqual(testViewModel?.imageData(indexPath), "lion", "imageData not set correctly")
    }
    
    func testImagesArrayData() {
        testViewModel = BrowseViewModel(model: nil, dataManager: testDataManager)
        XCTAssertEqual(testViewModel?.imagesArrayData()?.count, nil, "imagesArrayData not set correctly")
        testViewModel?.fetchData()
        XCTAssertEqual(testViewModel?.imagesArrayData()?.count, 7, "imagesArrayData not set correctly")
    }
    
    func testAnimalData() {
        let indexPath = IndexPath(row: 0, section: 1)
        testViewModel = BrowseViewModel(model: nil, dataManager: testDataManager)
        XCTAssertEqual(testViewModel?.animalData(indexPath)?.name, nil, "animalData not set correctly")
        testViewModel?.fetchData()
        XCTAssertEqual(testViewModel?.animalData(indexPath)?.name, "Lion", "animalData not set correctly")
    }

}


class BrowseMockDataManager: BrowseDataManager {
    override func loadData() {
        let animalResponseModel: AnimalResponseModel? =  Bundle.main.decode("animals.json")
        let coverResponseModel: CoverResponseModel? =  Bundle.main.decode("covers.json")
        self.delegate?.modelDidUpdate(BrowseModel(animaldata: animalResponseModel, coverData: coverResponseModel))
    }
    
}
