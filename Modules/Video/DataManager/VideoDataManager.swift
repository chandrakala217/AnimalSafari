//
//  VideoDataManager.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/18/22.
//

import Foundation
class VideoDataManager: NSObject {
    
    // MARK: - Internal Property
    
    internal var delegate: ModelObserver?
    
    // MARK: - Internal Methods
    
    internal func loadData() {
        let videoResponseModel: VideoResponseModel? = Bundle.main.decode("videos.json")
        self.delegate?.modelDidUpdate(videoResponseModel)
        
        
    }
}
