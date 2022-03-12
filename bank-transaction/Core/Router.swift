//
//  Router.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 12/03/22.
//

import Foundation
import Alamofire

enum APIRouter {
    case login(username: String,
               password: String)
    case register(username: String,
                  password: String)
    case getBalance
    case getTransaction
    case getPayees
    case transfer(receipientAccountNo: String,
                  amount: Int,
                  description: String)
}

extension APIRouter: HttpRouter {
    
    var baseURL: String {
        switch self {
        default : return "https://green-thumb-64168.uc.r.appspot.com"
                       // https://green-thumb-64168.uc.r.appspot.com

        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login, .transfer, .register: return .post
        default: return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .getBalance, .getTransaction, .getPayees, .transfer:
            return [
                "Authorization": KeyChainStore.fetchKeyChain(withKey: .token)
            ]
        default:
            return nil
        }
        
    }
    
    var path: String {
        switch self {
        case .login: return "login"
        case .getBalance: return "balance"
        case .getTransaction: return "transactions"
        case .getPayees: return "payees"
        case .transfer: return "transfer"
        case .register: return "register"
        }
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .post: return JSONEncoding.default
        default: return URLEncoding.default
        }
    }
    
    var parameters: Parameters? {
        switch self {
        default :
            return nil
        }
    }
    
    var body: Parameters? {
        switch self {
        case .transfer(let receipientAccountNo, let amount, let description):
            return [
                "receipientAccountNo": receipientAccountNo,
                "amount": amount,
                "description": description
            ]
        case .login(let username, let password):
            return [
                "username":username,
                "password": password
            ]
        case .register(let username, let password):
            return [
                "username":username,
                "password": password
            ]
        default: return nil
        }
    }
    
}

protocol HttpRouter: URLRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var body: Parameters? { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
    
    func request(usingHttpService service: HttpService) throws -> DataRequest
}

extension HttpRouter {
    var parameter: Parameters? { return nil }

    func asURLRequest() throws -> URLRequest {

        var url =  try urlComponent().asURL()
        url.appendPathComponent(path)
        
        var request = try URLRequest(url: url, method: method, headers: headers)
        request = try URLEncoding.default.encode(request, with: body)
        return request
    }
    
    func urlComponent() throws -> URLComponents {
        var components = URLComponents(string: baseURL)!
        
        guard parameters != nil, let parameters = parameters else {
            return components
        }

        let items: [URLQueryItem] = parameters.map { (key, value) in
            return URLQueryItem(name: key, value: String(describing: value))
        }
        
        components.queryItems = items
        
        return components
    }
    
    func request(usingHttpService service: HttpService) throws -> DataRequest {
        return try service.request(asURLRequest())
    }
}
