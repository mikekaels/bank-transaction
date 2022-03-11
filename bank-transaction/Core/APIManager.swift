//
//  APIManager.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.
//

import Foundation

enum CustomError: Error {
    case noInternetConnection
    case failed
}

class APIManager {
    static let shared = APIManager()
//    private let httpService = Service()
    
    func login(username: String,
               password: String,
               completion: @escaping(Result<LoginModel, CustomError>) -> Void) {
        completion(.success(LoginModel(status: nil, token: nil, username: nil, accountNo: nil)))
    }
    
    func transfer(receipientAccountNo: String,
               amount: Float,
               description: String,
               completion: @escaping(Result<Transfer, CustomError>) -> Void) {
        completion(.success(Transfer(status: nil, transactionID: nil, amount: nil, receiverDescription: nil, recipientAccount: nil)))
    }
}
