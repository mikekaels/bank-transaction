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
    
    func goToTransfer(balance: Float, from: DashboardVC)
    func goToProfile(from: DashboardVC)
    func goToLogin(from: DashboardVC)
    func goToTransaction(data: [Transaction], from: DashboardVC)
    
    func getBalance()
    func getTransactions()
}

protocol DashboardPresenterToRouterProtocol: AnyObject {
    func createModule() -> DashboardVC
    func goToTransfer(balance: Float, from: DashboardVC)
    func goToProfile(from: DashboardVC)
    func goToLogin(from: DashboardVC)
    func goToTransaction(data: [Transaction], from: DashboardVC)
}

protocol DashboardPresenterToViewProtocol: AnyObject {
    func didSuccessGetBalance(data: Balance)
    func didFailedGetBalance(error: CustomError)
    
    func didSuccessGetTransaction(data: [Transaction])
    func didFailedGetTransaction(error: CustomError)
}

protocol DashboardInteractorToPresenterProtocol: AnyObject {
    func didGetBalance(result: Result<Balance, CustomError>)
    func didGetTransactions(result: Result<TransactionResponse, CustomError>)
}

protocol DashboardPresenterToInteractorProtocol: AnyObject {
    var presenter: DashboardInteractorToPresenterProtocol? { get set }
    func getBalance()
    func getTransactions()
}
