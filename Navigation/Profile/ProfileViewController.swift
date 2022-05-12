//
//  ProfileViewController.swift
//  Navigation
//
//  Created by sv on 02.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private let headerView: UIView = {
        let view = ProfileHeaderView()
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let newButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("New Button", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        headerViewSettings()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        headerView.frame = view.frame
    }
    
    private func headerViewSettings(){

        [headerView, newButton].forEach{view.addSubview($0)}

        headerView.frame = view.frame

        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 220)
            ])

        NSLayoutConstraint.activate([
            newButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

