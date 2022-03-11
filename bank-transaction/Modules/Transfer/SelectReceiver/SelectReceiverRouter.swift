//
//  SelectReceiverRouter.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 12/03/22.

import UIKit

public class SelectReceiverRouter: SelectReceiverPresenterToRouterProtocol{
    public static let shared = SelectReceiverRouter()
    
    func initialize() -> SelectReceiverVC {
        return createModule()
    }
    
    func createModule() -> SelectReceiverVC {
        let view = SelectReceiverVC()
        
        let presenter: SelectReceiverViewToPresenterProtocol & SelectReceiverInteractorToPresenterProtocol = SelectReceiverPresenter()
        
        let interactor: SelectReceiverPresenterToInteractorProtocol = SelectReceiverInteractor()
        
        let router: SelectReceiverPresenterToRouterProtocol = SelectReceiverRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
    
    func didSelectReceiver(from: SelectReceiverVC) {
        from.navigationController?.popViewController(animated: true)
    }
}
