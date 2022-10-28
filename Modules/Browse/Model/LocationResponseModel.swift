//
//  LocationResponseModel.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/15/22.
//

import Foundation

struct LocationResponseModel: Decodable {
    var location: [Locations]?
}

struct Locations: Decodable {
    
    var id: String?
    var name: String?
    var image: String?
    var latitude: String?
    var longitude: String?
}
