//
//  DashboardInteractor.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 10/03/22.

class DashboardInteractor: DashboardPresenterToInteractorProtocol {
    weak var presenter: DashboardInteractorToPresenterProtocol?
}

extension DashboardInteractor {
    func getBalance() {
        APIManager.shared.getBalance {[weak self] result in
            self?.presenter?.didGetBalance(result: result)
        }
    }
    
    func getTransactions() {
        APIManager.shared.getTransaction {[weak self] result in
            self?.presenter?.didGetTransactions(result: result)
        }
    }
}
