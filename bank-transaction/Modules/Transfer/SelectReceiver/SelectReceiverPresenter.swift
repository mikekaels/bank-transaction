//
//  SelectReceiverPresenter.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 12/03/22.

class SelectReceiverPresenter: SelectReceiverViewToPresenterProtocol {
    weak var view: SelectReceiverPresenterToViewProtocol?
    var router: SelectReceiverPresenterToRouterProtocol?
    var interactor: SelectReceiverPresenterToInteractorProtocol?
    
    func didSelectReceiver(data: Receiver, from: SelectReceiverVC) {
        from.delegate?.didSelectReceiver(data: data)
        router?.didSelectReceiver(from: from)
    }
}

extension SelectReceiverPresenter: SelectReceiverInteractorToPresenterProtocol {

}
