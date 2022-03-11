//
//  CustomTextfield.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.
//

import UIKit
import SnapKit

enum CustomTextfieldType {
    case username
    case password
    case text
}

class CustomTextfield: UIView {
    
    
    var type: CustomTextfieldType
    
    let label = UILabel()
        .configure { v in
            v.text = "Username"
            v.font = UIFont.systemFont(ofSize: 12, weight: .light)
        }
    
    let texfield = UITextField()
        .configure { v in
            v.placeholder = ""
            v.backgroundColor = .systemGray6
            v.layer.cornerRadius = 12
            v.heightAnchor.constraint(equalToConstant: 40).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            v.leftView = view
            v.leftViewMode = .always
        }

    required init(label: String, type: CustomTextfieldType = .text) {
        self.label.text = label
        self.type = type
        
        switch type {
        case .username, .text:
            self.texfield.keyboardType = .default
        case .password:
            self.texfield.isSecureTextEntry = true
        }
        
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension CustomTextfield {
    func setupUI() {
        self.layer.borderWidth = 0
        self.layer.borderColor = Colors.accent1.cgColor
        
        self.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        
        addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(self).offset(5)
            make.leading.trailing.equalTo(self).offset(20).inset(5)
        }
        
        addSubview(texfield)
        texfield.snp.makeConstraints { make in
            make.top.equalTo(label.snp_bottomMargin).offset(15)
            make.leading.trailing.equalTo(self).offset(0).inset(0)
        }
    }
}
