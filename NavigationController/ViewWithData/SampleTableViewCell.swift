//
//  SampleTableViewCell.swift
//  SampleCollection
//
//  Created by Jo on 2022/04/05.
//

import UIKit

class SampleTableViewCell: UITableViewCell {
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDesc: UILabel!
    @IBOutlet weak var ivImage: UIImageView!
    
    func setup(title: String, desc: String, imageName: String) {
        lbTitle.text = title
        lbDesc.text = desc
        ivImage.image = UIImage.init(systemName: imageName)
    }
}
