//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by sv on 03.05.2022.
//



import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    //Полупрозрачная view для всплывающего аватара при тапе на него
    private let avatarSubView: UIView = {
         let avatarSubView = UIView()
         let profileVC = ProfileViewController()
         avatarSubView.translatesAutoresizingMaskIntoConstraints = false
         avatarSubView.backgroundColor = .black
         avatarSubView.alpha = 0.0
         avatarSubView.frame = profileVC.view.frame
         return avatarSubView
     }()
    
    //Кнопка закрытия увеличенного после тапа режима аватарки
     private var closeProfileAvatarButton: UIButton = {
         let closeProfileAvatarButton = UIButton()
         closeProfileAvatarButton.translatesAutoresizingMaskIntoConstraints = false
         closeProfileAvatarButton.setImage(UIImage(systemName: "multiply"), for: UIControl.State.normal)
         closeProfileAvatarButton.contentMode = .scaleAspectFill
         closeProfileAvatarButton.alpha = 0.0
         closeProfileAvatarButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
         return closeProfileAvatarButton
     }()
    
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
        layout()
        setupGestures()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Анимация для аватрки
    private func setupGestures() {
         let tapGestureImage = UITapGestureRecognizer(target: self, action: #selector(tapAvatar))
         avatarImageView.addGestureRecognizer(tapGestureImage)
         avatarImageView.isUserInteractionEnabled = true
     }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        layout()
//    } avatarImageView,
    
    private var topAvatarImageView = NSLayoutConstraint()
    private var leadingAvatarImageView = NSLayoutConstraint()
    private var widthAvatarImageView = NSLayoutConstraint()
    private var heightAvatarImageView = NSLayoutConstraint()
    
    private func layout() {
        [fullNameLabel, statusLabel, setStatusButton, avatarSubView, avatarImageView, closeProfileAvatarButton].forEach{addSubview($0)}

    NSLayoutConstraint.activate([
        closeProfileAvatarButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
        closeProfileAvatarButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

        fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
        fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 27),

//        setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
//        setStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
//        setStatusButton.widthAnchor.constraint(equalTo: self.window!.widthAnchor, constant: -32),
//        setStatusButton.heightAnchor.constraint(equalToConstant: 50),
        
        setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        setStatusButton.heightAnchor.constraint(equalToConstant: 50),
        setStatusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
        
        statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 20),
        statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
//        statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -8),
//        statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 27),
        statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -34)
    ])
        
         topAvatarImageView = avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
         leadingAvatarImageView = avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
         widthAvatarImageView = avatarImageView.widthAnchor.constraint(equalToConstant: 110)
         heightAvatarImageView = avatarImageView.heightAnchor.constraint(equalToConstant: 110)
        
         NSLayoutConstraint.activate([
             topAvatarImageView,
             leadingAvatarImageView,
             widthAvatarImageView,
             heightAvatarImageView
         ])
    }
    
        @objc private func tapAvatar() {
             UIImageView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
                 self.topAvatarImageView.constant = (UIScreen.main.bounds.height - UIScreen.main.bounds.width) / 3
                 self.leadingAvatarImageView.constant = 0
                 self.widthAvatarImageView.constant = UIScreen.main.bounds.width
                 self.heightAvatarImageView.constant = self.widthAvatarImageView.constant
                 self.avatarImageView.layer.cornerRadius = 0
                 self.avatarSubView.alpha = 0.8
                 self.layoutIfNeeded()
             } completion: { _ in
                 UIImageView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn){
                     self.closeProfileAvatarButton.alpha = 1
                 }
             }
         }

         @objc private func closeAction(){
             UIImageView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn){
                 self.closeProfileAvatarButton.alpha = 0.0
             } completion: { _ in
                 UIImageView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) { [self] in
                     topAvatarImageView.constant  = 16
                     leadingAvatarImageView.constant = 16
                     widthAvatarImageView.constant  = 110
                     heightAvatarImageView.constant  = 110
                    avatarSubView.alpha = 0.0
                     avatarImageView.layer.cornerRadius = 55
                     layoutIfNeeded()
                 }
             }
    }
}
