//
//  MyChatTableViewCell.swift
//  TravelTalk
//
//  Created by Jude Song on 7/21/25.
//

import UIKit

class MyChatTableViewCell: UITableViewCell {
    
    
    @IBOutlet var chatBubbleView: UIView!
    @IBOutlet var myMessageLabel: UILabel!
    @IBOutlet var sentTimeLabel: UILabel!
    
    static let myIdentifier = "MyChatTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        chatBubbleView.layer.cornerRadius = 10
        chatBubbleView.layer.borderColor = UIColor.gray.cgColor
        chatBubbleView.layer.borderWidth = 1
        chatBubbleView.backgroundColor = .systemGray6
        chatBubbleView.clipsToBounds = true
        
        myMessageLabel.textAlignment = .left
        myMessageLabel.font = .systemFont(ofSize: 12, weight: .medium)
        myMessageLabel.numberOfLines = 0
        myMessageLabel.text = ""
        
        sentTimeLabel.textAlignment = .center
        sentTimeLabel.font = .systemFont(ofSize: 10, weight: .regular)
        sentTimeLabel.textColor = .gray
        sentTimeLabel.text = ""
        
    }
    
    func configure(chat: Chat) {
        
        myMessageLabel.text = chat.message
        
        
    }

   
}
