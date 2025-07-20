//
//  ChatListCollectionViewController.swift
//  TravelTalk
//
//  Created by Jude Song on 7/20/25.
//

import UIKit

class ChatListCollectionViewController: UICollectionViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet var searchChatListSearchBar: UISearchBar!
    @IBOutlet var chatListCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "TRAVEL TALK"
        
        let xib = UINib(nibName: "ChatCollectionViewCell", bundle: nil)
        //여기서 왜 아이덴티파이어를 못 쓰지?
            
        chatListCollectionView.register(xib, forCellWithReuseIdentifier: ChatCollectionViewCell.identifier)
        
        chatListCollectionView.delegate = self
        chatListCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth - (12 * 1) - (12 * 1)
        
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth * 0.6)
        
        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 12
        layout.scrollDirection = .vertical
        
        chatListCollectionView.collectionViewLayout = layout
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }



}
