//
//  SelectReceiverPresenter.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 12/03/22.

class SelectReceiverPresenter: SelectReceiverViewToPresenterProtocol {
    
    weak var view: SelectReceiverPresenterToViewProtocol?
    var router: SelectReceiverPresenterToRouterProtocol?
    var interactor: SelectReceiverPresenterToInteractorProtocol?
    
    func didSelectReceiver(data: Payee, from: SelectReceiverVC) {
        from.delegate?.didSelectReceiver(data: data)
        router?.didSelectReceiver(from: from)
    }
    
    func getPayees() {
        interactor?.getPayees()
    }
}

extension SelectReceiverPresenter: SelectReceiverInteractorToPresenterProtocol {
    func didGetPayees(result: Result<PayeesResponse, CustomError>) {
        switch result {
        case .success(let data):
            view?.didSuccessGetPayees(data: data.data ?? [])
        case .failure(let err):
            view?.didFailedGetPayees(error: err)
        }
    }
}
