//
//  LoginVC.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

import UIKit
import Kingfisher

class LoginVC: UIViewController {
    var presentor: LoginViewToPresenterProtocol?
    public var delegate: LoginDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        setupUI()
    }
    
    //MARK: - PROPERTIES
    var password: String = ""
    var username: String = ""
    
    let ivLogo = UIImageView()
        .configure { v in
            v.contentMode = .scaleAspectFill
            v.kf.setImage(with: URL(string: "https://cdn.freebiesupply.com/logos/large/2x/ocbc-bank-logo-png-transparent.png"))
        }
    
    let tfUsername = CustomTextfield(label: "Username", type: .username)
        .configure { v in
            
        }
    
    let tfPassword = CustomTextfield(label: "Password", type: .password)
        .configure { v in
            
        }
    
    let btnLogin = CustomButton()
        .configure { v in
            v.setTitle("Login", for: .normal)
            v.backgroundColor = Colors.accent1
            v.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        }
    
    @objc func loginTapped() {
        guard let username = tfUsername.texfield.text else { return }
        guard let password = tfPassword.texfield.text else { return }
        presentor?.login(username: username, password: password)
    }
}


extension LoginVC: LoginPresenterToViewProtocol {
    func didSuccessLogin(data: LoginModel) {
        print("here")
        presentor?.goToDashboard(from: self)
    }
    
    func didFailedLogin(error: CustomError) {
        
    }
    
    
}

extension LoginVC {
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(ivLogo)
        ivLogo.snp.makeConstraints { make in
            make.width.height.equalTo(250)
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(100)
        }
        
        view.addSubview(tfUsername)
        tfUsername.snp.makeConstraints { make in
            make.top.equalTo(ivLogo.snp_bottomMargin).offset(30)
            make.leading.trailing.equalTo(view).offset(50).inset(50)
        }
        
        view.addSubview(tfPassword)
        tfPassword.snp.makeConstraints { make in
            make.top.equalTo(tfUsername.snp_bottomMargin).offset(10)
            make.leading.trailing.equalTo(view).offset(50).inset(50)
        }
        
        view.addSubview(btnLogin)
        btnLogin.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).offset(36).inset(36)
            make.bottom.equalTo(view).inset(50)
        }
    }
}
