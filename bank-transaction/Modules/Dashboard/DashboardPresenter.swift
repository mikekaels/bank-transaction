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
}

extension DashboardPresenter: DashboardInteractorToPresenterProtocol {

}
