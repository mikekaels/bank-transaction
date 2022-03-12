//
//  LoginPresenter.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

class LoginPresenter: LoginViewToPresenterProtocol {
    
    
    weak var view: LoginPresenterToViewProtocol?
    var router: LoginPresenterToRouterProtocol?
    var interactor: LoginPresenterToInteractorProtocol?
    
    func login(username: String, password: String) {
        interactor?.login(username: username, password: password)
    }
    
    func goToDashboard(from: LoginVC) {
        router?.goToDashboard(from: from)
    }
    
    func goToRegister(from: LoginVC) {
        router?.goToRegister(from: from)
    }
    
    func checkTextfield(text: String) -> (isValid: Bool?, text: String?) {
        if text.count == 0 {
            return (false, "")
        } else {
            return (true, text)
        }
    }
}

extension LoginPresenter: LoginInteractorToPresenterProtocol {
    func didLogin(result: Result<AuthModel, CustomError>) {
        switch result {
        case .success(let data):
            KeyChainStore.insertKeyChain(withKey: .token, token: data.token ?? "")
            UserDefaultsManager.shared.setUsername(with: data.username ?? "")
            UserDefaultsManager.shared.setAccountNumber(with: data.accountNo ?? "")
            UserDefaultsManager.shared.setLoggedIn(with: true)
            view?.didSuccessLogin(data: data)
        case .failure(let error):
            view?.didFailedLogin(error: error)
        }
    }
}
