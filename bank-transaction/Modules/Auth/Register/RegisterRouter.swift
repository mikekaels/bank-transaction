//
//  RegisterRouter.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

import UIKit

public class RegisterRouter: RegisterPresenterToRouterProtocol{
    public static let shared = RegisterRouter()
    
    func initialize() -> RegisterVC {
        return createModule()
    }
    
    func createModule() -> RegisterVC {
        let view = RegisterVC()
        
        let presenter: RegisterViewToPresenterProtocol & RegisterInteractorToPresenterProtocol = RegisterPresenter()
        
        let interactor: RegisterPresenterToInteractorProtocol = RegisterInteractor()
        
        let router: RegisterPresenterToRouterProtocol = RegisterRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
    
    func dismiss(from: RegisterVC) {
        from.navigationController?.popViewController(animated: true)
    }
}
