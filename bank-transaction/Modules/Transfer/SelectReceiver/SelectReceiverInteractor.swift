//
//  SelectReceiverInteractor.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 12/03/22.

class SelectReceiverInteractor: SelectReceiverPresenterToInteractorProtocol {
    weak var presenter: SelectReceiverInteractorToPresenterProtocol?
}

extension SelectReceiverInteractor {
    func getPayees() {
        APIManager.shared.getPayees { [weak self] result in
            self?.presenter?.didGetPayees(result: result)
        }
    }
}
