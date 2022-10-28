//
//  ViewModelProtocol.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/19/22.
//

import Foundation

protocol ViewModelObserver {
    func viewModelDidUpdate()
    func viewModelDidUpdateFailed()
}

protocol ModelObserver {
    func modelDidUpdate(_ response: Any?)
    func modelDidUpdateFailed()
}



