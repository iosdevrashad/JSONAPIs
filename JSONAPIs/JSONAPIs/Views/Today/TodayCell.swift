//
//  TodayCell.swift
//  JSONAPIs
//
//  Created by Rashad Surratt on 2/3/23.
//

import UIKit

class TodayCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: UIImage(named: "evgenie"))
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.centerInSuperview(size: .init(width: 200, height: 200))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
