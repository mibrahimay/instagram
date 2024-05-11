import UIKit

protocol ProfileInfoHeaderCollectionReusableViewDelegate : AnyObject {
    
    func profileHeaderDidClickButton(_ header :ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidFollowersButton(_ header :ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidFollowingButton(_ header :ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidEditProfileButton(_ header :ProfileInfoHeaderCollectionReusableView)

}
final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    weak var delegate: ProfileInfoHeaderCollectionReusableViewDelegate?
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    private let profilePhotoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
        return imageView
    }()
    private let postButton : UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    private let followingButton : UIButton = {
        let button = UIButton()
        button.setTitle("Following", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    private let followersButton : UIButton = {
        let button = UIButton()
        button.setTitle("Followers", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    private let editProfileButton : UIButton = {
        let button = UIButton()
        button.setTitle("Edit your profile", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "İbrahim Ay"
        label.numberOfLines = 1
        return label
    }()
    private let bioLabel : UILabel = {
        let label = UILabel()
        label.text = "İbrahim Ay bio"
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        addButtonActions()
        backgroundColor = .systemBackground
        clipsToBounds = true
    }
    private func addSubview() {
        addSubview(profilePhotoImageView)
        addSubview(followersButton)
        addSubview(followingButton)
        addSubview(postButton)
        addSubview(editProfileButton)
        addSubview(nameLabel)
        addSubview(bioLabel)

    }
    private func addButtonActions() {
        followersButton.addTarget(self, action: #selector(didClickFollowersButton), for: .touchUpInside)
        followingButton.addTarget(self, action: #selector(didClickFollowingButton), for: .touchUpInside)
        postButton.addTarget(self, action: #selector(didClickPostButton), for: .touchUpInside)
        editProfileButton.addTarget(self, action: #selector(didClickEditProfileButton), for: .touchUpInside)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let profilePhotoSize = width/4
        
        profilePhotoImageView.frame = CGRect(x: 5, y: 5, width: profilePhotoSize, height: profilePhotoSize).integral
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize/2.0
        let buttonHeight = profilePhotoSize/2
        let countButtonWidth = (width-10-profilePhotoSize)/3
        postButton.frame = CGRect(x: profilePhotoImageView.right, y: 5, width: countButtonWidth, height: buttonHeight).integral
        followersButton.frame = CGRect(x: postButton.right, y: 5, width: countButtonWidth, height: buttonHeight).integral
        followingButton.frame = CGRect(x: followersButton.right, y: 5, width: countButtonWidth, height: buttonHeight).integral
        editProfileButton.frame = CGRect(x: profilePhotoImageView.right, y: 5 + buttonHeight, width: countButtonWidth * 3 , height: buttonHeight).integral
        nameLabel.frame = CGRect(x: 5, y: 5 + profilePhotoImageView.bottom, width: width - 10 , height: 50).integral
        let bioLabelSize = bioLabel.sizeThatFits(frame.size)
        bioLabel.frame = CGRect(x: 5, y: 5 + profilePhotoImageView.bottom, width: width - 10 , height: 50).integral

    }

    @objc private func didClickFollowersButton(){
        delegate?.profileHeaderDidFollowersButton(self)
    }
    @objc private func didClickFollowingButton(){
        delegate?.profileHeaderDidFollowingButton(self)
    }
    @objc private func didClickPostButton(){
        delegate?.profileHeaderDidClickButton(self)
    }
    @objc private func didClickEditProfileButton(){
        delegate?.profileHeaderDidEditProfileButton(self)
        }
    }
