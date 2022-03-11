//
//  DashboardPresenter.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 10/03/22.

class DashboardPresenter: DashboardViewToPresenterProtocol {
    weak var view: DashboardPresenterToViewProtocol?
    var router: DashboardPresenterToRouterProtocol?
    var interactor: DashboardPresenterToInteractorProtocol?
    
    func goToTransfer(from: DashboardVC) {
        router?.goToTransfer(from: from)
    }
    
    func goToProfile(from: DashboardVC) {
        router?.goToProfile(from: from)
    }
    
    func goToLogin(from: DashboardVC) {
        router?.goToLogin(from: from)
    }
}

extension DashboardPresenter: DashboardInteractorToPresenterProtocol {

}
