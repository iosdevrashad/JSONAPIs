//
//  ReviewRowCell.swift
//  JSONAPIs
//
//  Created by Rashad Surratt on 2/2/23.
//

import UIKit

class ReviewRowCell: UICollectionViewCell {
    
    let reviewController = ReviewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        
        addSubview(reviewController.view)
        reviewController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
