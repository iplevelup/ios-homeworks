//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by sv on 03.05.2022.
//


import UIKit

class ProfileHeaderView: UIView {
    
    let profileStatus = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpProfile()
    }
    
    func setUpProfile() {
        //аватар
        let profilePhoto = UIImageView(frame: CGRect(x: self.safeAreaInsets.left + 16, y: self.safeAreaInsets.top + 16, width: 150, height: 150))
        profilePhoto.image = UIImage(named: "Party Cat")
        profilePhoto.layer.cornerRadius = 75
        profilePhoto.layer.borderWidth = 3
        profilePhoto.layer.borderColor = UIColor.white.cgColor
        profilePhoto.contentMode = .scaleAspectFill
        profilePhoto.clipsToBounds = true
        addSubview(profilePhoto)
        
        //заголовок
        let headLabel = UILabel(frame: CGRect(x: profilePhoto.frame.maxX + 30 , y: self.safeAreaInsets.top + 27, width: window!.frame.width - 32, height: 35))
        headLabel.font = .systemFont(ofSize: 18, weight: .bold)
        headLabel.textColor = .black
        headLabel.text = "Party Cat"
        addSubview(headLabel)
        
        //статус
        profileStatus.frame = CGRect(x: profilePhoto.frame.maxX + 30, y: profilePhoto.frame.origin.y + 100, width: headLabel.frame.width, height: 33)
        profileStatus.font = .systemFont(ofSize: 14, weight: .regular)
        profileStatus.textColor = .gray
        profileStatus.text = "Not in the mood"
        addSubview(profileStatus)
        
        //кнопка
        let showStatusButton = UIButton(frame: CGRect(x: self.safeAreaInsets.left + 16, y: profilePhoto.frame.maxY + 16, width: window!.frame.width - 32, height: 50))
        showStatusButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.titleLabel?.textColor = .white
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.backgroundColor = .systemBlue
        showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7
        showStatusButton.addTarget(self, action: #selector(pushShowStatusButton), for: .touchUpInside)
        addSubview(showStatusButton)
    }
        
    @objc func pushShowStatusButton(sender: UIButton!) {
                let status = self.profileStatus.text
                if status != nil {
                print(status!)
       }
    }
}

