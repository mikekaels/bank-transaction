//
//  ProfilePresenter.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

class ProfilePresenter: ProfileViewToPresenterProtocol {
    weak var view: ProfilePresenterToViewProtocol?
    var router: ProfilePresenterToRouterProtocol?
    var interactor: ProfilePresenterToInteractorProtocol?
    
    func dismiss(from: ProfileVC) {
        router?.dismiss(from: from)
    }
}

extension ProfilePresenter: ProfileInteractorToPresenterProtocol {

}
