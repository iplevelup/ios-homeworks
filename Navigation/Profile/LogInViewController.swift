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
    
    private let contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())
    
    private let vkLogoImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "logo")
        return view
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
    
    
    private let textField1: UITextField = {
        let text1 = UITextField()
        text1.translatesAutoresizingMaskIntoConstraints = false
        text1.backgroundColor = .systemGray6
        text1.textColor = .black
        text1.font = .systemFont(ofSize: 16)
        text1.autocapitalizationType = .none
        text1.placeholder = "Email or phone"
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
        text2.placeholder = "Password"
        text2.isSecureTextEntry = true
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
        return button
    }()
    
    
     override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        textField1.delegate = self
        textField2.delegate = self
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        nc.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    // Переводим HEX в UIColor
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
    
    private func layout() {

        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])

        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])

        [textField1, textField2].forEach { stackView.addArrangedSubview($0) }
        [vkLogoImage, stackView, myButton].forEach { contentView.addSubview($0) }

        NSLayoutConstraint.activate([
            vkLogoImage.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 100),
            vkLogoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            vkLogoImage.widthAnchor.constraint(equalToConstant: 100),
            vkLogoImage.heightAnchor.constraint(equalToConstant: 100),

            stackView.topAnchor.constraint(equalTo: vkLogoImage.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),

            myButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            myButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            myButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            myButton.heightAnchor.constraint(equalToConstant: 50),

            textField1.topAnchor.constraint(equalTo: stackView.topAnchor),
            textField1.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            textField1.heightAnchor.constraint(equalToConstant: 50),

            textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor),
            textField2.widthAnchor.constraint(equalTo: textField1.widthAnchor),
            textField2.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    func hideKeyboard() {
        textField1.resignFirstResponder()
        textField2.resignFirstResponder()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }

    @objc func buttonTapped() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc func adjustForKeyboard (notification: Notification){
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            let contentOffset: CGPoint = notification.name == UIResponder.keyboardWillHideNotification ? .zero : CGPoint(x: 0, y: keyboardHeight/2)
            self.scrollView.contentOffset = contentOffset
        }
    }
}
    
// MARK: UITextFieldDelegate
extension LogInViewController: UITextFieldDelegate {
}
