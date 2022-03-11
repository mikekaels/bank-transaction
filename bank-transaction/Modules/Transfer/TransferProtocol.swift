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
    
    func goToSelectReceiver(from: TransferVC)
    func transfer(receipientAccountNo: String, amount: Float, description: String)
    func goBack(from: TransferVC)
}

protocol TransferPresenterToRouterProtocol: AnyObject {
    func createModule() -> TransferVC
    func goToSelectReceiver(from: TransferVC)
    func goBack(from: TransferVC)
}

protocol TransferPresenterToViewProtocol: AnyObject {
    func didSuccessTransfer(data: Transfer)
    func didFailedTransfer(error: CustomError)
}

protocol TransferInteractorToPresenterProtocol: AnyObject {
    func didTransfer(result: Result<Transfer, CustomError>)
}

protocol TransferPresenterToInteractorProtocol: AnyObject {
    var presenter: TransferInteractorToPresenterProtocol? { get set }
    func transfer(receipientAccountNo: String, amount: Float, description: String)
}
