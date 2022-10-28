//
//  CoverResponseModel.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/15/22.
//

import Foundation

struct CoverResponseModel: Decodable, Encodable {
    var coverData: [Cover]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        coverData = try container.decode([Cover].self)
    }
    
}
struct Cover: Decodable, Encodable {
    
    var id: Int?
    var name: String?
}
