//
//  ProfileRouter.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

import UIKit

public class ProfileRouter: ProfilePresenterToRouterProtocol{
    public static let shared = ProfileRouter()
    
    func initialize() -> ProfileVC {
        return createModule()
    }
    
    func createModule() -> ProfileVC {
        let view = ProfileVC()
        
        let presenter: ProfileViewToPresenterProtocol & ProfileInteractorToPresenterProtocol = ProfilePresenter()
        
        let interactor: ProfilePresenterToInteractorProtocol = ProfileInteractor()
        
        let router: ProfilePresenterToRouterProtocol = ProfileRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
    
    func dismiss(from: ProfileVC) {
        from.dismiss(animated: true) {
            from.delegate?.logout()
        }
    }
}
