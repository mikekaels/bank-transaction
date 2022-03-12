//
//  RegisterInteractor.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

class RegisterInteractor: RegisterPresenterToInteractorProtocol {
    weak var presenter: RegisterInteractorToPresenterProtocol?
}

extension RegisterInteractor {
    func register(username: String, password: String) {
        APIManager.shared.register(username: username, password: password) {[weak self] result in
            self?.presenter?.didRegister(result: result)
        }
    }
}
