//
//  TransactionVC.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 13/03/22.

import UIKit
import SnapKit

class TransactionVC: UIViewController {

    
    var presentor: TransactionViewToPresenterProtocol?
    public var delegate: TransactionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.tabBarController?.tabBar.isHidden = true
    }
    
    let transactionTableView = TransactionTableViewController(items: [], configure: { (cell: SubtitleAndIconCell, item: Transaction) in
        cell.lItem.text = item.receipient?.accountHolder
        cell.lPrice.text = "SGD \(String(describing: item.amount!.description))"
        cell.lAccount.text = item.receipient?.accountNo
    }) { (item) in
        print(item)
    }.configure { v in
        v.tableView.showsVerticalScrollIndicator = false
        v.tableView.showsVerticalScrollIndicator = false
        
    }

}

extension TransactionVC: TransactionPresenterToViewProtocol {
    
}

extension TransactionVC {
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(transactionTableView.view)
        transactionTableView.view.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalTo(view).offset(15).inset(15)
            
        }
    }
}
