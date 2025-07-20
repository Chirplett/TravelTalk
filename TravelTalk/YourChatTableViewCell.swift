//
//  YourChatTableViewCell.swift
//  TravelTalk
//
//  Created by Jude Song on 7/21/25.
//

import UIKit

class YourChatTableViewCell: UITableViewCell {
    
    @IBOutlet var yourProfileImageView: UIImageView!
    @IBOutlet var yourNameLabel: UILabel!
    @IBOutlet var chatBubbleView: UIView!
    @IBOutlet var yourMessageLabel: UILabel!
    @IBOutlet var sentTimeLabel: UILabel!

    static let yourIdentifier = "YourChatTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        yourProfileImageView.contentMode = .scaleAspectFill
        
        yourNameLabel.textAlignment = .left
        yourNameLabel.font = .systemFont(ofSize: 12, weight: .medium)
        yourNameLabel.text = ""
        
        chatBubbleView.layer.cornerRadius = 10
        chatBubbleView.layer.borderColor = UIColor.white.cgColor
        chatBubbleView.layer.borderWidth = 1
        chatBubbleView.backgroundColor = .systemGray6
        chatBubbleView.clipsToBounds = true
        
        yourMessageLabel.textAlignment = .left
        yourMessageLabel.font = .systemFont(ofSize: 12, weight: .medium)
        yourMessageLabel.numberOfLines = 0
        yourMessageLabel.text = ""
        
        sentTimeLabel.textAlignment = .center
        sentTimeLabel.font = .systemFont(ofSize: 10, weight: .regular)
        sentTimeLabel.textColor = .gray
        sentTimeLabel.text = ""
        
        
    }

    func configure(chat: Chat) {
        
        
        
    }
    
    
}
