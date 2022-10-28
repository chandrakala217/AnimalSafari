//
//  AnimalResponseModel.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/15/22.
//

import Foundation

struct AnimalResponseModel: Encodable, Decodable {
    var animal: [Animals]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        animal = try container.decode([Animals].self)
    }
  
}

struct Animals: Encodable, Decodable {
    
    var id: String?
    var name: String?
    var headline: String?
    var description: String?
    var link: String?
    var image: String?
    var gallery: [String]?
    var fact: [String]?
}



























