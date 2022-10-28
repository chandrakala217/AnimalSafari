//
//  VideoViewModel.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/14/22.
//

import Foundation

class VideoViewModel: NSObject {
    
    // MARK: - Private Properties
    
    private var dataManager: VideoDataManager?
    private var responseModel: VideoResponseModel?
    
    //MARK: - Internal Property
    
    internal var delegate: ViewModelObserver?
    
    // MARK: - View Intializers
    
    override init() {
        super.init()
        setUpDataManager()
    }
    
    // MARK: - Internal Methods
    
    private func setUpDataManager() {
        dataManager = VideoDataManager()
        dataManager?.delegate = self
    }
    
    internal func fetchData() {
        self.dataManager?.loadData()
    }
    
    internal func rowDataCount() -> Int {
        guard let model = responseModel,
              let video = model.videoData else {
            return 0
        }
        return video.count
    }
    
    internal func imageData(_ indexPath: IndexPath) -> String? {
        guard let model = responseModel,
              let video = model.videoData?[indexPath.row],
              let image = video.id else {
            return nil
        }
        return image
    }
    
    internal func titleData(_ indexPath: IndexPath) -> String? {
        guard let model = responseModel,
              let video = model.videoData?[indexPath.row],
              let title = video.name else {
            return nil
        }
        return title
    }
    
    internal func headlineData(_ indexPath: IndexPath) -> String? {
        guard let model = responseModel,
              let video = model.videoData?[indexPath.row],
              let headline = video.headline else {
            return nil
        }
        return headline
    }
    
    internal func animalData(_ indexPath: IndexPath) -> String? {
        guard let model = responseModel,
              let video = model.videoData?[indexPath.row],
              let animalName = video.id else {
            return nil
        }
        return animalName
    }
}

    // MARK: - VideoViewModel Extension

extension VideoViewModel: ModelObserver {
    
    internal func modelDidUpdate(_ response: Any?) {
        guard let model = response as? VideoResponseModel else {
            self.delegate?.viewModelDidUpdateFailed()
            return
        }
        self.responseModel = model
        self.delegate?.viewModelDidUpdate()
    }
    
    internal func modelDidUpdateFailed() {
        self.delegate?.viewModelDidUpdateFailed()
    }
}
