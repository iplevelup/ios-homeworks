//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by sv on 03.05.2022.
//



import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var profileStatus = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

        //аватар
    let profilePhoto: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "Party Cat")
        view.layer.cornerRadius = 50
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
        //заголовок
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Party Cat"
        return label
    }()
    
    //статус
    let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = "Not in the mood..."
        return label
    }()

    //кнопка
    lazy var showStatusButton: UIButton = {
    
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.backgroundColor = .systemBlue
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pushShowStatusButton), for: .touchUpInside)
        return button
    }()
 
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    @objc func pushShowStatusButton(sender: UIButton!) {
        let status = self.statusLabel.text
        if status != nil {
        print(status!)
        }
    }

    func layout() {
        [profilePhoto, fullNameLabel, statusLabel, showStatusButton ].forEach{addSubview($0)}

    NSLayoutConstraint.activate([
        profilePhoto.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
        profilePhoto.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        profilePhoto.widthAnchor.constraint(equalToConstant: 100),
        profilePhoto.heightAnchor.constraint(equalToConstant: 100)
    ])

    NSLayoutConstraint.activate([
        fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
        fullNameLabel.leadingAnchor.constraint(equalTo: profilePhoto.trailingAnchor, constant: 27)
    ])

    NSLayoutConstraint.activate([
        showStatusButton.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 16),
        showStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        showStatusButton.widthAnchor.constraint(equalTo: self.window!.widthAnchor, constant: -32),
        showStatusButton.heightAnchor.constraint(equalToConstant: 50)
    ])

    NSLayoutConstraint.activate([
        statusLabel.leadingAnchor.constraint(equalTo: profilePhoto.trailingAnchor, constant: 27),
        statusLabel.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -34)
    ])
    }
}
