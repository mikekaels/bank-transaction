//
//  LoginRouter.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

import UIKit

public class LoginRouter: LoginPresenterToRouterProtocol{
    public static let shared = LoginRouter()
    
    func initialize() -> LoginVC {
        return createModule()
    }
    
    func createModule() -> LoginVC {
        let view = LoginVC()
        
        let presenter: LoginViewToPresenterProtocol & LoginInteractorToPresenterProtocol = LoginPresenter()
        
        let interactor: LoginPresenterToInteractorProtocol = LoginInteractor()
        
        let router: LoginPresenterToRouterProtocol = LoginRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
    
    func goToDashboard(from: LoginVC) {
        let vc = TabBarRouter.shared.createModule()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        from.present(vc, animated: true, completion: nil)
    }
}
