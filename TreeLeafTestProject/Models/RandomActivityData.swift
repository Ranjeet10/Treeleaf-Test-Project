//
//  RandomActivityData.swift
//  TreeLeafTestProject
//
//  Created by Ranjeet Sah on 13/05/2022.
//

import Foundation

// API used https://www.boredapi.com/api/activity
struct RandomActivityData: Decodable {
    
    //MARK: - JSON Decodables
    let activity: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case activity = "activity"
        case type = "type"
    }
    
    
}



