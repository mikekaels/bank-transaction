//
//  RegisterProtocol.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

public protocol RegisterDelegate {
    
}

protocol RegisterViewToPresenterProtocol: AnyObject {
    var view: RegisterPresenterToViewProtocol? { get set }
    var interactor: RegisterPresenterToInteractorProtocol? { get set }
    var router: RegisterPresenterToRouterProtocol? { get set }
}

protocol RegisterPresenterToRouterProtocol: AnyObject {
    func createModule() -> RegisterVC
}

protocol RegisterPresenterToViewProtocol: AnyObject {

}

protocol RegisterInteractorToPresenterProtocol: AnyObject {

}

protocol RegisterPresenterToInteractorProtocol: AnyObject {
    var presenter: RegisterInteractorToPresenterProtocol? { get set }

}
