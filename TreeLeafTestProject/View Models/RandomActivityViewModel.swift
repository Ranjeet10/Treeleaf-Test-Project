//
//  RandomActivityViewModel.swift
//  TreeLeafTestProject
//
//  Created by Ranjeet Sah on 13/05/2022.
//

import Foundation
import UIKit.UIImage

public class RandomActivityViewModel {
    
    let type = Box(" ")
    let activity = Box(" ")
    
    
    func fetchRandomActivity() {
        
        RandomActivityService.randomActivityData { [weak self] randomActivityData, error in
            guard
                let self = self,
                let randomActivityData = randomActivityData
            else {
                return
            }
            self.type.value = randomActivityData.type
            self.activity.value = randomActivityData.activity
        }
        
    }
    
}
