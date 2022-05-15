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
    
    @IBAction func btnOpenLeakyViewControllerAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let LeakyViewController = storyboard.instantiateViewController(withIdentifier: "LeakyViewController") as! LeakyViewController
        self.navigationController?.pushViewController(LeakyViewController, animated: true)
        
    }
    
    @IBAction func btnCallAPIAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let LeakyViewController = storyboard.instantiateViewController(withIdentifier: "RandomActivityViewController") as! RandomActivityViewController
        self.navigationController?.pushViewController(LeakyViewController, animated: true)
        
    }
}

class RetainView: UIView {
    
    //Handle leak. Weak variable used for breaking the retain cycle.
    weak var vc : UIViewController?
    
    init(vc: UIViewController) {
        super.init(frame: .zero)
        self.vc = vc
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
