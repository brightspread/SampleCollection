//
//  SampleViewController.swift
//  SampleCollection
//
//  Created by Jo on 2022/04/08.
//

import UIKit

class SampleLabelViewController: UIViewController {

    @IBOutlet weak var lbSample: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func TestButtonTouched(_ sender: Any) {
//        lbSample.textColor = .lightGray
             
        if let text = lbSample.text {
            
            let dic = ["dic": "ac",
                       "dica": "ccc"]
            
            //swift 타입추론

            let secondAttributes: [NSMutableAttributedString.Key: Any] = [
                .foregroundColor: UIColor.lightGray,
                .font: UIFont.systemFont(ofSize: 17, weight: .bold)
            ]
            lbSample.attributedText = NSMutableAttributedString.init(string: text, attributes: secondAttributes)
        }
    }
}
