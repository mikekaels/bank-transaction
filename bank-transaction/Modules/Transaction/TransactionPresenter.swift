//
//  TransactionPresenter.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 13/03/22.

class TransactionPresenter: TransactionViewToPresenterProtocol {
    weak var view: TransactionPresenterToViewProtocol?
    var router: TransactionPresenterToRouterProtocol?
    var interactor: TransactionPresenterToInteractorProtocol?
    
    
}

extension TransactionPresenter: TransactionInteractorToPresenterProtocol {

}
