//
//  TabBarPresenter.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 10/03/22.

class TabBarPresenter: TabBarViewToPresenterProtocol {
    weak var view: TabBarPresenterToViewProtocol?
    var router: TabBarPresenterToRouterProtocol?
    var interactor: TabBarPresenterToInteractorProtocol?
    
    
}

extension TabBarPresenter: TabBarInteractorToPresenterProtocol {

}
