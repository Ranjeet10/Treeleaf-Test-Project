//
//  ViewController.swift
//  TreeLeafTestProject
//
//  Created by Ranjeet Sah on 13/05/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnOpenLeakyVCAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let leakyVC = storyboard.instantiateViewController(withIdentifier: "LeakyVC") as! LeakyVC
        self.navigationController?.pushViewController(leakyVC, animated: true)
        
    }
}

class RetainView: UIView {
    
    weak var vc : UIViewController?
    
    init(vc: UIViewController) {
        super.init(frame: .zero)
        self.vc = vc
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
