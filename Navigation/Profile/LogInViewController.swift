//
//  LogInViewController.swift
//  Navigation
//
//  Created by sv on 13.05.2022.
//


import UIKit

class LogInViewController: UIViewController {

    private let ColorSet: String = "#4885CC"
    
    private let nc = NotificationCenter.default
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.clipsToBounds = true
        stackView.backgroundColor = .systemGray6
        stackView.distribution = .fillProportionally
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    private let vkLogoImage: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "logo")
        return view
    }()
    
    private let textField1: UITextField = {
        let text1 = UITextField()
        text1.translatesAutoresizingMaskIntoConstraints = false
        text1.backgroundColor = .systemGray6
        text1.textColor = .black
        text1.font = .systemFont(ofSize: 16)
        text1.autocapitalizationType = .none
        text1.placeholder = "Password"
        text1.isSecureTextEntry = true
        text1.layer.borderColor = UIColor.lightGray.cgColor
        text1.layer.borderWidth = 0.5
        text1.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text1.frame.height))
        text1.leftViewMode = .always
        return text1
    }()
    
    
    private let textField2: UITextField = {
        let text2 = UITextField()
        text2.translatesAutoresizingMaskIntoConstraints = false
        text2.backgroundColor = .systemGray6
        text2.textColor = .black
        text2.font = .systemFont(ofSize: 16)
        text2.autocapitalizationType = .none
        text2.placeholder = "Email or phone"
        text2.layer.borderColor = UIColor.lightGray.cgColor
        text2.layer.borderWidth = 0.5
        text2.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text2.frame.height))
        text2.leftViewMode = .always
        return text2
    }()
    
    private lazy var myButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = hexStringToUIColor(hex: ColorSet)
        button.layer.cornerRadius = 10
        button.setTitle("Log in", for: .normal)
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
    
    @objc func buttonTapped(sender: UIButton){
         if myButton.isSelected {
             myButton.alpha = 0.8
         } else if myButton.isHighlighted {
             myButton.alpha = 0.8
         } else if !myButton.isEnabled {
             myButton.alpha = 0.8
         } else {
             myButton.alpha = 1
         }

         let profile = ProfileViewController()
         self.navigationController?.pushViewController(profile, animated: true)
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
        navigationController?.setNavigationBarHidden(true, animated: animated)
        nc.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        nc.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func adjustForKeyboard (notification: Notification){
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            let contentOffset: CGPoint = notification.name == UIResponder.keyboardWillHideNotification ? .zero : CGPoint(x: 0, y: keyboardHeight/2)
            self.scrollView.contentOffset = contentOffset
        }
    }

    private func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
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
         stackView.addArrangedSubview(myButton)
     }

     private func setupConstraints() {
         let scrollViewTopConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
         let scrollViewRightConstraint = self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
         let scrollViewBottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
         let scrollViewLeftConstraint = self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor)

         let vkImageTopConstraint = self.vkLogoImage.topAnchor.constraint(equalTo: self.stackView.topAnchor, constant: -70)
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
         let buttonHeightConstraint2 = self.myButton.topAnchor.constraint(equalTo: vkLogoImage.bottomAnchor, constant: 116)
         let text1TopConstraint = self.textField1.topAnchor.constraint(greaterThanOrEqualTo: vkLogoImage.bottomAnchor)


         NSLayoutConstraint.activate([scrollViewTopConstraint, scrollViewLeftConstraint, scrollViewRightConstraint, scrollViewBottomConstraint, vkImageTopConstraint, vkImageCenterXConstraint, vkImageHeightConstraint, vkImageWidthConstraint,
             stackViewLeadingConstraint, stackViewTrailingConstraint, stackViewCenterXConstraint, stackViewCenterYConstraint, text1HeightConstraint, text2HeightConstraint, buttonHeightConstraint,buttonHeightConstraint2, text2TopConstraint, text1TopConstraint
                                     ])
     }
 }

// MARK: UITextFieldDelegate
extension LogInViewController: UITextFieldDelegate {
}
