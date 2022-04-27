//
//  LibraryViewController.swift
//  SampleCollection
//
//  Created by Jo on 2022/04/21.
//

import UIKit

class LibraryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func kingFisherButtonTouched(_ sender: Any) {
        if let kingFisherViewController = storyboard?.instantiateViewController(withIdentifier: "KingFisherViewController") {
            navigationController?.pushViewController(kingFisherViewController, animated: true)
        }
    }
    
    @IBAction func alamofireButtonTouched(_ sender: Any) {
        if let alamofireViewController = storyboard?.instantiateViewController(withIdentifier: "AlamofireViewController") {
            navigationController?.pushViewController(alamofireViewController, animated: true)
        }
    }
}
