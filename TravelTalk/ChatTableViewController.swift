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

        let nibName = UINib(nibName: MyChatTableViewCell.myIdentifier, bundle: nil)
        ChatGroundTableView.register(nibName, forCellReuseIdentifier: MyChatTableViewCell.myIdentifier)
        
        ChatGroundTableView.delegate = self
        ChatGroundTableView.dataSource = self
        
        self.ChatGroundTableView.separatorColor = .clear
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return linkedChatData?.chatList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyChatTableViewCell", for: indexPath) as! MyChatTableViewCell
        
        if let linkedChatData = linkedChatData {
            cell.configure(chat: linkedChatData.chatList[indexPath.row])
            
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            
            let currentDate = dateFormatter.date(from: linkedChatData.chatList[indexPath.row].date) ?? Date()
            
            dateFormatter.dateFormat = "HH:mm aa"
            dateFormatter.locale = Locale(identifier: "ko_KR")
            let updatedDate = dateFormatter.string(from: currentDate)
            
            cell.sentTimeLabel.text = updatedDate
            
        }
        
        return cell

    }
    
}
