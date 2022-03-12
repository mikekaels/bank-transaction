//
//  Keychain.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 12/03/22.
//

import KeychainAccess

struct KeyChainStore {
    private static let keychain = Keychain(service: "com.mike.bank-transaction")
    
    /// insert data into keychain withKey
    static func insertKeyChain(withKey key: Key, token: String) {
        keychain[key.rawValue] = token
    }
    
    /// fetch data from keychain using key
    static func fetchKeyChain(withKey key: Key) -> String {
        return keychain[key.rawValue] ?? ""
    }
    
    /// add some key if needed
    enum Key: String {
        case token = "token"
    }
}
