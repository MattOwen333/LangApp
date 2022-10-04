//
//  DetailViewController.swift
//  LangApp
//
//  Created by Matthew Owen on 8/24/22.
//

import Foundation
import UIKit

class DetailViewController : UIViewController {
    
    @IBOutlet weak var detailLabel: UILabel!
    
    
    var detailText : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        detailLabel.text = detailText
    }
}
