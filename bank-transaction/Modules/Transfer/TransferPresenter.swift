//
//  TransferPresenter.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

class TransferPresenter: TransferViewToPresenterProtocol {
    weak var view: TransferPresenterToViewProtocol?
    var router: TransferPresenterToRouterProtocol?
    var interactor: TransferPresenterToInteractorProtocol?
    
    
}

extension TransferPresenter: TransferInteractorToPresenterProtocol {

}
