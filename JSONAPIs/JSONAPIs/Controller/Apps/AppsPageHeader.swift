//
//  AppsPageHeader.swift
//  JSONAPIs
//
//  Created by Rashad Surratt on 1/30/23.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {

    let appHeaderHorizonalController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      

        addSubview(appHeaderHorizonalController.view)
        appHeaderHorizonalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
