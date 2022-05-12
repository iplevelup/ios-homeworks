//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by sv on 03.05.2022.
//



import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    let avatarImageView: UIImageView = {
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
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Party Cat"
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = "Not in the mood..."
        return label
    }()

    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "I'm waiting you"
        textField.isHidden = true
        textField.layer.cornerRadius = 12
        textField.font = UIFont(name: "Helvetica-Regular", size: 15)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
    }()
    
        @objc func statusTextChanged(sender: UITextField) {
            statusText = textField.text ?? "Waiting for something..."
        }
    
    lazy var setStatusButton: UIButton = {
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
        button.addTarget(self, action: #selector(didTapStatusButton), for: .touchUpInside)
        return button
    }()
 
    @objc func didTapStatusButton(sender: UIButton) {
        print("Status is: \(String(describing: statusLabel.text))")
    }
   
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    private func layout() {
        [avatarImageView, fullNameLabel, statusLabel, setStatusButton].forEach{addSubview($0)}

    NSLayoutConstraint.activate([
        avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
        avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        avatarImageView.widthAnchor.constraint(equalToConstant: 100),
        avatarImageView.heightAnchor.constraint(equalToConstant: 100)
    ])

    NSLayoutConstraint.activate([
        fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
        fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 27)
    ])

    NSLayoutConstraint.activate([
        setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
        setStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        setStatusButton.widthAnchor.constraint(equalTo: self.window!.widthAnchor, constant: -32),
        setStatusButton.heightAnchor.constraint(equalToConstant: 50)
    ])

    NSLayoutConstraint.activate([
        statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 27),
        statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -34)
    ])
    }
}
