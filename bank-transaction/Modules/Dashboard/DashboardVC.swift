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
    
    var topUpItem: [String] = ["NETSPay", "SingTel Dash", "WeChat Pay", "Huawei Pay", "GrabPay"]
    var youOweToYourFriend: [String] = ["Sarah", "Jennifer Laurance", "Ken"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        setupUI()
        self.topUpCollection.dataSource = self
        self.topUpCollection.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar(animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showNavigationBar(animated: animated)
    }
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let container: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let greetingLabel: UILabel = UILabel()
        .configure { v in
            v.text = "Hello Mike,"
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
            v.semanticContentAttribute = .forceRightToLeft
            v.setImage(UIImage(systemName: "chevron.right.circle.fill"), for: .normal)
            v.translatesAutoresizingMaskIntoConstraints = false
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
//            v.addTarget(self, action: #selector(profileTapped), for: .touchUpInside)
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
    
    let lblPayBill: UILabel = UILabel()
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
        cv.register(ChipsCell.self, forCellWithReuseIdentifier: "ChipsCell")
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
    }()

}

extension DashboardVC: DashboardPresenterToViewProtocol {
    
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
        
        [v1, mainCard].forEach {container.addArrangedSubview($0)}
        
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
            
            if topUpItem[indexPath.row].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)]).width + 20 < 80 {
                
                return CGSize(width: 100, height: 34)
                
            } else {
                
                return CGSize(width: topUpItem[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 30, height: 34)
                
            }
//        case youOweToYourFriendCollection:
//
//            if youOweToYourFriend[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 20 < 80 {
//
//                return CGSize(width: 88, height: 34)
//
//            } else {
//
//                return CGSize(width: youOweToYourFriend[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 20, height: 34)
//
//            }
        default:
            return CGSize(width: 88, height: 34)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case topUpCollection:
            return topUpItem.count
//        case youOweToYourFriendCollection:
//            return youOweToYourFriend.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case topUpCollection:
            let cell = topUpCollection.dequeueReusableCell(withReuseIdentifier: "ChipsCell", for: indexPath) as! ChipsCell
            cell.lUser.text = topUpItem[indexPath.row]
            return cell
//        case youOweToYourFriendCollection:
//            let cell = youOweToYourFriendCollection.dequeueReusableCell(withReuseIdentifier: "youOweToYourFriend", for: indexPath) as! MainCardCell
//            cell.lUser.text = youOweToYourFriend[indexPath.row]
//            return cell
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
