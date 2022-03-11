//
//  TransferVC.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

import UIKit

class TransferVC: UIViewController {
    var presentor: TransferViewToPresenterProtocol?
    public var delegate: TransferDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Transfer"
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }

}

extension TransferVC: TransferPresenterToViewProtocol {
    
}
