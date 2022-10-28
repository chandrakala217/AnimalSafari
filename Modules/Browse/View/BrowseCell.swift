//
//  BrowseCell.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/17/22.
//

import Foundation
import UIKit

class BrowseCell: UITableViewCell {
    
    //MARK: - Private IBOutlets
    
    @IBOutlet private weak var animalImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var headlineLabel: UILabel!
    
    // MARK: - View Intializers
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - Internal Methods
    
    internal func updateUI(image: String?, title: String?, headline: String?) {
        self.animalImage.image = UIImage(named: image ?? "")
        self.nameLabel.text = title
        self.headlineLabel.text = headline
        self.animalImage.contentMode = .scaleToFill
        self.animalImage.layer.cornerRadius = 16.0
    }
}
