//
//  InfoViewController.swift
//  Navigation
//
//  Created by sv on 02.05.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray
        self.view.addSubview(alertButton)
        self.setupButton()
    }
    
    let alertButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.backgroundColor = .systemYellow
        button.setTitle("Показать алерт", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private func setupButton() {
        alertButton.addTarget(self, action: #selector(didTapAlertButton), for: .touchUpInside)
        self.alertButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.alertButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        self.alertButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        self.alertButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func didTapAlertButton() {
        let alert = UIAlertController(title: "Внимание!", message: "Вы уверены?", preferredStyle: .alert)
        let yesButton = UIAlertAction (title: "Да", style: .default, handler: {action in print("Да")})
        let noButton = UIAlertAction (title: "Нет", style: .default, handler: {action in print("Нет")})
        alert.addAction(yesButton)
        alert.addAction(noButton)
        present(alert, animated: true, completion: nil)
    }
}

