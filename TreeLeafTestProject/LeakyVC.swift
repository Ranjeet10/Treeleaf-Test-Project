//
//  LeakyVC.swift
//  TreeLeafTestProject
//
//  Created by Ranjeet Sah on 13/05/2022.
//

import UIKit

class LeakyVC: UIViewController {
        
    var retainView: RetainView?

    override func viewDidLoad() {
        super.viewDidLoad()
        retainView = RetainView(vc: self)
    }

}
