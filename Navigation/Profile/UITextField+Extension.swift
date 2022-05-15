//
//  UIView+Extension.swift
//  Navigation
//
//  Created by sv on 15.05.2022.
//

import UIKit

extension UITextField {
    func paddingLeft(inset: CGFloat){
        self.leftView = UIView(frame: CGRect(x: 10, y: 0, width: inset, height: self.frame.height))
        self.leftViewMode = UITextField.ViewMode.always
    }
}
