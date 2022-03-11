//
//  ChipsCell.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 10/03/22.
//

import UIKit
import Kingfisher

class ChipsCell: UICollectionViewCell {
    
    let bgView: UIView = UIView()
        .configure { v in
            v.layer.cornerRadius = 17
            v.translatesAutoresizingMaskIntoConstraints = false
            v.backgroundColor = UIColor(white: 1, alpha: 0.3)
        }
    
    let profileImage: UIImageView = UIImageView()
        .configure { v in
            v.kf.setImage(with: URL(string: "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80"))
            v.contentMode = .scaleAspectFill
            
            v.widthAnchor.constraint(equalToConstant: 34).isActive = true
            v.heightAnchor.constraint(equalToConstant: 34).isActive = true
            
            v.layer.cornerRadius = 17
            v.layer.masksToBounds = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lUser: UILabel = UILabel()
        .configure { v in
            v.text = "Unknown"
            v.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            v.textAlignment = .left
            v.textColor = .white
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bgView)
        
        bgView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        bgView.addSubview(profileImage)
        profileImage.leadingAnchor.constraint(equalTo: bgView.leadingAnchor).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: bgView.centerYAnchor).isActive = true
        
        bgView.addSubview(lUser)
        lUser.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 5).isActive = true
        lUser.centerYAnchor.constraint(equalTo: bgView.centerYAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
