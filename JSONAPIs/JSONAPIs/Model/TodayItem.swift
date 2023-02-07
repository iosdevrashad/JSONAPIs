//
//  TodayItem.swift
//  JSONAPIs
//
//  Created by Rashad Surratt on 2/6/23.
//

import UIKit

struct TodayItem {
    
    let categeory: String
    let title: String
    let image: UIImage
    let description: String
    let backgroundColor: UIColor
    
    // Enum
    let cellType: CellType
    
    let apps: [FeedResult]
    
    enum CellType: String {
        case single, multiple
    }
}
