//
//  UserDefault.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 13/03/22.
//

import Foundation

public class UserDefaultsManager {

    public static let shared = UserDefaultsManager()

    public func isLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }

    public func setLoggedIn(with value: Bool) {
        UserDefaults.standard.set(value, forKey: "isLoggedIn")
    }
    
    func setUsername(with username: String) {
        UserDefaults.standard.set(username, forKey: "username")
    }
    
    func getUsername() -> String {
        return UserDefaults.standard.string(forKey: "username") ?? ""
    }
    
    func setAccountNumber(with accountNumber: String) {
        UserDefaults.standard.set(accountNumber, forKey: "accountNumber")
    }
    
    func getAccountNumber() -> String {
        return UserDefaults.standard.string(forKey: "accountNumber") ?? ""
    }
}

