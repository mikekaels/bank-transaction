//
//  TransactionInteractor.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 13/03/22.

class TransactionInteractor: TransactionPresenterToInteractorProtocol {
    weak var presenter: TransactionInteractorToPresenterProtocol?
}
