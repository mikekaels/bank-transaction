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
}

extension LoginPresenter: LoginInteractorToPresenterProtocol {
    func didLogin(result: Result<LoginModel, CustomError>) {
        switch result {
        case .success(let login):
            view?.didSuccessLogin(data: login)
        case .failure(let error):
            view?.didFailedLogin(error: error)
        }
    }
}
