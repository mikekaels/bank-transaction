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
}
