//
//  Login.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.
//

import Foundation

struct AuthModel: Codable {
    let status, token, username, accountNo: String?
}
