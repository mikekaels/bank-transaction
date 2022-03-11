//
//  LoginInteractor.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

class LoginInteractor: LoginPresenterToInteractorProtocol {
    weak var presenter: LoginInteractorToPresenterProtocol?
}

extension LoginInteractor {
    func login(username: String, password: String) {
        APIManager.shared.login(username: username, password: password) { [weak self] result in
            self?.presenter?.didLogin(result: result)
        }
    }
}
