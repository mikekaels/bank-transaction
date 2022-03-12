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
    private let httpService = Service()
    
    func login(username: String,
               password: String,
               completion: @escaping(Result<AuthModel, CustomError>) -> Void) {
        
        if !Connectivity.isConnectedToInternet {
            completion(.failure(.noInternetConnection))
        } else {
            do {
                try APIRouter
                    .login(username: username, password: password)
                    .request(usingHttpService: httpService)
                    .responseJSON { result in
                        guard [200, 201].contains(result.response?.statusCode), let data = result.data else { return }
                        do {
                            let result = try JSONDecoder().decode(AuthModel.self, from: data)
                            completion(.success(result))
                        } catch {
                            print(error)
                            completion(.failure(.failed))
                        }
                    }
                
            } catch {
                completion(.failure(error as! CustomError))
            }
        }
    }
    
    func register(username: String,
               password: String,
               completion: @escaping(Result<AuthModel, CustomError>) -> Void) {
        if !Connectivity.isConnectedToInternet {
            completion(.failure(.noInternetConnection))
        } else {
            do {
                try APIRouter
                    .register(username: username, password: password)
                    .request(usingHttpService: httpService)
                    .responseJSON { result in
                        guard [200, 201].contains(result.response?.statusCode), let data = result.data else { return }
                        do {
                            let result = try JSONDecoder().decode(AuthModel.self, from: data)
                            completion(.success(result))
                        } catch {
                            print(error)
                            completion(.failure(.failed))
                        }
                    }
                
            } catch {
                completion(.failure(error as! CustomError))
            }
        }
    }
    
    func getBalance(completion: @escaping(Result<Balance, CustomError>) -> Void) {
        if !Connectivity.isConnectedToInternet {
            completion(.failure(.noInternetConnection))
        } else {
            do {
                try APIRouter
                    .getBalance
                    .request(usingHttpService: httpService)
                    .responseJSON { result in
                        guard [200, 201].contains(result.response?.statusCode), let data = result.data else { return }
                        do {
                            let result = try JSONDecoder().decode(Balance.self, from: data)
                            print(result)
                            completion(.success(result))
                        } catch {
                            print(error)
                            completion(.failure(.failed))
                        }
                    }
                
            } catch {
                completion(.failure(error as! CustomError))
            }
        }
    }
    
    func transfer(receipientAccountNo: String,
               amount: Float,
               description: String,
               completion: @escaping(Result<Transfer, CustomError>) -> Void) {
        if !Connectivity.isConnectedToInternet {
            completion(.failure(.noInternetConnection))
        } else {
            do {
                try APIRouter
                    .transfer(receipientAccountNo: receipientAccountNo, amount: NSInteger(10), description: description)
                    .request(usingHttpService: httpService)
                    .responseJSON { result in
                        print("RESULT: ", result)
                        let body = NSString(data: (result.request?.httpBody)!, encoding: String.Encoding.utf8.rawValue)
                        print("request body: \(body)")
                        guard [200, 201].contains(result.response?.statusCode), let data = result.data else { return }
                        do {
                            let result = try JSONDecoder().decode(Transfer.self, from: data)
                            print(result)
                            completion(.success(result))
                        } catch {
                            completion(.failure(.failed))
                        }
                    }
                
            } catch {
                completion(.failure(error as! CustomError))
            }
        }
    }
    
    func getTransaction(completion: @escaping(Result<TransactionResponse, CustomError>) -> Void) {
        if !Connectivity.isConnectedToInternet {
            completion(.failure(.noInternetConnection))
        } else {
            do {
                try APIRouter
                    .getTransaction
                    .request(usingHttpService: httpService)
                    .responseJSON { result in
                        guard [200, 201].contains(result.response?.statusCode), let data = result.data else { return }
                        do {
                            let result = try JSONDecoder().decode(TransactionResponse.self, from: data)
                            completion(.success(result))
                        } catch {
                            print(error)
                            completion(.failure(.failed))
                        }
                    }
                
            } catch {
                completion(.failure(error as! CustomError))
            }
        }
    }
    
    func getPayees(completion: @escaping(Result<PayeesResponse, CustomError>) -> Void) {
        if !Connectivity.isConnectedToInternet {
            completion(.failure(.noInternetConnection))
        } else {
            do {
                try APIRouter
                    .getPayees
                    .request(usingHttpService: httpService)
                    .responseJSON { result in
                        guard [200, 201].contains(result.response?.statusCode), let data = result.data else { return }
                        do {
                            let result = try JSONDecoder().decode(PayeesResponse.self, from: data)
                            completion(.success(result))
                        } catch {
                            print(error)
                            completion(.failure(.failed))
                        }
                    }
                
            } catch {
                completion(.failure(error as! CustomError))
            }
        }
    }
}
