//
//  TransactionProtocol.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 13/03/22.

public protocol TransactionDelegate {
    
}

protocol TransactionViewToPresenterProtocol: AnyObject {
    var view: TransactionPresenterToViewProtocol? { get set }
    var interactor: TransactionPresenterToInteractorProtocol? { get set }
    var router: TransactionPresenterToRouterProtocol? { get set }
}

protocol TransactionPresenterToRouterProtocol: AnyObject {
    func createModule() -> TransactionVC
}

protocol TransactionPresenterToViewProtocol: AnyObject {

}

protocol TransactionInteractorToPresenterProtocol: AnyObject {

}

protocol TransactionPresenterToInteractorProtocol: AnyObject {
    var presenter: TransactionInteractorToPresenterProtocol? { get set }

}
