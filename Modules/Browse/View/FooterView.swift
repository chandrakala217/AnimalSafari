//
//  FooterView.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/22/22.
//

import Foundation
import UIKit

class FooterView: UIView {
    
    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - View Intializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Internal Methods
    
    internal func setUpSubViews(_ description: String?, animalName: String?) {
        self.descriptionLabel.text = description
        self.titleLabel.text = String(format: "All about %@", animalName ?? "")
    }
    
    
}
