//
//  RegisterVC.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

import UIKit

class RegisterVC: UIViewController {
    var presentor: RegisterViewToPresenterProtocol?
    public var delegate: RegisterDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        // Do any additional setup after loading the view.
    }

}

extension RegisterVC: RegisterPresenterToViewProtocol {
    
}
