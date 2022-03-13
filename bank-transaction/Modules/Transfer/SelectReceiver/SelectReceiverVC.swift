//
//  SelectReceiverVC.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 12/03/22.

import UIKit
import Kingfisher

class SelectReceiverVC: UIViewController {
    var presentor: SelectReceiverViewToPresenterProtocol?
    public var delegate: SelectReceiverDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
        fetchData()
    }
    
    var payees: [Payee] = [Payee]()
    
    let tableView = UITableView()
        .configure { v in
            v.register(ReceiverCell.self, forCellReuseIdentifier: Identifiers.ReceiverCell)
            
        }
    
    func fetchData() {
        presentor?.getPayees()
    }

}

extension SelectReceiverVC: SelectReceiverPresenterToViewProtocol {
    func didSuccessGetPayees(data: [Payee]) {
        self.payees = data
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func didFailedGetPayees(error: CustomError) {
        
    }
    
    
}

extension SelectReceiverVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.ReceiverCell, for: indexPath) as! ReceiverCell
        let payee = self.payees[indexPath.row]
        cell.lblName.text = payee.name
        cell.lblAccountNumber.text = payee.accountNo
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = payees[indexPath.row]
        presentor?.didSelectReceiver(data: data, from: self)
    }
}

extension SelectReceiverVC {
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalTo(view)
        }
    }
}




class ReceiverCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    let image = UIImageView()
        .configure { v in
            v.kf.setImage(with: URL(string: "https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg"))
            v.tintColor = Colors.accent1
            v.snp.makeConstraints { make in
                make.height.width.equalTo(45)
            }
            
            v.kf.indicatorType = .activity
            v.contentMode = .scaleAspectFill
            v.clipsToBounds = true
            v.layer.cornerRadius = 10
            v.layer.masksToBounds = true
        }
    
    let lblName = UILabel()
        .configure { v in
            v.text = "Uhuii"
            v.textColor = Colors.titleDark
            v.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            v.textAlignment = .left
        }
    
    let lblAccountNumber = UILabel()
        .configure { v in
            v.text = "0812883478347"
            v.textColor = Colors.subTitleDark
            v.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            v.textAlignment = .left
        }
    
    
    func setupUI() {
        contentView.addSubview(image)
        image.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(20)
            make.centerY.equalTo(contentView)
        }
        
        contentView.addSubview(lblName)
        lblName.snp.makeConstraints { make in
            make.leading.equalTo(image.snp_trailingMargin).offset(20)
            make.top.equalTo(contentView).offset(20)
        }
        
        contentView.addSubview(lblAccountNumber)
        lblAccountNumber.snp.makeConstraints { make in
            make.leading.equalTo(image.snp_trailingMargin).offset(20)
            make.bottom.equalTo(contentView).inset(20)
        }
    }
}
