//
//  TransferPresenter.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

class TransferPresenter: TransferViewToPresenterProtocol {
    
    
    weak var view: TransferPresenterToViewProtocol?
    var router: TransferPresenterToRouterProtocol?
    var interactor: TransferPresenterToInteractorProtocol?
    
    func goToSelectReceiver(from: TransferVC) {
        router?.goToSelectReceiver(from: from)
    }
    
    func goBack(from: TransferVC) {
        router?.goBack(from: from)
    }
    
    func transfer(receipientAccountNo: String, amount: Float, description: String) {
        interactor?.transfer(receipientAccountNo: receipientAccountNo, amount: amount, description: description)
    }
    
}

extension TransferPresenter: TransferInteractorToPresenterProtocol {
    func didTransfer(result: Result<Transfer, CustomError>) {
        switch result {
        case .success(let data):
            view?.didSuccessTransfer(data: data)
        case .failure(let error):
            view?.didFailedTransfer(error: error)
        }
    }
}
