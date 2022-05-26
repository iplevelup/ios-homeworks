//
//  FeedViewController.swift
//  Navigation
//
//  Created by sv on 17.04.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    struct Post {
        var title: String
    }
    
    let lastPost = Post.init(title: "Мой последний пост")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        self.navigationItem.title = "Лента"
        
        let switchToPostButton = UIButton (frame: CGRect (x: 50, y: 250, width: 200, height: 50))
        switchToPostButton.backgroundColor = .systemBlue
        switchToPostButton.layer.cornerRadius = 12
        switchToPostButton.layer.masksToBounds = true
        switchToPostButton.center = self.view.center
        switchToPostButton.setTitle ("Перейти к посту", for: .normal)
        switchToPostButton.addTarget(self, action: #selector (pressSwitch), for: .touchUpInside)
        self.view.addSubview(switchToPostButton)
    }
    
    @objc private func pressSwitch() {
        let post = PostViewController()
        post.navigationItem.title = lastPost.title
        self.navigationController?.pushViewController(post, animated: true)
    }
}
