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
        clearAll()
        router?.dismiss(from: from)
    }
    
    func clearAll() {
        KeyChainStore.insertKeyChain(withKey: .token, token: "")
        UserDefaultsManager.shared.setUsername(with: "")
        UserDefaultsManager.shared.setAccountNumber(with: "")
        UserDefaultsManager.shared.setLoggedIn(with: false)
    }
}

extension ProfilePresenter: ProfileInteractorToPresenterProtocol {
    
}
