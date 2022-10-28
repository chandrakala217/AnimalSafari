//
//  BrowseViewController.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/14/22.
//

import Foundation
import UIKit

class BrowseViewController: UIViewController {
    
    //MARK: - Private Properties
    
    private var viewModel: BrowseViewModel?
    private lazy var animalTableView:UITableView = {
        let tb = UITableView(frame: self.view.bounds, style: .plain)
        tb.delegate = self
        tb.dataSource = self
        tb.backgroundColor = .clear
        return tb
    }()
    
    private lazy var browseScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var browseStackView: UIStackView = {
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
    
    //MARK: - View Intializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Safari"
        setUpViewModel()
        setupScrollView()
        self.animalTableView.register(UINib(nibName: "BrowseCell", bundle: nil), forCellReuseIdentifier: "BrowseCell")
        self.viewModel?.fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .black
    }
    
    //MARK: - Private Methods
    
    private func setUpViewModel() {
        viewModel = BrowseViewModel()
        viewModel?.delegate = self
    }
    
    private func setupScrollView() {
        self.view.addSubview(browseScrollView)
        browseScrollView.addSubview(contentView)
        contentView.addSubview(browseStackView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        browseScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        browseScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        browseScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        browseScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: browseScrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: browseScrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: browseScrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: browseScrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: browseScrollView.widthAnchor).isActive = true
        
        browseStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        browseStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        browseStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        browseStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    private func setUpSubViews() {
        if let images = viewModel?.imagesArrayData() {
            let headerView = Bundle.main.loadNibNamed("HeaderPageViewControl", owner: self, options: nil)?[0] as! HeaderPageViewControl
            self.browseStackView.addArrangedSubview(headerView)
            headerView.setUpSubViews(images)
            headerView.heightAnchor.constraint(equalToConstant: 300.0).isActive = true
        }
        self.browseStackView.addArrangedSubview(self.animalTableView)
        let tableviewHeight = (viewModel?.numberOfRowsInSection() ?? 0)*115
        self.animalTableView.heightAnchor.constraint(equalToConstant: CGFloat(tableviewHeight)).isActive = true
    }
}

    // MARK: - BrowseViewController Extensions

extension BrowseViewController: UITableViewDelegate {
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "BrowseDetailsViewController") as! BrowseDetailsViewController
        nextViewController.setUpViewModel(model: viewModel?.animalData(indexPath))
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension BrowseViewController: UITableViewDataSource {
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BrowseCell") as? BrowseCell else {
            return UITableViewCell()
        }
        cell.updateUI(image: viewModel?.imageData(indexPath), title: viewModel?.nameData(indexPath), headline: viewModel?.headlineData(indexPath))
        cell.selectionStyle = .none
        cell.accessoryType = .detailButton
        return cell
    }
    
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection() ?? 0
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension BrowseViewController: ViewModelObserver {
    
    internal func viewModelDidUpdate() {
        DispatchQueue.main.async {
            self.setUpSubViews()
        }
    }
    
    internal func viewModelDidUpdateFailed() {
        // Show Alert
    }
}
