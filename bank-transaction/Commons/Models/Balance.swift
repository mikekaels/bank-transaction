//
//  Balance.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 13/03/22.
//

import Foundation

struct Balance: Codable {
    let status, accountNo: String?
    let balance: Float?
}
