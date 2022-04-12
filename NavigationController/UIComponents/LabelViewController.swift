//
//  LabelViewController.swift
//  SampleCollection
//
//  Created by Jo on 2022/04/08.
//

import UIKit

class LabelViewController: UIViewController {
    
    @IBOutlet weak var lbResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func attributeButtonTouched(_ sender: Any) {

        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
        ]
        lbResult.attributedText = NSMutableAttributedString.init(string: lbResult.text!, attributes: attributes)
    }
    
}
