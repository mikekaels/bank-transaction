//
//  TransferProtocol.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

public protocol TransferDelegate {
    
}

protocol TransferViewToPresenterProtocol: AnyObject {
    var view: TransferPresenterToViewProtocol? { get set }
    var interactor: TransferPresenterToInteractorProtocol? { get set }
    var router: TransferPresenterToRouterProtocol? { get set }
}

protocol TransferPresenterToRouterProtocol: AnyObject {
    func createModule() -> TransferVC
}

protocol TransferPresenterToViewProtocol: AnyObject {

}

protocol TransferInteractorToPresenterProtocol: AnyObject {

}

protocol TransferPresenterToInteractorProtocol: AnyObject {
    var presenter: TransferInteractorToPresenterProtocol? { get set }

}
