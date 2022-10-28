//
//  BrowseDetailsViewModel.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/20/22.
//

import Foundation

class BrowseDetailsViewModel: NSObject {
    
    //MARK: - Internal Property
    
    internal var animalData: Animals?
    
    // MARK: - View Intializers
    
    internal init(_ model: Animals?)  {
        super.init()
        self.animalData = model
    }
    // MARK: - Internal Methods
    
    internal func animalName() -> String {
        return animalData?.name ?? ""
    }
    
    internal func animalImage() -> String? {
        return animalData?.image
    }
    internal func animalHeadline() -> String? {
        return animalData?.headline ?? ""
    }
    internal func animalGallery() -> [String]? {
        return animalData?.gallery
        
    }
    internal func animalDescription() -> String? {
        return animalData?.description
    }
}
