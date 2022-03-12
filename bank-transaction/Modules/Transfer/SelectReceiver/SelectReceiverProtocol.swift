//
//  SelectReceiverProtocol.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 12/03/22.

public protocol SelectReceiverDelegate {
    func didSelectReceiver(data: Payee)
}

protocol SelectReceiverViewToPresenterProtocol: AnyObject {
    var view: SelectReceiverPresenterToViewProtocol? { get set }
    var interactor: SelectReceiverPresenterToInteractorProtocol? { get set }
    var router: SelectReceiverPresenterToRouterProtocol? { get set }
    
    func didSelectReceiver(data: Payee, from: SelectReceiverVC)
    func getPayees()
}

protocol SelectReceiverPresenterToRouterProtocol: AnyObject {
    func createModule() -> SelectReceiverVC
    func didSelectReceiver(from: SelectReceiverVC)
}

protocol SelectReceiverPresenterToViewProtocol: AnyObject {
    func didSuccessGetPayees(data: [Payee])
    func didFailedGetPayees(error: CustomError)
}

protocol SelectReceiverInteractorToPresenterProtocol: AnyObject {
    func didGetPayees(result: Result<PayeesResponse, CustomError>)
}

protocol SelectReceiverPresenterToInteractorProtocol: AnyObject {
    var presenter: SelectReceiverInteractorToPresenterProtocol? { get set }
    func getPayees()
}
