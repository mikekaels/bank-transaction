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
        print("Register VC has been dealocated")
    }
    
    //MARK: - PROPERTIES
    
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
    
    let tfPasswordConfirmation = CustomTextfield(label: "Confirm Password", type: .password)
        .configure { v in
            
        }
    
    let btnRegister = CustomButton()
        .configure { v in
            v.setTitle("Register", for: .normal)
            v.backgroundColor = Colors.accent1
            v.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        }
    
    @objc func registerTapped() {
        let username = validatorUsername()
        let password = validatorPasswordAndConfirmation()
        if username.isValid && password.isValid {
            presentor?.register(username: username.text, password: password.text)
        }
    }
}

extension RegisterVC: RegisterPresenterToViewProtocol {
    func didSuccessRegister(data: AuthModel) {
        presentor?.dismiss(from: self)
    }
    
    func didFailedRegister(error: CustomError) {
        
    }
    
    
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
            make.leading.trailing.equalTo(view).offset(36).inset(36)
        }
        
        view.addSubview(tfPassword)
        tfPassword.snp.makeConstraints { make in
            make.top.equalTo(tfUsername.snp_bottomMargin).offset(10)
            make.leading.trailing.equalTo(view).offset(36).inset(36)
        }
        
        view.addSubview(tfPasswordConfirmation)
        tfPasswordConfirmation.snp.makeConstraints { make in
            make.top.equalTo(tfPassword.snp_bottomMargin).offset(10)
            make.leading.trailing.equalTo(view).offset(36).inset(36)
        }
        
        view.addSubview(btnRegister)
        btnRegister.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).offset(36).inset(36)
            make.bottom.equalTo(view).inset(100)
        }
        
        
    }
}


//MARK: - VALIDATORS
extension RegisterVC {
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
    
    func validatorPasswordConfirmation() -> (isValid: Bool, text: String) {
        if let password = tfPasswordConfirmation.texfield.text {
            if password.count == 0 {
                self.tfPasswordConfirmation.setError(message: "Confirmation required")
                return (false, "")
            } else {
                self.tfPasswordConfirmation.clearError()
                return (true, password)
            }
        }
        return (false, "")
    }
    
    func validatorPasswordAndConfirmation() -> (isValid: Bool, text: String) {
        let password = validatorPassword()
        let passwordConfirmation = validatorPasswordConfirmation()
        
        if password.text.count != 0 && passwordConfirmation.text.count != 0 {
            if password.text != passwordConfirmation.text {
                self.tfPasswordConfirmation.setError(message: "Password and Confirmation are not same")
                return (false, "")
            } else {
                self.tfPasswordConfirmation.clearError()
                return (true, password.text)
            }
        }
        return (false, "")
    }
}
