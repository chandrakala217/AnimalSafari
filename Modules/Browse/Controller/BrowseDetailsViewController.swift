//
//  BrowseDetailsViewController.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/20/22.
//

import Foundation
import UIKit

class BrowseDetailsViewController: UIViewController {
    
    //MARK: - Private Properties
    
    private var detailsViewModel: BrowseDetailsViewModel?
    private lazy var detailsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var detailsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
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
    
    // MARK: - View Intializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title  = String(format: "Learn about %@", detailsViewModel?.animalName() ?? "")
        setupScrollView()
        setUpSubViews()
    }
    
    //MARK: - Internal Methods
    
    internal func setUpViewModel(model: Animals?) {
        detailsViewModel = BrowseDetailsViewModel(model)
        
    }
    
    // MARK: - Private Methods
    
    private func setupScrollView() {
        self.view.addSubview(detailsScrollView)
        detailsScrollView.addSubview(contentView)
        contentView.addSubview(detailsStackView)
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        detailsScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        detailsScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        detailsScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        detailsScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
        contentView.topAnchor.constraint(equalTo: detailsScrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: detailsScrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: detailsScrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: detailsScrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: detailsScrollView.widthAnchor).isActive = true
        
        
        detailsStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        detailsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        detailsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        detailsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    private func setUpSubViews() {
        
        let headerImageView = UIImageView(image: UIImage(named: detailsViewModel?.animalImage() ?? "" ))
        detailsStackView.addArrangedSubview(headerImageView)
        headerImageView.heightAnchor.constraint(equalToConstant: 250.0).isActive = true
        
        let infoView = Bundle.main.loadNibNamed("InfoView", owner: self, options: nil)?[0] as! InfoView
        infoView.setUpSubViews(name: detailsViewModel?.animalName(), headline: detailsViewModel?.animalHeadline())
        detailsStackView.addArrangedSubview(infoView)
        
        
        let animalScrollView = Bundle.main.loadNibNamed("AnimalScrollView", owner: self, options: nil)?[0] as! AnimalScrollView
        animalScrollView.setUpSubViews(detailsViewModel?.animalGallery())
        detailsStackView.addArrangedSubview(animalScrollView)
        
        let footerView = Bundle.main.loadNibNamed("FooterView", owner: self, options: nil)?[0] as! FooterView
        footerView.setUpSubViews(detailsViewModel?.animalDescription(), animalName: detailsViewModel?.animalName())
        detailsStackView.addArrangedSubview(footerView)
    }
}


