//
//  ChatListCollectionViewController.swift
//  TravelTalk
//
//  Created by Jude Song on 7/20/25.
//

import UIKit

class ChatListCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var searchChatsSearchBar: UISearchBar!
    @IBOutlet var chatListCollectionView: UICollectionView!
    
    let chatListData = ChatList().list
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "TRAVEL TALK"
        
        let xib = UINib(nibName: "ChatCollectionViewCell", bundle: nil)
            
        chatListCollectionView.register(xib, forCellWithReuseIdentifier: ChatCollectionViewCell.identifier)
        
        chatListCollectionView.delegate = self
        chatListCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth - (12 * 1) - (12 * 1)
        
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth * 0.18)
        
        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
//        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        
        chatListCollectionView.collectionViewLayout = layout
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatListData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatCollectionViewCell.identifier, for: indexPath) as! ChatCollectionViewCell
        
        let eachChatListData = chatListData[indexPath.item]
        
        cell.configure(list: chatListData[indexPath.item])
        
        cell.chatRoomImageView.layer.cornerRadius = (cell.bounds.height-24)/2
        cell.chatRoomImageView.clipsToBounds = true
        
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm"
        let currentDate = dateFormatter.date(from: eachChatListData.chatList[eachChatListData.chatList.count-1].date) ?? Date()
        
        dateFormatter.dateFormat = "yy.MM.dd"
        let updatedDate = dateFormatter.string(from: currentDate)
        
        cell.sentDateLabel.text = updatedDate
        
        return cell
    }
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        
////        let viewController = storyBoard.instantiateViewController(withIdentifier: 아직 안 만든 디테일뷰) as! "아직 안 만든 디테일 뷰"
//        
//        
//    }


}
