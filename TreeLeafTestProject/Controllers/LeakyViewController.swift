//
//  LeakyViewController.swift
//  TreeLeafTestProject
//
//  Created by Ranjeet Sah on 13/05/2022.
//

import UIKit

class LeakyViewController: UIViewController {
        
    var retainView: RetainView?

    override func viewDidLoad() {
        super.viewDidLoad()
        retainView = RetainView(vc: self)
    }

}
