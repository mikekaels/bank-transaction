//
//  SubtitleAndIconCell.swift
//  bank-transaction
//
//  Created by Santo Michael Sihombing on 11/03/22.
//

import UIKit

class SubtitleAndIconCell: UITableViewCell {
    
    let bg: UIView = UIView()
        .configure { v in
            v.backgroundColor = Colors.accent2
            v.layer.cornerRadius = 14
            v.heightAnchor.constraint(equalToConstant: 42).isActive = true
            v.widthAnchor.constraint(equalToConstant: 42).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let icon: UIImageView = UIImageView()
        .configure { v in
            v.image = UIImage(systemName: "cart.fill")
            v.tintColor = Colors.accent1
            v.translatesAutoresizingMaskIntoConstraints = false
            v.contentMode = .scaleAspectFit
            v.widthAnchor.constraint(equalToConstant: 23).isActive = true
            v.heightAnchor.constraint(equalToConstant: 23).isActive = true
        }
    
    let lItem = UILabel()
        .configure { v in
            v.text = "Grocery"
            v.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            v.textAlignment = .left
            v.textColor = Colors.titleDark
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lDate = UILabel()
        .configure { v in
            v.text = "14 Oct"
            v.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            v.textAlignment = .left
            v.textColor = Colors.subTitleDark
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let lPrice = UILabel()
        .configure { v in
            v.text = "Rp 97.000"
            v.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            v.textAlignment = .right
            v.textColor = Colors.accent1
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupViews()
    }
    
    func setupViews() {
        contentView.addSubview(bg)
        bg.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        bg.addSubview(icon)
        icon.centerYAnchor.constraint(equalTo: bg.centerYAnchor).isActive = true
        icon.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        
        contentView.addSubview(lItem)
        lItem.leadingAnchor.constraint(equalTo: bg.trailingAnchor, constant: 20).isActive = true
        lItem.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        
        contentView.addSubview(lDate)
        lDate.leadingAnchor.constraint(equalTo: bg.trailingAnchor, constant: 20).isActive = true
        lDate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        contentView.addSubview(lPrice)
        lPrice.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        lPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
}
