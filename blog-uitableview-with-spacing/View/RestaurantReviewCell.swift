//
//  RestaurantReviewCell.swift
//  blog-uitableview-with-spacing
//
//  Created by Andrew Lundy on 10/18/20.
//

import UIKit

class RestaurantReviewCell: UITableViewCell {

    // MARK: - Properties
    var reviewerLabel: UILabel!
    var reviewLabel: UILabel!
    
    // MARK: - Methods
    func applyAutoConstraints() {
        NSLayoutConstraint.activate([
            reviewerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            reviewerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            reviewerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            reviewerLabel.heightAnchor.constraint(equalToConstant: 25),
            reviewLabel.topAnchor.constraint(equalTo: reviewerLabel.bottomAnchor, constant: -30),
            reviewLabel.leadingAnchor.constraint(equalTo: reviewerLabel.leadingAnchor, constant: 0),
            reviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            reviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20),
           
        ])
    }
    
    // MARK: - Overrides
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        layer.cornerRadius = 20
        
        reviewerLabel = UILabel()
        reviewerLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewerLabel.font = UIFont.systemFont(ofSize: 22)
        contentView.addSubview(reviewerLabel)
        
        reviewLabel = UILabel()
        reviewLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewLabel.font = UIFont.systemFont(ofSize: 15)
        reviewLabel.numberOfLines = 3
        reviewLabel.lineBreakMode = .byWordWrapping
        contentView.addSubview(reviewLabel)
        
        
        applyAutoConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
