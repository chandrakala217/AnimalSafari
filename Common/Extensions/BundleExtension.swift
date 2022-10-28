//
//  BundleExtension.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/17/22.
//

import Foundation

extension Bundle {
  func decode<T: Codable>(_ file: String) -> T? {
    // 1. Locate the json file
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to locate \(file) in bundle.")
    }
    
    // 2. Create a property for the data
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load \(file) from bundle.")
    }
    
    // 3. Create a decoder
    
    // 4. Create a property for the decoded data
      
      
      do {
          let decoder = JSONDecoder()
          let loaded = try decoder.decode(T.self, from: data)
          return loaded

      } catch let error {
          print(error)
      }
      return nil
    }
}
