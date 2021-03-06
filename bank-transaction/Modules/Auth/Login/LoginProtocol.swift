//
//  LoginProtocol.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

public protocol LoginDelegate {
    
}

protocol LoginViewToPresenterProtocol: AnyObject {
    var view: LoginPresenterToViewProtocol? { get set }
    var interactor: LoginPresenterToInteractorProtocol? { get set }
    var router: LoginPresenterToRouterProtocol? { get set }
    
    func login(username: String, password: String)
    func goToDashboard(from: LoginVC)
    func goToRegister(from: LoginVC)
    
    
    func checkTextfield(text: String) -> (isValid: Bool?, text: String?)
}

protocol LoginPresenterToRouterProtocol: AnyObject {
    func createModule() -> LoginVC
    func goToDashboard(from: LoginVC)
    func goToRegister(from: LoginVC)
}

protocol LoginPresenterToViewProtocol: AnyObject {
    func didSuccessLogin(data: AuthModel)
    func didFailedLogin(error: CustomError)
}

protocol LoginInteractorToPresenterProtocol: AnyObject {
    func didLogin(result: Result<AuthModel, CustomError>)
}

protocol LoginPresenterToInteractorProtocol: AnyObject {
    var presenter: LoginInteractorToPresenterProtocol? { get set }
    func login(username: String, password: String)
}
