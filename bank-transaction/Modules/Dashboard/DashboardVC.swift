//
//  DashboardVC.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 10/03/22.

import UIKit
import Kingfisher

class DashboardVC: UIViewController {
    var presentor: DashboardViewToPresenterProtocol?
    public var delegate: DashboardDelegate?
    
    var topUpItem: [[String]] = [
        ["NETSPay", "https://nxtmag.tech/wp-content/uploads/2018/06/nets.jpg"],
        ["SingTel Dash", "https://upload.wikimedia.org/wikipedia/commons/b/b5/Singtel_Logo_New.png"],
        ["WeChat Pay", "https://toppng.com/uploads/preview/wechat-pay-logo-vector-11573849827dvyxvd9urz.png"],
        ["Huawei Pay", "https://cf.shopee.co.id/file/3b635a42a1f1ffd235a9c5fededbeb12"],
        ["GrabPay", "https://bigcowsoftware.com/ios4.png"]
    ]
    var billsItem:  [[String]] = [
        ["Electricity", "https://cdn3.vectorstock.com/i/1000x1000/47/47/electricity-logo-electric-logo-and-icon-vector-27184747.jpg"],
        ["Water", "https://static.vecteezy.com/system/resources/thumbnails/000/596/073/small/14052019-21.jpg"],
        ["Phone Providers", "https://img1.pnghut.com/13/18/3/QsmjBb2r5a/internet-service-provider-wifi-wireless-network-text-generic-access.jpg"]
    ]
    
    var balance: Float = 0.0
    var transactions: [Transaction] = [Transaction]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.topUpCollection.dataSource = self
        self.topUpCollection.delegate = self
        
        self.billsCollection.dataSource = self
        self.billsCollection.delegate = self
        
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar(animated: animated)
        self.tabBarController?.tabBar.isHidden = false
        fetchData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showNavigationBar(animated: animated)
    }
    
    deinit {
        print("Dashboard VC has been dealocated")
    }
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let container: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 50
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let greetingLabel: UILabel = UILabel()
        .configure { v in
            v.text = "Hello Steve,"
            v.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
            v.textAlignment = .left
            v.textColor = Colors.titleDark
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let selectAccount: UIButton = UIButton(type: .custom)
        .configure { v in
            v.setTitle("Select Account ", for: .normal)
            v.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            v.setTitleColor(Colors.accent1, for: .normal)
            v.translatesAutoresizingMaskIntoConstraints = false
//            v.semanticContentAttribute = .forceRightToLeft
//            v.setImage(UIImage(systemName: "chevron.right.circle.fill"), for: .normal)
//            v.imageView?.tintColor = Colors.accent1
//            v.addTarget(self, action: #selector(groupSelectTapped), for: .touchUpInside)
        }
    
    let profileButton: UIButton = UIButton(type: .custom)
        .configure { v in
            let urls = URL(string: "https://planetgadget.store/wp-content/uploads/2021/08/Surat-lamaran-kerja-steve-jobs-laku-terjual-hampir-5-miliar.jpg")
            v.imageView!.kf.indicatorType = .activity
            v.imageView!.contentMode = .scaleAspectFill
            v.kf.setImage(with: urls, for: .normal)
            v.contentMode = .scaleAspectFill
            v.clipsToBounds = true
            v.widthAnchor.constraint(equalToConstant: 50).isActive = true
            v.heightAnchor.constraint(equalToConstant: 50).isActive = true
            v.layer.cornerRadius = 25
            v.layer.masksToBounds = true
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(profileTapped), for: .touchUpInside)
        }
    
    let mainCard: GradientView = GradientView(gradientStartColor:Colors.background1,
                                              gradientEndColor: Colors.background2,
                                              startPoint: CGPoint(x: 1.0, y: 1.0),
                                              endPoint: CGPoint(x: 0.1, y: 0.0))
        .configure { v in
            v.layer.cornerRadius = 35
            v.layer.masksToBounds = true
            v.heightAnchor.constraint(equalToConstant: 220).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lblBalance: UILabel = UILabel()
        .configure { v in
            v.text = "Balance"
            v.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            v.textAlignment = .left
            v.textColor = .white
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lblBalanceAmount: UILabel = UILabel()
        .configure { v in
            v.text = "SGD 21,421.33"
            v.font = UIFont.systemFont(ofSize: 25, weight: .bold)
            v.textAlignment = .left
            v.textColor = .white
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lblTopUp: UILabel = UILabel()
        .configure { v in
            v.text = "Top Up"
            v.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            v.textAlignment = .left
            v.textColor = Colors.titleLight
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lblBill: UILabel = UILabel()
        .configure { v in
            v.text = "Pay Bill"
            v.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            v.textAlignment = .left
            v.textColor = Colors.titleLight
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let topUpCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ChipsCell.self, forCellWithReuseIdentifier: Identifiers.TopUpCell)
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    let billsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ChipsCell.self, forCellWithReuseIdentifier: Identifiers.BillsCell)
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    let btnTransfer: UIButton = UIButton()
        .configure { v in
            v.setImage(UIImage(systemName: "repeat"), for: .normal)
            v.tintColor = Colors.accent1
            v.backgroundColor = Colors.accent2
            v.layer.cornerRadius = 13
            v.heightAnchor.constraint(equalToConstant: 50).isActive = true
            v.widthAnchor.constraint(equalToConstant: 50).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(transferTapped), for: .touchUpInside)
        }
    
    let lblTransfer: UILabel = UILabel()
        .configure { v in
            v.text = "Transfer"
            v.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            v.textAlignment = .center
            v.textColor = Colors.titleDark
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let transactionTableView = TransactionTableViewController(items: [], configure: { (cell: SubtitleAndIconCell, item: Transaction) in
        cell.lItem.text = item.receipient?.accountHolder
        cell.lPrice.text = "SGD \(String(describing: item.amount!.description))"
        cell.lAccount.text = item.receipient?.accountNo
        cell.icon.image = UIImage(systemName: "repeat")
        //        cell.viewbackground.backgroundColor = UIColor.colorWith(name: item.colorBackgroud!)
        //        cell.lblUser.textColor = UIColor.colorWith(name: item.colorText!)
    }) { (item) in
        print(item)
    }.configure { v in
                v.tableView.isScrollEnabled = false
        v.tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let lblTransaction: UILabel = UILabel()
        .configure { v in
            v.text = "Your Transaction History"
            v.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            v.textAlignment = .left
            v.textColor = Colors.titleDark
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lblSeeAll: UIButton = UIButton()
        .configure { v in
            v.setTitle("See All", for: .normal)
            v.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            v.setTitleColor(Colors.accent1, for: .normal)
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
        }
    
    @objc func transferTapped() {
        presentor?.goToTransfer(balance: self.balance, from: self)
    }
    
    @objc func profileTapped() {
        presentor?.goToProfile(from: self)
    }
    
    func getData() {
        let username = UserDefaultsManager.shared.getUsername()
        let accountNumber = UserDefaultsManager.shared.getAccountNumber()
        
        DispatchQueue.main.async {
            self.greetingLabel.text = "Hello \(username)"
            self.selectAccount.setTitle("Account No: \(accountNumber)", for: .normal)
        }
    }
    
    func fetchData() {
        presentor?.getBalance()
        presentor?.getTransactions()
    }
    
    @objc func seeAllButtonTapped() {
        presentor?.goToTransaction(data: self.transactions, from: self)
    }
    
}

extension DashboardVC: DashboardPresenterToViewProtocol {
    func didSuccessGetTransaction(data: [Transaction]) {
        self.transactions = data
        var newData = [Transaction]()
        if data.count >= 3 {
            for i in 0...2 {
                newData.append(data[i])
            }
        } else {
            newData.append(contentsOf: data)
        }
        DispatchQueue.main.async { [weak self] in
            self?.transactionTableView.items = newData
        }
    }
    
    func didFailedGetTransaction(error: CustomError) {
        print("DATA: ERROR: ",error)
    }
    
    func didSuccessGetBalance(data: Balance) {
        self.balance = data.balance ?? 0.0
        DispatchQueue.main.async { [weak self] in
            self?.lblBalanceAmount.text = "SGD \(data.balance ?? 999999)"
        }
    }
    
    func didFailedGetBalance(error: CustomError) {
        
    }
    
    
}

extension DashboardVC: ProfileDelegate {
    func logout() {
        presentor?.goToLogin(from: self)
    }
}

extension DashboardVC {
    func setupUI() {
        setupScrollView()
        
        let v1 = UIView().configure { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            v.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            v.addSubview(greetingLabel)
            greetingLabel.topAnchor.constraint(equalTo: v.topAnchor).isActive = true
            
            v.addSubview(selectAccount)
            selectAccount.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 0).isActive = true
            
            v.addSubview(profileButton)
            profileButton.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
            profileButton.trailingAnchor.constraint(equalTo: v.trailingAnchor).isActive = true
        }
        
        let gradient = CAGradientLayer()
        gradient.frame = self.mainCard.frame
        gradient.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        mainCard.layer.addSublayer(gradient)
        
        mainCard.addSubview(lblBalance)
        lblBalance.topAnchor.constraint(equalTo: mainCard.topAnchor, constant: 20).isActive = true
        lblBalance.leadingAnchor.constraint(equalTo: mainCard.leadingAnchor, constant: 20).isActive = true
        
        mainCard.addSubview(lblBalanceAmount)
        lblBalanceAmount.topAnchor.constraint(equalTo: lblBalance.bottomAnchor, constant: 0).isActive = true
        lblBalanceAmount.leadingAnchor.constraint(equalTo: mainCard.leadingAnchor, constant: 20).isActive = true
        
        mainCard.addSubview(lblTopUp)
        lblTopUp.topAnchor.constraint(equalTo: lblBalanceAmount.bottomAnchor, constant: 10).isActive = true
        lblTopUp.leadingAnchor.constraint(equalTo: mainCard.leadingAnchor, constant: 20).isActive = true
        
        mainCard.addSubview(topUpCollection)
        topUpCollection.topAnchor.constraint(equalTo: lblTopUp.bottomAnchor, constant: 5).isActive = true
        topUpCollection.leadingAnchor.constraint(equalTo: mainCard.leadingAnchor, constant: 0).isActive = true
        topUpCollection.trailingAnchor.constraint(equalTo: mainCard.trailingAnchor).isActive = true
        topUpCollection.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        mainCard.addSubview(lblBill)
        lblBill.topAnchor.constraint(equalTo: topUpCollection.bottomAnchor, constant: 15).isActive = true
        lblBill.leadingAnchor.constraint(equalTo: mainCard.leadingAnchor, constant: 20).isActive = true
        
        mainCard.addSubview(billsCollection)
        billsCollection.topAnchor.constraint(equalTo: lblBill.bottomAnchor, constant: 5).isActive = true
        billsCollection.leadingAnchor.constraint(equalTo: mainCard.leadingAnchor, constant: 0).isActive = true
        billsCollection.trailingAnchor.constraint(equalTo: mainCard.trailingAnchor).isActive = true
        billsCollection.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        let v3: UIStackView = UIStackView().configure { v in
            v.spacing = 15
            v.axis = .vertical
            v.distribution = .fill
            v.alignment = .center
            v.contentMode = .scaleToFill
            
            [btnTransfer].forEach { v.addArrangedSubview($0)}
            btnTransfer.topAnchor.constraint(equalTo: v.topAnchor, constant: 10).isActive = true
            
            v.addSubview(lblTransfer)
            lblTransfer.topAnchor.constraint(equalTo: btnTransfer.bottomAnchor, constant: 5).isActive = true
            lblTransfer.centerXAnchor.constraint(equalTo: btnTransfer.centerXAnchor).isActive = true
            
        }
        
        let v4: UIView = UIView().configure { v in
            v.heightAnchor.constraint(equalToConstant: 200).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            
            v.addSubview(lblTransaction)
            lblTransaction.topAnchor.constraint(equalTo: v.topAnchor, constant: 20).isActive = true
            lblTransaction.leadingAnchor.constraint(equalTo: v.leadingAnchor).isActive = true
            
            v.addSubview(lblSeeAll)
            lblSeeAll.topAnchor.constraint(equalTo: v.topAnchor, constant: 20).isActive = true
            lblSeeAll.trailingAnchor.constraint(equalTo: v.trailingAnchor).isActive = true
            
            v.addSubview(transactionTableView.view)
            transactionTableView.view.topAnchor.constraint(equalTo: lblTransaction.bottomAnchor, constant: 10).isActive = true
            transactionTableView.view.trailingAnchor.constraint(equalTo: v.trailingAnchor).isActive = true
            transactionTableView.view.heightAnchor.constraint(equalToConstant: 200).isActive = true
            transactionTableView.view.leadingAnchor.constraint(equalTo: v.leadingAnchor).isActive = true
        }
        
        [v1, mainCard, v3, v4].forEach {container.addArrangedSubview($0)}
        
    }
    
    func setupScrollView() {
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(container)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        container.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
        container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        // Important!
        container.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.90).isActive = true
        container.spacing = 20
    }
}

extension DashboardVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case topUpCollection:
            
            if topUpItem[indexPath.row][0].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)]).width + 20 < 80 {
                
                return CGSize(width: 100, height: 34)
                
            } else {
                
                return CGSize(width: topUpItem[indexPath.item][0].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 30, height: 34)
                
            }
        case billsCollection:
            
            if billsItem[indexPath.item][0].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 20 < 80 {
                
                return CGSize(width: 100, height: 34)
                
            } else {
                
                return CGSize(width: billsItem[indexPath.item][0].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 30, height: 34)
                
            }
        default:
            return CGSize(width: 100, height: 34)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case topUpCollection:
            return topUpItem.count
        case billsCollection:
            return billsItem.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case topUpCollection:
            let cell = topUpCollection.dequeueReusableCell(withReuseIdentifier: Identifiers.TopUpCell, for: indexPath) as! ChipsCell
            cell.lUser.text = topUpItem[indexPath.row][0]
            cell.profileImage.kf.setImage(with: URL(string: topUpItem[indexPath.row][1]))
            return cell
        case billsCollection:
            let cell = billsCollection.dequeueReusableCell(withReuseIdentifier: Identifiers.BillsCell, for: indexPath) as! ChipsCell
            cell.lUser.text = billsItem[indexPath.row][0]
            cell.profileImage.kf.setImage(with: URL(string: billsItem[indexPath.row][1]))
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        if collectionView == friendOweToYou {
        //            presentor?.goToUserDebtDetails(from: self)
        //        }
    }
    
    //    func chooseColor(color: String) -> UIColor {
    //        switch color {
    //        case "_00D8Ff":
    //            return Asset.Color._00D8Ff.color
    //        case "_0078Ff":
    //            return Asset.Color._0078Ff.color
    //        case "a9A9A9":
    //            return Asset.Color.a9A9A9.color
    //        case "ffa200":
    //            return Asset.Color.ffa200.color
    //        case "ffeed1":
    //            return Asset.Color.ffeed1.color
    //        case "_1F1F1F":
    //            return Asset.Color._1F1F1F.color
    //        case "e3F2Ff":
    //            return Asset.Color.e3F2Ff.color
    //        case "ffdf00":
    //            return Asset.Color.ffdf00.color
    //        case "c5Ffdf":
    //            return Asset.Color.c5Ffdf.color
    //        default:
    //            return Asset.Color.ffdf00.color
    //        }
    //    }
    
}
