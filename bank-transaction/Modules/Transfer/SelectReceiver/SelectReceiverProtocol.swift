//
//  SelectReceiverProtocol.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 12/03/22.

public protocol SelectReceiverDelegate {
    func didSelectReceiver(data: Receiver)
}

protocol SelectReceiverViewToPresenterProtocol: AnyObject {
    var view: SelectReceiverPresenterToViewProtocol? { get set }
    var interactor: SelectReceiverPresenterToInteractorProtocol? { get set }
    var router: SelectReceiverPresenterToRouterProtocol? { get set }
    
    func didSelectReceiver(data: Receiver, from: SelectReceiverVC)
}

protocol SelectReceiverPresenterToRouterProtocol: AnyObject {
    func createModule() -> SelectReceiverVC
    func didSelectReceiver(from: SelectReceiverVC)
}

protocol SelectReceiverPresenterToViewProtocol: AnyObject {

}

protocol SelectReceiverInteractorToPresenterProtocol: AnyObject {

}

protocol SelectReceiverPresenterToInteractorProtocol: AnyObject {
    var presenter: SelectReceiverInteractorToPresenterProtocol? { get set }

}
