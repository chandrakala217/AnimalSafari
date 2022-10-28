//
//  AnimalScrollView.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/22/22.
//

import Foundation
import UIKit

class AnimalScrollView: UIView {
    
    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var animalScrollView: UIScrollView!
    
    // MARK: - View Intializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private lazy var imageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Internal Methods
    
    internal func setUpSubViews(_ images: [String]?) {
        guard let images = images else {
            return
        }
        setupScrollView()
        for (_,image) in images.enumerated() {
            let imageView = UIImageView(frame: frame)
            imageView.image = UIImage(named: image)
            imageView.widthAnchor.constraint(equalToConstant: 330.0).isActive = true
            imageView.contentMode = .scaleToFill
            imageView.layer.cornerRadius = 16.0
            imageView.layer.masksToBounds = true
            self.imageStackView.addArrangedSubview(imageView)
        }
        self.titleLabel.text = "Wilderness in Pictures"
        
    }
    
    private func setupScrollView() {
        animalScrollView.addSubview(contentView)
        contentView.addSubview(imageStackView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.topAnchor.constraint(equalTo: animalScrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: animalScrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: animalScrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: animalScrollView.bottomAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: animalScrollView.heightAnchor).isActive = true
        
        imageStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        imageStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        imageStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        imageStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
