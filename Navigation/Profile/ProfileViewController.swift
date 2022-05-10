//
//  ProfileViewController.swift
//  Navigation
//
//  Created by sv on 02.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var headerView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(headerView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        headerView.frame = view.frame
    }
}
