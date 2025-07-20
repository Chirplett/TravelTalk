//
//  ChatCollectionViewCell.swift
//  TravelTalk
//
//  Created by Jude Song on 7/20/25.
//

import UIKit

class ChatCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var friendNameLabel: UILabel!
    @IBOutlet var lastMessageLabel: UILabel!
    @IBOutlet var sentDateLabel: UILabel!
    @IBOutlet var rightSpaceView: UIView!
    
    static let identifier: String = "ChatCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.contentMode = .scaleAspectFill
        
        friendNameLabel.textAlignment = .left
        friendNameLabel.font = .systemFont(ofSize: 12, weight: .heavy)
        
        lastMessageLabel.textAlignment = .left
        lastMessageLabel.font = .systemFont(ofSize: 12, weight: .bold)
        lastMessageLabel.textColor = .gray
        
        sentDateLabel.textAlignment = .right
        sentDateLabel.font = .systemFont(ofSize: 8, weight: .regular)
        sentDateLabel.textColor = .gray
        
    }

}
