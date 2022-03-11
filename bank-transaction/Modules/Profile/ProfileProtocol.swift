//
//  ProfileProtocol.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

public protocol ProfileDelegate {
    func logout()
}

protocol ProfileViewToPresenterProtocol: AnyObject {
    var view: ProfilePresenterToViewProtocol? { get set }
    var interactor: ProfilePresenterToInteractorProtocol? { get set }
    var router: ProfilePresenterToRouterProtocol? { get set }
    
    func dismiss(from: ProfileVC)
}

protocol ProfilePresenterToRouterProtocol: AnyObject {
    func createModule() -> ProfileVC
    func dismiss(from: ProfileVC)
}

protocol ProfilePresenterToViewProtocol: AnyObject {

}

protocol ProfileInteractorToPresenterProtocol: AnyObject {

}

protocol ProfilePresenterToInteractorProtocol: AnyObject {
    var presenter: ProfileInteractorToPresenterProtocol? { get set }

}
