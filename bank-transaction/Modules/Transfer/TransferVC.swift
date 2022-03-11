//
//  TransferVC.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

import UIKit
import SnapKit
import Kingfisher

class TransferVC: UIViewController {
    var presentor: TransferViewToPresenterProtocol?
    public var delegate: TransferDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Transfer"
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.tabBarController?.tabBar.isHidden = true
    }
    
    let lblBalance = UILabel()
        .configure { v in
            v.text = "Your Balance"
            v.font = UIFont.systemFont(ofSize: 14, weight: .light)
            v.textAlignment = .left
            v.textColor = Colors.titleDark
        }
    
    let lblBalanceAmount = UILabel()
        .configure { v in
            v.text = "SGD 21,421.33"
            v.font = UIFont.systemFont(ofSize: 25, weight: .light)
            v.textAlignment = .left
            v.textColor = Colors.titleDark
        }
    
    let ivReceiver = UIImageView()
        .configure { v in
            v.kf.setImage(with: URL(string: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80"))
            v.kf.indicatorType = .activity
            v.contentMode = .scaleAspectFill
            v.clipsToBounds = true
            v.widthAnchor.constraint(equalToConstant: 55).isActive = true
            v.heightAnchor.constraint(equalToConstant: 55).isActive = true
            v.layer.cornerRadius = 10
            v.layer.masksToBounds = true
        }
    
    let btnReceiver = UILabel()
        .configure { v in
            v.text = "Jane Sihombing"
            v.textAlignment = .left
            v.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            v.textColor = Colors.accent1
            v.snp.makeConstraints { make in
                make.width.equalTo(180)
            }
        }
    
    let btnSelectReceiver = UIButton()
        .configure { v in
            v.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            v.imageView?.tintColor = Colors.accent1
            v.addTarget(self, action: #selector(selectReceverTapper), for: .touchUpInside)
        }
    
    let lblAmount = UILabel()
        .configure { v in
            v.text = "Amount"
            v.font = UIFont.systemFont(ofSize: 14, weight: .light)
            v.textAlignment = .left
            v.textColor = Colors.titleDark
        }
    
    let tfAmount = UITextField()
        .configure { v in
            v.snp.makeConstraints { make in
                make.height.equalTo(60)
            }
            v.textColor = Colors.titleDark
            v.font = UIFont.systemFont(ofSize: 35, weight: .bold)
            v.keyboardType = .decimalPad
            
            var bottomLine = CALayer() //CGRect(0.0, 75 - 1, 300, 1.0)
            bottomLine.frame = CGRect(x: 0.0, y: 60, width: 300, height: 1.0)
            bottomLine.backgroundColor = Colors.subTitleDark.cgColor
            v.borderStyle = .none
            v.layer.addSublayer(bottomLine)
        }
    
    let tfNote = CustomTextfield(label: "Note", type: .text)
        .configure { v in
            
        }
    
    let btnContinue = CustomButton()
        .configure { v in
            v.setTitle("Continue", for: .normal)
            v.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        }
    
    @objc func selectReceverTapper() {
        presentor?.goToSelectReceiver(from: self)
    }
    
    @objc func continueTapped() {
        presentor?.transfer(receipientAccountNo: "nil", amount: 20, description: "nil")
    }

}

extension TransferVC: TransferPresenterToViewProtocol {
    func didSuccessTransfer(data: Transfer) {
        presentor?.goBack(from: self)
    }
    
    func didFailedTransfer(error: CustomError) {
        
    }
    
    
}

extension TransferVC: SelectReceiverDelegate {
    func didSelectReceiver(data: Receiver) {
        print(data)
    }
}

extension TransferVC {
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(lblBalance)
        lblBalance.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.trailing.equalTo(view).offset(36).inset(36)
        }
        
        view.addSubview(lblBalanceAmount)
        lblBalanceAmount.snp.makeConstraints { make in
            make.top.equalTo(lblBalance).offset(20)
            make.leading.trailing.equalTo(view).offset(36).inset(36)
        }
        
        let receiverView = UIStackView()
            .configure { v in
                v.spacing = 20
                v.axis = .horizontal
                v.backgroundColor = Colors.accent2
                v.layer.cornerRadius = 15
                v.layer.masksToBounds = true
                v.distribution = .fill
                v.alignment = .center
                v.contentMode = .scaleToFill
                let tap = UITapGestureRecognizer(target: self, action: #selector(selectReceverTapper))
                v.addGestureRecognizer(tap)
            }
        
        view.addSubview(receiverView)
        receiverView.snp.makeConstraints { make in
            make.top.equalTo(lblBalanceAmount.snp_bottomMargin).offset(30)
            make.leading.trailing.equalTo(view).offset(36).inset(36)
            make.height.equalTo(70)
        }
        
        [ivReceiver, btnReceiver, btnSelectReceiver].forEach { receiverView.addArrangedSubview($0)}
        ivReceiver.snp.makeConstraints { make in
            make.leading.equalTo(receiverView).offset(10)
        }
        
        btnSelectReceiver.snp.makeConstraints { make in
            make.trailing.equalTo(receiverView).inset(20)
        }
        
        view.addSubview(lblAmount)
        lblAmount.snp.makeConstraints { make in
            make.top.equalTo(receiverView.snp_bottomMargin).offset(20)
            make.leading.trailing.equalTo(view).offset(36).inset(36)
        }
        
        view.addSubview(tfAmount)
        tfAmount.snp.makeConstraints { make in
            make.top.equalTo(lblAmount.snp_bottomMargin).offset(10)
            make.leading.trailing.equalTo(view).offset(36).inset(36)
        }
        
        view.addSubview(tfNote)
        tfNote.snp.makeConstraints { make in
            make.top.equalTo(tfAmount.snp_bottomMargin).offset(30)
            make.leading.trailing.equalTo(view).offset(36).inset(36)
        }
        
        view.addSubview(btnContinue)
        btnContinue.snp.makeConstraints { make in
            make.bottom.equalTo(view).inset(50)
            make.leading.trailing.equalTo(view).offset(36).inset(36)
        }
        
    }
}
