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
        
        data = [
            Review(writer: "Calvin", receiver: "Rusty Nail Burgers", reviewText: "Okay burgers. Okay tenant. Would like to see them pay rent on time."),
            Review(writer: "Felix", receiver: "Rusty Nail Burgers", reviewText: "Though my brother isn't a fan of Bob's cooking, I can't find a better burger on the wharf."),
            Review(writer: "Teddy", receiver: "Rusty Nail Burgers", reviewText: "I'm here everyday. Couldn't ask for a better hangout spot."),
            Review(writer: "Mickey", receiver: "Rusty Nail Burgers", reviewText: "Hey Bob! Thanks for feeding me during that heist. I will definitely be back to visit."),
            Review(writer: "Marshmellow", receiver: "Rusty Nail Burgers", reviewText: "Hey Bob."),
            Review(writer: "Rudy", receiver: "Rusty Nail Burgers", reviewText: "My dad drops me off here every once in a while. I like to sit in the back corner and enjoy my food."),
        ]
        
        restaurantImageViewBackground = RestaurantImageViewBackground()
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
        reviewTableView.register(RestaurantReviewCell.self, forCellReuseIdentifier: "reviewCell")
        reviewTableView.backgroundColor = .clear
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        reviewTableView.allowsSelection = false
        
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
            reviewTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            reviewTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
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


extension RestaurantReviewsViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
}

extension RestaurantReviewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath) as! RestaurantReviewCell
        
        if let writer = data[indexPath.section].writer {
            cell.reviewerLabel.text = "\(writer) said:"
        }
        
        if let reviewText = data[indexPath.section].reviewText {
            cell.reviewLabel.text = "\(reviewText)"
        }
        
        return cell
    }
}
