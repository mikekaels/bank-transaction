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
    
    func register(username: String, password: String)
    func dismiss(from: RegisterVC)
}

protocol RegisterPresenterToRouterProtocol: AnyObject {
    func createModule() -> RegisterVC
    func dismiss(from: RegisterVC)
}

protocol RegisterPresenterToViewProtocol: AnyObject {
    func didSuccessRegister(data: AuthModel)
    func didFailedRegister(error: CustomError)
}

protocol RegisterInteractorToPresenterProtocol: AnyObject {
    func didRegister(result: Result<AuthModel, CustomError>)
}

protocol RegisterPresenterToInteractorProtocol: AnyObject {
    var presenter: RegisterInteractorToPresenterProtocol? { get set }
    func register(username: String, password: String)

}
