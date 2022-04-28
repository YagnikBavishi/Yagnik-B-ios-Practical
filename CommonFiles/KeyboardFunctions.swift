//
//  KeyboardFunctions.swift
//  iOSPracticals
//
//  Created by Yagnik Bavishi on 26/04/22.
//

import UIKit.UIViewController

// MARK: - UIViewController
extension UIViewController {
    
    func hideKeyboardWhenTapAround () {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

} // End of Extension
