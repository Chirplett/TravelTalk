//
//  ChatViewController.swift
//  TravelTalk
//
//  Created by Jude Song on 7/21/25.
//

import UIKit

class ChatTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var ChatGroundTableView: UITableView!
    @IBOutlet var PutMessageTextView: UITextView!
    
    let chatListData = ChatList().list
    var linkedChatData: ChatRoom?
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myNibName = UINib(nibName: MyChatTableViewCell.myIdentifier, bundle: nil)
        ChatGroundTableView.register(myNibName, forCellReuseIdentifier: MyChatTableViewCell.myIdentifier)
        
        let yourNibName = UINib(nibName: YourChatTableViewCell.yourIdentifier, bundle: nil)
        ChatGroundTableView.register(yourNibName, forCellReuseIdentifier: YourChatTableViewCell.yourIdentifier)
        
        
        ChatGroundTableView.delegate = self
        ChatGroundTableView.dataSource = self
        
        self.ChatGroundTableView.separatorColor = .clear
        
        let myName = ChatList.me.name
        
        if let chatList = linkedChatData?.chatList {
            for chat in chatList {
                if chat.user.name != myName {
                    navigationItem.title = chat.user.name
                }
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return linkedChatData?.chatList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myName = ChatList.me.name
        
        if let chat = linkedChatData?.chatList[indexPath.row] {
            
            if chat.user.name == myName {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: MyChatTableViewCell.myIdentifier, for: indexPath) as! MyChatTableViewCell
                cell.configure(chat: chat)
                
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
                let currentDate = dateFormatter.date(from: chat.date) ?? Date()
                dateFormatter.dateFormat = "HH:mm aa"
                dateFormatter.locale = Locale(identifier: "ko_KR")
                let updatedDate = dateFormatter.string(from: currentDate)
                cell.sentTimeLabel.text = updatedDate
                
                return cell
                
            } else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: YourChatTableViewCell.yourIdentifier, for: indexPath) as! YourChatTableViewCell
                cell.configure(chat: chat)
                
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
                let currentDate = dateFormatter.date(from: chat.date) ?? Date()
                dateFormatter.dateFormat = "HH:mm aa"
                dateFormatter.locale = Locale(identifier: "ko_KR")
                let updatedDate = dateFormatter.string(from: currentDate)
                
                cell.sentTimeLabel.text = updatedDate
                
                cell.yourProfileImageView.layer.cornerRadius = cell.yourProfileImageView.frame.height / 2
                cell.yourProfileImageView.clipsToBounds = true
                
                return cell
                
            }
            
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
        
    }
}

