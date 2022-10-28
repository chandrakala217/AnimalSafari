//
//  InfoView.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/20/22.
//

import Foundation
import UIKit

class InfoView: UIView {
    
    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var headlineLabel: UILabel!
    
    // MARK: - View Intializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Internal Methods
    
    internal func setUpSubViews(name: String?, headline: String?) {
        self.nameLabel.text = name
        self.headlineLabel.text = headline
    }
}

