//
//  ProfileVC.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.

import UIKit
import Kingfisher
import SnapKit

class ProfileVC: UIViewController {
    var presentor: ProfileViewToPresenterProtocol?
    public var delegate: ProfileDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        setupUI()
        
        tvItems.delegate = self
        tvItems.dataSource = self
    }
    
    let tableViewItems: [[ProfileItem]] = [
        [
            ProfileItem(label: "Account", icon: "creditcard"),
            ProfileItem(label: "Edit Profile", icon: "person.fill"),
            ProfileItem(label: "Help", icon: "phone.fill"),
            ProfileItem(label: "Find Nearest Bank", icon: "location.fill.viewfinder"),
        ],[
            ProfileItem(label: "Logout", icon: "arrow.backward"),
        ]
    ]
    
    var tvItems = UITableView()
        .configure { v in
            v.register(LogoAndTitleCell.self, forCellReuseIdentifier: Identifiers.ProfileItemCell)
        }
    
}

extension ProfileVC: ProfilePresenterToViewProtocol {
    
}

extension ProfileVC {
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tvItems)
        tvItems.snp.makeConstraints { make in
            make.leading.trailing.bottom.top.equalTo(view)
        }
        
    }
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewItems[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.ProfileItemCell, for: indexPath) as! LogoAndTitleCell
        let item = tableViewItems[indexPath.section][indexPath.row]
        cell.label.text = item.label
        cell.image.image = UIImage(systemName: item.icon)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewItems[indexPath.section][indexPath.row].label == "Logout" {
            presentor?.dismiss(from: self)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1 : return 10
        default: return 0
        }
    }
    
    
    
}

struct ProfileItem {
    let label: String
    let icon: String
}

class LogoAndTitleCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    let image = UIImageView()
        .configure { v in
            v.tintColor = Colors.accent1
            v.snp.makeConstraints { make in
                make.height.width.equalTo(22)
            }
        }
    
    let label = UILabel()
        .configure { v in
            v.text = "Uhuii"
            v.textColor = Colors.titleDark
            v.font = UIFont.systemFont(ofSize: 17, weight: .light)
            v.textAlignment = .left
        }
    
    
    func setupUI() {
        contentView.addSubview(image)
        image.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(20)
            make.centerY.equalTo(contentView)
        }
        
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.equalTo(image)
            make.leading.equalTo(image.snp_trailingMargin).offset(25)
        }
    }
}
