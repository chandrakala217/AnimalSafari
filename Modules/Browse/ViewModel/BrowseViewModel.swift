//
//  BrowseViewModel.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/14/22.
//

import Foundation

class BrowseViewModel: NSObject {
    
    // MARK: - Private Properties
    
    private var dataManager: BrowseDataManager?
    private var responseModel: AnimalResponseModel?
    private var coverModel: CoverResponseModel?
    
    // MARK: - Internal Property
    
    internal var delegate: ViewModelObserver?
    
    // MARK: - View Intializers
    
    init(model: Any?, dataManager: BrowseDataManager?) {
        super.init()
        setUpViewModel(model: model, dataManager: dataManager)
    }
    
    convenience override init() {
        self.init(model: nil, dataManager: nil)
    }
    
    func setUpViewModel(model: Any?, dataManager: BrowseDataManager?) {
        if let dataManager = dataManager {
            self.dataManager = dataManager
            dataManager.delegate = self
        } else {
            self.dataManager = BrowseDataManager()
            self.dataManager?.delegate = self
        }
    }
    
    // MARK: - Internal Methods
    
    private func setUpDataManager() {
        dataManager = BrowseDataManager()
        dataManager?.delegate = self
    }
    
    internal func fetchData() {
        self.dataManager?.loadData()
    }
    
    internal func numberOfRowsInSection() -> Int {
        guard let model = responseModel,
              let list = model.animal else {
            return 0
        }
        return list.count
    }
    
    internal func imageData(_ indexPath: IndexPath) -> String? {
        guard let model = responseModel,
              let animal = model.animal?[indexPath.row],
              let imageName = animal.image else {
            return nil
        }
        return imageName
    }
    
    internal func imagesArrayData() -> [String]? {
        guard let model = coverModel, let covers = model.coverData else {
            return nil
        }
        var images = [String]()
        for cover in covers {
            images.append(cover.name ?? "")
        }
        return images
        
    }
    
    internal func getResponseModel() -> AnimalResponseModel? {
        return responseModel
    }
    
    internal func animalData(_ indexPath: IndexPath) -> Animals? {
        guard let model = responseModel,
              let animal = model.animal?[indexPath.row] else {
            return nil
        }
        return animal
    }
    
    internal func nameData(_ indexPath:IndexPath) -> String? {
        guard let model = responseModel,
              let animal = model.animal?[indexPath.row],
              let titleName = animal.name else {
            return nil
        }
        return titleName
    }
    
    internal func headlineData(_ indexPath:IndexPath) -> String? {
        guard let model = responseModel,
              let animal = model.animal?[indexPath.row],
              let headline = animal.headline else {
            return nil
        }
        return headline
    }
}
    //MARK: - BrowseViewModel Extension

extension BrowseViewModel: ModelObserver {
    
    internal func modelDidUpdate(_ response: Any?) {
        guard let model = response as? BrowseModel else {
            self.delegate?.viewModelDidUpdateFailed()
            return
        }
        self.responseModel = model.animaldata
        self.coverModel = model.coverData
        self.delegate?.viewModelDidUpdate()
    }
    
    internal func modelDidUpdateFailed() {
        self.delegate?.viewModelDidUpdateFailed()
    }
}
