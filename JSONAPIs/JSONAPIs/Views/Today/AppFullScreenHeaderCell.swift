//
//  AppFullScreenHeaderCell.swift
//  JSONAPIs
//
//  Created by Rashad Surratt on 2/6/23.
//

import UIKit

class AppFullScreenHeaderCell: UITableViewCell {
    
    let todayCell = TodayCell()
    
//    let closeButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
//        return button
//    }()
//
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(todayCell)
        todayCell.fillSuperview()
        
//        addSubview(closeButton)
//        closeButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .zero, size: .init(width: 80, height: 38))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
