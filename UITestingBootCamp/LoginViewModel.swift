//
//  LoginViewModel.swift
//  UITestingBootCamp
//
//  Created by HariKrishna Panicker on 23/08/25.
//

import Foundation

class LoginViewModel {
    
    func isValidUsername(_ username: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: username)
    }
}
