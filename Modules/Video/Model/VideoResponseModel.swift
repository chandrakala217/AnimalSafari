//
//  VideoResponseModel.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/15/22.
//

import Foundation

struct VideoResponseModel:  Encodable, Decodable {
    var videoData: [VideoData]?
    
    init(from decoder: Decoder) throws {
        let container =  try decoder.singleValueContainer()
        videoData = try container.decode([VideoData].self)
    }
}

struct VideoData:  Encodable, Decodable {
    var id: String?
    var name: String?
    var headline: String?
}



