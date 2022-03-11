//
//  TransferRouter.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

import UIKit

public class TransferRouter: TransferPresenterToRouterProtocol{
    public static let shared = TransferRouter()
    
    func initialize() -> TransferVC {
        return createModule()
    }
    
    func createModule() -> TransferVC {
        let view = TransferVC()
        
        let presenter: TransferViewToPresenterProtocol & TransferInteractorToPresenterProtocol = TransferPresenter()
        
        let interactor: TransferPresenterToInteractorProtocol = TransferInteractor()
        
        let router: TransferPresenterToRouterProtocol = TransferRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
    
    func goToSelectReceiver(from: TransferVC) {
        let vc = SelectReceiverRouter.shared.createModule()
        vc.delegate = from
        print("here")
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goBack(from: TransferVC) {
        from.navigationController?.popViewController(animated: true)
    }
}
