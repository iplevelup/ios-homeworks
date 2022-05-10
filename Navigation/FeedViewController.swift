//
//  FeedViewController.swift
//  Navigation
//
//  Created by sv on 02.05.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    struct Post {
        var title: String
    }
    
    let  postButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 12
        button.setTitle("Перейти на пост", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(postButton)
        self.setupButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Лента"
    }
    
        private func setupButton() {
        postButton.addTarget(self, action: #selector(didTapPostButton), for: .touchUpInside)
        self.postButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.postButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        self.postButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        self.postButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func didTapPostButton() {
        let postVC = PostViewController()
        postVC.navigationItem.title = Post(title: "Мой пост").title
        self.navigationController?.pushViewController(postVC, animated: true)
    }
}

