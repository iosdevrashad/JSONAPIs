//
//  ReviewRowCell.swift
//  JSONAPIs
//
//  Created by Rashad Surratt on 2/2/23.
//

import UIKit

class ReviewRowCell: UICollectionViewCell {
    
    let reviewsRatingLabel = UILabel(text: "Reviews & Ratings", font: .boldSystemFont(ofSize: 20))
    let reviewController = ReviewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       addSubview(reviewsRatingLabel)
        addSubview(reviewController.view)
        
        reviewsRatingLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 0 ))
        
        reviewController.view.anchor(top: reviewsRatingLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        
        reviewController.view.anchor(top: reviewsRatingLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
