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
    
    deinit {
        print("Login VC has been dealocated")
    }
    
//MARK: - PROPERTIES
    let ivLogo = UIImageView()
        .configure { v in
            v.contentMode = .scaleAspectFill
            v.kf.setImage(with: URL(string: "https://cdn.freebiesupply.com/logos/large/2x/ocbc-bank-logo-png-transparent.png"))
        }
    
    let tfUsername = CustomTextfield(label: "Username", type: .username)

    let tfPassword = CustomTextfield(label: "Password", type: .password)
    
    let btnRegister = UIButton()
        .configure { v in
            v.setTitle("Register", for: .normal)
            v.setTitleColor(Colors.accent1, for: .normal)
            v.backgroundColor = .clear
            v.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        }
    
    let btnLogin = CustomButton()
        .configure { v in
            v.setTitle("Login", for: .normal)
            v.backgroundColor = Colors.accent1
            v.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        }
    
//MARK: - Function
    @objc func loginTapped() {
        let username = validatorUsername()
        let password = validatorPassword()
        
        if username.isValid && password.isValid {
            presentor?.login(username: username.text, password: password.text)
        }
    }
    
    @objc func registerTapped() {
        presentor?.goToRegister(from: self)
    }
}

//MARK: - Delegate
extension LoginVC: LoginPresenterToViewProtocol {
    func didSuccessLogin(data: AuthModel) {
        presentor?.goToDashboard(from: self)
    }
    
    func didFailedLogin(error: CustomError) {
        
    }
}
//MARK: - View
extension LoginVC {
    func setupUI() {
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
            make.leading.trailing.equalTo(view).offset(36).inset(36)
        }
        
        view.addSubview(tfPassword)
        tfPassword.snp.makeConstraints { make in
            make.top.equalTo(tfUsername.snp_bottomMargin).offset(10)
            make.leading.trailing.equalTo(view).offset(36).inset(36)
        }
        
        view.addSubview(btnRegister)
        btnRegister.snp.makeConstraints { make in
            make.bottom.equalTo(view).inset(50)
            make.leading.trailing.equalTo(view).offset(36).inset(36)
        }
        
        view.addSubview(btnLogin)
        btnLogin.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).offset(36).inset(36)
            make.bottom.equalTo(btnRegister).inset(50)
        }
        
        
    }
}

//MARK: - VALIDATORS
extension LoginVC {
    func validatorUsername() -> (isValid: Bool, text: String) {
        if let username = tfUsername.texfield.text {
            if username.count == 0 {
                self.tfUsername.setError(message: "Username required")
                return (false, "")
            } else {
                self.tfUsername.clearError()
                return (true, username)
            }
        }
        return (false, "")
    }
    
    func validatorPassword() -> (isValid: Bool, text: String) {
        if let password = tfPassword.texfield.text {
            if password.count == 0 {
                self.tfPassword.setError(message: "Password required")
                return (false, "")
            } else {
                self.tfPassword.clearError()
                return (true, password)
            }
        }
        return (false, "")
    }
}
