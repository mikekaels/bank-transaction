//
//  RegisterPresenter.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

class RegisterPresenter: RegisterViewToPresenterProtocol {
    weak var view: RegisterPresenterToViewProtocol?
    var router: RegisterPresenterToRouterProtocol?
    var interactor: RegisterPresenterToInteractorProtocol?
    
    
}

extension RegisterPresenter: RegisterInteractorToPresenterProtocol {

}
