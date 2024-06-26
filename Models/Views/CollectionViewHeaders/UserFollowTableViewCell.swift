//
//  UserFollowTableViewCell.swift
//  Filling
//
//  Created by mac on 20.04.2024.
//

import UIKit

protocol UserFollowTableViewCellDelegate: AnyObject{
    func didClickFollowUnfollowButton(model : UserRelationship)
        
    
}
enum FollowState {
    case following // indicates the current user is following the other user
    case not_following  // indicates the current user is NOT following the other user
}

struct UserRelationship {
    let username : String
    let name : String
    let type : FollowState
}
class UserFollowTableViewCell: UITableViewCell {
    private var model : UserRelationship?
    static let identifier = "UserFollowTableViewCell"
    weak var delegate :(UserFollowTableViewCellDelegate)?
    private let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "ibrahim"
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    private let usernameLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "ibr"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    private let followButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        return button
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(nameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(profileImageView)
        contentView.addSubview(followButton)
        selectionStyle = .none
        followButton.addTarget(self, action: #selector(didClickFollowButton), for: .touchUpInside)
    }
    @objc func didClickFollowButton() {
        guard let model = model else {
            return
        }
        delegate?.didClickFollowUnfollowButton(model: model)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        nameLabel.text = nil
        usernameLabel.text = nil
        followButton.setTitle(nil, for: .normal)
        followButton.layer.borderWidth = 0
        followButton.backgroundColor = nil
    }
    public func configure (with model : UserRelationship) {
        self.model = model
        nameLabel.text = model.name
        usernameLabel.text = model.username
        switch model.type {
        case .following:
            //shows unfollow button
            followButton.setTitle("unfollow", for: .normal)
            followButton.setTitleColor(.label, for: .normal)
            followButton.backgroundColor = .systemBackground
            followButton.layer.borderWidth = 1
            followButton.layer.borderColor = UIColor.label.cgColor
            
        case .not_following :
            //show follow button
            followButton.setTitle("follow", for: .normal)
            followButton.setTitleColor(.label, for: .normal)
            followButton.backgroundColor = .systemBackground
            followButton.layer.borderColor = UIColor.label.cgColor
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.frame = CGRect(x: 3, y: 3, width: contentView.height-6, height: contentView.height-6 )
        profileImageView.layer.cornerRadius = profileImageView.height/2.0
        
        let buttonWidth = contentView.width > 500 ? 250 : contentView.width/3
        followButton.frame = CGRect(x: contentView.width-5-buttonWidth, y: (contentView.height-40)/2, width: buttonWidth, height: contentView.height-10)
        
        let labelHeight = contentView.height/2
        nameLabel.frame = CGRect(x: profileImageView.right + 5 , y: 0, width: contentView.width-3-profileImageView.width-buttonWidth, height: labelHeight)
        usernameLabel.frame = CGRect (x: profileImageView.right+5, y: nameLabel.bottom, width: contentView.width-3-profileImageView.width-buttonWidth, height: labelHeight)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func tableView (_ tableView: UITableView , heightForRowAt indexPath :IndexPath) -> CGFloat {
        return 75
    }
}
