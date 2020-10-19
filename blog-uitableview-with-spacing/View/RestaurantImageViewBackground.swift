//
//  RestaurantImageViewBackground.swift
//  blog-uitableview-with-spacing
//
//  Created by Andrew Lundy on 10/18/20.
//

import UIKit

class RestaurantImageViewBackground: UIView {
    
    // MARK: - Properties
    
    
    // MARK: - Methods
    
    
    // MARK: - Overrides
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: 175, height: 175)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 0.72, green: 0.25, blue: 0.05, alpha: 1)
        makeCircle()
        layer.shadowColor = UIColor(red: 0.39, green: 0.38, blue: 0.38, alpha: 1).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 5
        layer.shadowOpacity = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
