//
//  MultipleAppCell.swift
//  JSONAPIs
//
//  Created by Rashad Surratt on 2/7/23.
//

import UIKit

class TodayMultipleAppCell: BaseTodayCell {
    
    override var todayItem: TodayItem! {
        didSet {
            categoryLabel.text = todayItem.categeory
            titleLabel.text = todayItem.title
            
            multipleAppController.results = todayItem.apps
            multipleAppController.collectionView.reloadData()
        }
    }
    
    let categoryLabel = UILabel(text: "Quick Tips!", font: .boldSystemFont(ofSize: 20))
    let titleLabel = UILabel(text: "Take advanatage of your Apps", font: .boldSystemFont(ofSize: 32), numberOfLines: 2)
    
    let multipleAppController = TodayMultipleAppsController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        backgroundColor = .white
        layer.cornerRadius = 16
        
        let stackView = VerticalStackView(arrangedSubviews: [
        categoryLabel, titleLabel,
        multipleAppController.view
        ], spacing: 12)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
