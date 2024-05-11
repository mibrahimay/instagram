//
//  AllPostsTableViewCell.swift
//  Filling
//
//  Created by mac on 25.02.2024.
//

import UIKit

class AllPostsTableViewCell: UITableViewCell {
    static let identifier = "AllPostsTableViewCell"
    override init(style : UITableViewCell.CellStyle , reuseIdentifier : String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemOrange

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configure () {
        //configure cell
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

