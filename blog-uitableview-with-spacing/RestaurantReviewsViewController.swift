//
//  ViewController.swift
//  blog-uitableview-with-spacing
//
//  Created by Andrew Lundy on 10/18/20.
//

import UIKit

struct Review {
    var writer: String!
    var receiver: String!
    var reviewText: String!
}

class RestaurantReviewsViewController: UIViewController {

    // MARK: - Properties
    private var data: [Review]!
    private var restaurantImageViewBackground: UIView!
    private var restaurantImageView: UIImageView!
    private var restaurantNameLabel: UILabel!
    private var starStackView: UIStackView!
    private var reviewTableView: UITableView!
    
    
    // MARK: - Methods
    func setupView() {
        
        restaurantImageViewBackground = UIView(frame: CGRect(x: 0, y: 0, width: 175, height: 175))
        restaurantImageViewBackground.translatesAutoresizingMaskIntoConstraints = false
        restaurantImageViewBackground.backgroundColor = UIColor(red: 0.72, green: 0.25, blue: 0.05, alpha: 1)
        restaurantImageViewBackground.makeCircle()
        restaurantImageViewBackground.layer.shadowColor = UIColor(red: 0.39, green: 0.38, blue: 0.38, alpha: 1).cgColor
        restaurantImageViewBackground.layer.shadowOffset = CGSize(width: 0, height: 5)
        restaurantImageViewBackground.layer.shadowRadius = 5
        restaurantImageViewBackground.layer.shadowOpacity = 1
        view.addSubview(restaurantImageViewBackground)
        
        restaurantImageView = UIImageView(image: UIImage(named: "cheese-burger"))
        restaurantImageView.translatesAutoresizingMaskIntoConstraints = false
        restaurantImageViewBackground.addSubview(restaurantImageView)
        
        restaurantNameLabel = UILabel()
        restaurantNameLabel.translatesAutoresizingMaskIntoConstraints = false
        restaurantNameLabel.text = "Rusty Nail Burgers"
        restaurantNameLabel.font = UIFont.boldSystemFont(ofSize: 28)
        restaurantNameLabel.textColor = .black
        view.addSubview(restaurantNameLabel)
        
        starStackView = UIStackView()
        starStackView.translatesAutoresizingMaskIntoConstraints = false
        starStackView.alignment = .center
        starStackView.axis = .horizontal
        starStackView.spacing = 5
        
        for _ in 0...5 {
            let starView = UIImageView(image: UIImage(systemName: "star.fill"))
            starView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            starView.tintColor = .black
            starStackView.addArrangedSubview(starView)
        }
        
        view.addSubview(starStackView)
        
        reviewTableView = UITableView()
        reviewTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reviewTableView)
        
        
        applyAutoConstraints()
    }
    
    func applyAutoConstraints() {
        NSLayoutConstraint.activate([
            restaurantImageViewBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            restaurantImageViewBackground.heightAnchor.constraint(equalToConstant: 175),
            restaurantImageViewBackground.widthAnchor.constraint(equalToConstant: 175),
            restaurantImageViewBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            restaurantImageView.centerXAnchor.constraint(equalTo: restaurantImageViewBackground.centerXAnchor),
            restaurantImageView.centerYAnchor.constraint(equalTo: restaurantImageViewBackground.centerYAnchor),
            restaurantImageView.heightAnchor.constraint(equalToConstant: 100),
            restaurantImageView.widthAnchor.constraint(equalToConstant: 100),
            restaurantNameLabel.topAnchor.constraint(equalTo: restaurantImageViewBackground.bottomAnchor, constant: 25),
            restaurantNameLabel.centerXAnchor.constraint(equalTo: restaurantImageViewBackground.centerXAnchor),
            restaurantNameLabel.heightAnchor.constraint(equalToConstant: 40),
            starStackView.topAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor, constant: 10),
            starStackView.centerXAnchor.constraint(equalTo: restaurantImageViewBackground.centerXAnchor),
            reviewTableView.topAnchor.constraint(equalTo: starStackView.bottomAnchor, constant: 50),
            reviewTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reviewTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            reviewTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 0.88, green: 0.88, blue: 0.88, alpha: 1)
        
        setupView()

    }
    
}

// MARK: - Extensions




extension UIView {
    func makeCircle() {
        self.layer.cornerRadius = self.frame.height / 2
    }
}
