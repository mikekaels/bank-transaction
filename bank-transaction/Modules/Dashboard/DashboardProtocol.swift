//
//  DashboardProtocol.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 10/03/22.

public protocol DashboardDelegate {
    
}

protocol DashboardViewToPresenterProtocol: AnyObject {
    var view: DashboardPresenterToViewProtocol? { get set }
    var interactor: DashboardPresenterToInteractorProtocol? { get set }
    var router: DashboardPresenterToRouterProtocol? { get set }
    
    func goToTransfer(from: DashboardVC)
    func goToProfile(from: DashboardVC)
    func goToLogin(from: DashboardVC)
}

protocol DashboardPresenterToRouterProtocol: AnyObject {
    func createModule() -> DashboardVC
    func goToTransfer(from: DashboardVC)
    func goToProfile(from: DashboardVC)
    func goToLogin(from: DashboardVC)
}

protocol DashboardPresenterToViewProtocol: AnyObject {

}

protocol DashboardInteractorToPresenterProtocol: AnyObject {

}

protocol DashboardPresenterToInteractorProtocol: AnyObject {
    var presenter: DashboardInteractorToPresenterProtocol? { get set }

}
