//
//  ChatCollectionViewCell.swift
//  TravelTalk
//
//  Created by Jude Song on 7/20/25.
//

import UIKit

class ChatCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var chatRoomImageView: UIImageView!
    @IBOutlet var chatContentView: UIView!
    @IBOutlet var chatRoomTitleLabel: UILabel!
    @IBOutlet var lastMessageLabel: UILabel!
    @IBOutlet var sentDateLabel: UILabel!
    
    
    static let identifier: String = "ChatCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        chatRoomImageView.contentMode = .scaleAspectFit
        
        chatRoomTitleLabel.textAlignment = .left
        chatRoomTitleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        
        lastMessageLabel.textAlignment = .left
        lastMessageLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        lastMessageLabel.textColor = .gray
        
        sentDateLabel.textAlignment = .right
        sentDateLabel.font = .systemFont(ofSize: 12, weight: .regular)
        sentDateLabel.textColor = .gray
        
    }
    
    func configure(list: ChatRoom) {
        
        let chatRoomPic = list.chatroomImage
        
        chatRoomImageView.image = UIImage(named: chatRoomPic)
        
        chatRoomTitleLabel.text = list.chatroomName
        
        if list.chatList.count == 0 {
            lastMessageLabel.text = ""
            sentDateLabel.text = ""
        } else {
            lastMessageLabel.text = list.chatList[list.chatList.count-1].message
            sentDateLabel.text = list.chatList[list.chatList.count-1].date
            
        }
        
        
    }
}
