//
//  TransferInteractor.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

class TransferInteractor: TransferPresenterToInteractorProtocol {
    weak var presenter: TransferInteractorToPresenterProtocol?
}

extension TransferInteractor {
    func transfer(receipientAccountNo: String, amount: Float, description: String) {
        APIManager.shared.transfer(receipientAccountNo: receipientAccountNo,
                                   amount: amount,
                                   description: description) { [weak self] result in
            self?.presenter?.didTransfer(result: result)
        }
    }
}
