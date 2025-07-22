//
//  DesignProtocol.swift
//  TravelTalk
//
//  Created by Jude Song on 7/23/25.
//

import Foundation

@objc
protocol DesignProtocol: AnyObject {
    
    @objc optional func configureHierarchy()
    @objc optional func configureLayout()
    func configureView()
    
    
}
