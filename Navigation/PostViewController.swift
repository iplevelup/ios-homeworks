//
//  PostViewController.swift
//  Navigation
//
//  Created by sv on 30.04.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.navigationItem.rightBarButtonItems = [
                    UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareBtnTapped)),
                ]
        self.navigationItem.titleView?.center = self.view.center
        self.navigationItem.titleView?.backgroundColor = .white
    }
    @objc private func shareBtnTapped() {
          let newVC = InfoViewController()
          self.present(newVC, animated: true, completion: nil)
    }
}
