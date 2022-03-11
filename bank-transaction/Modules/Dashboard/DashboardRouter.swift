//
//  DashboardRouter.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 10/03/22.

import UIKit

public class DashboardRouter: DashboardPresenterToRouterProtocol{
    public static let shared = DashboardRouter()
    
    func initialize() -> DashboardVC {
        return createModule()
    }
    
    func createModule() -> DashboardVC {
        let view = DashboardVC()
        
        let presenter: DashboardViewToPresenterProtocol & DashboardInteractorToPresenterProtocol = DashboardPresenter()
        
        let interactor: DashboardPresenterToInteractorProtocol = DashboardInteractor()
        
        let router: DashboardPresenterToRouterProtocol = DashboardRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
    
    func goToTransfer(from: DashboardVC) {
        let vc = TransferRouter.shared.createModule()
        from.navigationController?.pushViewController(vc, animated: true)
    }
}
