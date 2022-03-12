//
//  RegisterPresenter.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

class RegisterPresenter: RegisterViewToPresenterProtocol {
    weak var view: RegisterPresenterToViewProtocol?
    var router: RegisterPresenterToRouterProtocol?
    var interactor: RegisterPresenterToInteractorProtocol?
    
    func register(username: String, password: String) {
        interactor?.register(username: username, password: password)
    }
    
    func dismiss(from: RegisterVC) {
        router?.dismiss(from: from)
    }
}

extension RegisterPresenter: RegisterInteractorToPresenterProtocol {
    func didRegister(result: Result<AuthModel, CustomError>) {
        switch result {
        case .success(let data):
            view?.didSuccessRegister(data: data)
        case .failure(let err):
            view?.didFailedRegister(error: err)
        }
    }
}
