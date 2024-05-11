import AVFoundation
import SDWebImage
import UIKit
//cell for primary post content

final class PostTableViewCell: UITableViewCell{
    static let identifier = "PostTableViewCell"
    
    private let postImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = nil
        imageView.clipsToBounds = true
        return imageView
    } ()
    private var player : AVPlayer?
    private var playerLayer = AVPlayerLayer()
    
    override init(style : UITableViewCell.CellStyle , reuseIdentifier : String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.addSublayer(playerLayer)
        contentView.addSubview(postImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configure(with post: Userpost) {
        imageView?.image = UIImage(named: "test2") // Assuming you want to set a default image
        
        if post.postType == .photo {
            // Show image
            postImageView.sd_setImage(with: post.postURL, completed: nil)
        } else if post.postType == .video {
            // Show video
            player = AVPlayer(url: post.postURL)
            playerLayer.player = player
            playerLayer.player?.volume = 0
            playerLayer.player?.play()
        } else {
            // Handle any other cases here
            // For example, you might want to log an error or display a placeholder image
            print("Unknown post type encountered")
            imageView?.image = UIImage(named: "test2")
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = contentView.bounds
        postImageView.frame = contentView.bounds
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.image = nil
    }
}

