//
//  VideoCell.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/18/22.
//

import Foundation
import UIKit

class VideoCell: UITableViewCell {
    
    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var videoImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var headlineLabel: UILabel!
    
    // MARK: - View Intializers
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Internal Methods
    
    internal func updateUI(videoImage: String?, title: String?, headline: String?) {
        self.videoImage.image = UIImage(named: videoImage ?? "")
        self.titleLabel.text = title
        self.headlineLabel.text = headline
        self.videoImage.contentMode = .scaleToFill
        self.videoImage.layer.cornerRadius = 16.0
    }
}
