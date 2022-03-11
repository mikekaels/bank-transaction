//
//  CustomButton.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.
//

import UIKit
import SnapKit

class CustomButton: UIButton {

    required init() {
        super.init(frame: .zero)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

}

extension CustomButton {
    func setupUI() {
        self.backgroundColor = Colors.accent1
        self.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        self.layer.cornerRadius = 25
        self.layer.masksToBounds = true
    }
}
