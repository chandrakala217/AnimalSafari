//
//  HeaderPageViewControl.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/18/22.
//

import Foundation
import UIKit

class HeaderPageViewControl: UIView {
    
    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var headerScrollView: UIScrollView!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    // MARK: - View initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Internal methods
    
    internal func setUpSubViews(_ images: [String]) {
        self.pageControl.numberOfPages = images.count
        self.pageControl.currentPage = 0
        
        headerScrollView.contentSize = CGSize(width: frame.width * CGFloat(images.count), height: frame.height)
        headerScrollView.isPagingEnabled = true
        headerScrollView.isScrollEnabled = true
        
        for (index,image) in images.enumerated() {
            frame.origin.x = headerScrollView.frame.size.width * CGFloat(index)
            frame.size = headerScrollView.frame.size
            let imageView = UIImageView(frame: frame)
            imageView.image = UIImage(named: image)
            self.headerScrollView.addSubview(imageView)
        }
        
    }
    
}

//MARK: - HeaderPageViewControl Extension

extension HeaderPageViewControl: UIScrollViewDelegate {
    internal func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x/scrollView.frame.size.width
        pageControl.currentPage = Int(page)
    }
}
