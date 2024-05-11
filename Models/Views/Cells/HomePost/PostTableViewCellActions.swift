//
//  PostTableViewCellActions.swift
//  Filling
//
//  Created by mac on 24.02.2024.
//

import UIKit

class PostTableViewCellActions: UITableViewCell {
    static let identifier = "PostTableViewCellActions"
    override init(style : UITableViewCell.CellStyle , reuseIdentifier : String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGreen
        
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
