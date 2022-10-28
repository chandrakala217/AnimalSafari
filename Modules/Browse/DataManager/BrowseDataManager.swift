//
//  BrowseDataManager.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/17/22.
//

import Foundation

class BrowseDataManager: NSObject {
    
    // MARK: - Internal Property
    
    internal var delegate: ModelObserver?
    
    // MARK: - Internal Methods
    
    internal func loadData() {
        let animalResponseModel: AnimalResponseModel? =  Bundle.main.decode("animals.json")
        let coverResponseModel: CoverResponseModel? =  Bundle.main.decode("covers.json")
        self.delegate?.modelDidUpdate(BrowseModel(animaldata: animalResponseModel, coverData: coverResponseModel))
    }
}

struct BrowseModel {
    let animaldata: AnimalResponseModel?
    let coverData: CoverResponseModel?
}
