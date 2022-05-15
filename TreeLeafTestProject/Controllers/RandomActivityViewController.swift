//
//  RandomActivityViewController.swift
//  TreeLeafTestProject
//
//  Created by Ranjeet Sah on 13/05/2022.
//

import UIKit

class RandomActivityViewController: UIViewController {
    
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    
    private let viewModel = RandomActivityViewModel()
    
    override func viewDidLoad() {
        self.viewModel.fetchRandomActivity()
        
        viewModel.activity.bind { [weak self] activity in
            self?.activityLabel.text = activity
        }
        
        viewModel.type.bind { [weak self] type in
            self?.typeLabel.text = type
        }
        
    }
    
    @IBAction func changeRandomActivity(_ sender: Any) {
        self.viewModel.fetchRandomActivity()
    }
}
