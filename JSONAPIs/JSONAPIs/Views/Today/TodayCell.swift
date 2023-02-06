//
//  TodayCell.swift
//  JSONAPIs
//
//  Created by Rashad Surratt on 2/3/23.
//

import UIKit

class TodayCell: UICollectionViewCell {
    
    var todayItem: TodayItem! {
        didSet {
            categoryLabel.text = todayItem.categeory
            titleLabel.text = todayItem.title
            imageView.image = todayItem.image
            descriptionLabel.text = todayItem.description
        }
    }
    
    let categoryLabel = UILabel(text: "Quick Tips!", font: .boldSystemFont(ofSize: 26))
    let titleLabel = UILabel(text: "Take advanatage of your Apps", font: .boldSystemFont(ofSize: 16))
    let imageView = UIImageView(image: UIImage(named: "evgenie"))
    
    let descriptionLabel = UILabel(text: "Making the best of all your Apps with product organization at its finest.", font: .systemFont(ofSize: 16), numberOfLines: 3)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        clipsToBounds = true 
        layer.cornerRadius = 16
        
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        
        let imageContainerView = UIView()
        imageContainerView.addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 280, height: 280))
        
        let stackView = VerticalStackView(arrangedSubviews: [
        categoryLabel, titleLabel, imageContainerView, descriptionLabel
        ], spacing: 8)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
