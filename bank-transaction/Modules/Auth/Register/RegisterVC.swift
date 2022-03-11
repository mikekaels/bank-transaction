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
        setupUI()
    }
    
    deinit {
        print("Login VC has been dealocated")
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
    
    let tfConfirmPassword = CustomTextfield(label: "Confirm Password", type: .password)
        .configure { v in
            
        }
    
    let btnRegister = CustomButton()
        .configure { v in
            v.setTitle("Register", for: .normal)
            v.backgroundColor = Colors.accent1
            v.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        }
    
    @objc func loginTapped() {
        guard let username = tfUsername.texfield.text else { return }
        guard let password = tfPassword.texfield.text else { return }
//        presentor?.login(username: username, password: password)
    }
    
    @objc func registerTapped() {
//        presentor?.goToRegister(from: self)
    }

}

extension RegisterVC: RegisterPresenterToViewProtocol {
    
}

extension RegisterVC {
    func setupUI() {
        view.backgroundColor = .white
        
        view.backgroundColor = .white
        
        view.addSubview(ivLogo)
        ivLogo.snp.makeConstraints { make in
            make.width.height.equalTo(250)
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(50)
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
        
        view.addSubview(tfConfirmPassword)
        tfConfirmPassword.snp.makeConstraints { make in
            make.top.equalTo(tfPassword.snp_bottomMargin).offset(10)
            make.leading.trailing.equalTo(view).offset(50).inset(50)
        }
        
        view.addSubview(btnRegister)
        btnRegister.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).offset(36).inset(36)
            make.bottom.equalTo(view).inset(100)
        }
        
        
    }
}

