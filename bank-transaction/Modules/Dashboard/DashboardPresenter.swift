//
//  DashboardPresenter.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 10/03/22.

class DashboardPresenter: DashboardViewToPresenterProtocol {

    weak var view: DashboardPresenterToViewProtocol?
    var router: DashboardPresenterToRouterProtocol?
    var interactor: DashboardPresenterToInteractorProtocol?
    
    func goToTransfer(balance: Float, from: DashboardVC) {
        router?.goToTransfer(balance: balance, from: from)
    }
    
    func goToProfile(from: DashboardVC) {
        router?.goToProfile(from: from)
    }
    
    func goToLogin(from: DashboardVC) {
        router?.goToLogin(from: from)
    }
    
    func getBalance() {
        interactor?.getBalance()
    }
    
    func getTransactions() {
        interactor?.getTransactions()
    }
}

extension DashboardPresenter: DashboardInteractorToPresenterProtocol {
    
    func didGetTransactions(result: Result<TransactionResponse, CustomError>) {
        switch result {
        case .success(let data):
            view?.didSuccessGetTransaction(data: data.data ?? [])
        case .failure(let err):
            view?.didFailedGetTransaction(error: err)
        }
    }
    
    func didGetBalance(result: Result<Balance, CustomError>) {
        switch result {
        case .success(let data):
            view?.didSuccessGetBalance(data: data)
        case .failure(let err):
            view?.didFailedGetBalance(error: err)
        }
    }
}
