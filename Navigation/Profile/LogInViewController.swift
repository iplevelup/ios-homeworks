//
//  LoginViewController.swift
//  Navigation
//
//  Created by Tatyana sv on 30.04.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
 
    var i = false // проверка первого филда на пустоту
    var j = false // проверка второго филда на пустоту
    
    let email = "mailmail" // стандартный мейл
    let password = "password" // стандартный пароль
    
    private lazy var scrollView: UIScrollView = {
            let scrollView = UIScrollView ()
            scrollView.backgroundColor = .white
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        } ()
    
    private lazy var stackView: UIStackView = {
            let stackView = UIStackView ()
            stackView.backgroundColor = .white
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.distribution = .fillProportionally
            stackView.spacing = 16
            return stackView
        } ()
    
    private lazy var vkLogoImage: UIImageView = {
        let imageView  = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.backgroundColor = .white
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image = UIImage(named: "logo.png")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var textField1: UITextField = {
       let text1 = UITextField()
        let padding: CGFloat = 10
        text1.translatesAutoresizingMaskIntoConstraints = false
        text1.textColor = .black
        text1.autocapitalizationType = .none
        text1.layer.borderColor = UIColor.lightGray.cgColor
        text1.layer.borderWidth = 0.5
        text1.layer.cornerRadius = 10
        text1.backgroundColor = .systemGray6
        text1.font = UIFont.systemFont(ofSize: 16)
        text1.clearButtonMode = .whileEditing
        text1.clearButtonMode = .unlessEditing
        text1.clearButtonMode = .always
        text1.placeholder = "E-mail"
        text1.addPadding(.both(10))
        text1.addTarget(self, action: #selector(textFieldDidChange(_:)),
                        for: UIControl.Event.editingChanged)
        return text1
    }()
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        i = false
        textField.backgroundColor = .white
    }
    
    private lazy var textField2: UITextField = {
       let text2 = UITextField()
        let padding: CGFloat = 10
        text2.textColor = .black
        text2.autocapitalizationType = .none
        text2.layer.borderColor = UIColor.lightGray.cgColor
        text2.layer.borderWidth = 0.5
        text2.layer.cornerRadius = 10
        text2.backgroundColor = .systemGray6
        text2.font = UIFont.systemFont(ofSize: 16)
        text2.translatesAutoresizingMaskIntoConstraints = false
        text2.isSecureTextEntry = true
        text2.addPadding(.both(10))
        text2.placeholder = "Password"
        text2.addTarget(self, action: #selector(textFieldDidChange2(_:)),
                        for: UIControl.Event.editingChanged)
        return text2
    }()
    
    private lazy var warningLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Слишком короткий пароль"
        label.isHidden = true
        return label
    } ()
    
    @objc func textFieldDidChange2(_ textField: UITextField) {
        j = false
        if textField2.text!.count < 5 {
            warningLabel.isHidden = false
        } else {
            warningLabel.isHidden = true
        }
        textField.backgroundColor = .white
    }
    
    private lazy var myButton: UIButton = {
        let image = UIImage(named: "blue_pixel.png")
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setBackgroundImage(image, for: UIControl.State.normal)
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = UIColor(named:"Color")
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        if button.isSelected {
            button.alpha = 0.8 }
        else if  button.isHighlighted {
            button.alpha = 0.8
        }
        else if !button.isEnabled {
            button.alpha = 0.8
        } else { button.alpha = 1
        }
        
        return button
    }()
    
    @objc func buttonTapped(sender: UIButton)
    {
        if myButton.isSelected {
            myButton.alpha = 0.8
        } else if myButton.isHighlighted {
            myButton.alpha = 0.8
        } else if !myButton.isEnabled {
            myButton.alpha = 0.8
        } else {
            myButton.alpha = 1
        }
        
        if textField1.text == "" {
            textField1.backgroundColor = .red
            i = true
        }
        if textField2.text == "" {
            textField2.backgroundColor = .red
            j = true
        }
        if textField2.text!.count < 5 && j == false {
            j = true
            warningLabel.isHidden = false
        }
        
        if i == false && j == false {
            if textField1.text == email && textField2.text == password {
                let profile = ProfileViewController()
                self.navigationController?.pushViewController(profile, animated: true)
            } else {
                let alert = UIAlertController (title: "Неверная комбинация логина и пароля", message: "", preferredStyle: .alert)
                let okButton = UIAlertAction (title: "OK", style: .default, handler: {action in print ("OK")} )
                alert.addAction(okButton)
                present (alert, animated: true, completion: nil)
            }
        }
     
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureSubviews()
        self.setupConstraints()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
       view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentOffset = CGPoint(x: 0, y: kbdSize.height * 0.1)
            scrollView.scrollIndicatorInsets = UIEdgeInsets(top:0, left:0, bottom: kbdSize.height, right: 0)
        }
    }

    @objc func keyboardWillHide(notification: NSNotification){
        scrollView.contentOffset = CGPoint.zero
    }

    
    private func configureSubviews () {
        self.navigationController?.navigationBar.isHidden = true
        self.view.addSubview(self.scrollView)
        scrollView.addSubview(vkLogoImage)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(textField1)
        stackView.addArrangedSubview(textField2)
        stackView.addArrangedSubview(warningLabel)
        stackView.addArrangedSubview(myButton)
    }

    private func setupConstraints() {
        let scrollViewTopConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let scrollViewRightConstraint = self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let scrollViewBottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let scrollViewLeftConstraint = self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor)

        let vkImageTopConstraint = self.vkLogoImage.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 120)
        vkImageTopConstraint.priority = .defaultLow
        let vkImageCenterXConstraint = self.vkLogoImage.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
        let vkImageHeightConstraint = self.vkLogoImage.heightAnchor.constraint(equalToConstant: 100)
        let vkImageWidthConstraint = self.vkLogoImage.widthAnchor.constraint(equalToConstant: 100)

        let stackViewCenterXConstraint = self.stackView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
        let stackViewCenterYConstraint = self.stackView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor)
        let stackViewLeadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 16)
        let stackViewTrailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -16)

        let text1HeightConstraint = self.textField1.heightAnchor.constraint(equalToConstant: 50)
        let text2HeightConstraint = self.textField2.heightAnchor.constraint(equalToConstant: 50)
        let text2TopConstraint = self.textField2.topAnchor.constraint(equalTo: self.textField1.bottomAnchor)
        let buttonHeightConstraint = self.myButton.heightAnchor.constraint(equalToConstant: 50)
        let text1TopConstraint = self.textField1.topAnchor.constraint(greaterThanOrEqualTo: vkLogoImage.bottomAnchor)

        let errorLabelHeightConstraint = self.warningLabel.heightAnchor.constraint(equalToConstant: 20)


        NSLayoutConstraint.activate([scrollViewTopConstraint, scrollViewLeftConstraint, scrollViewRightConstraint, scrollViewBottomConstraint, vkImageTopConstraint, vkImageCenterXConstraint, vkImageHeightConstraint, vkImageWidthConstraint,
            stackViewLeadingConstraint, stackViewTrailingConstraint, stackViewCenterXConstraint, stackViewCenterYConstraint, text1HeightConstraint, text2HeightConstraint, buttonHeightConstraint, text2TopConstraint, text1TopConstraint, errorLabelHeightConstraint
                                    ])

    }
}

