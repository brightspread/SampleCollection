//
//  CustomTableViewCell.swift
//  SampleCollection
//
//  Created by Jo on 2022/04/05.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDesc: UILabel!
    
    func setup(indexPath: IndexPath) {
        ivImage.image = UIImage.init(systemName: "camera.fill")
        lbTitle.text = "\(indexPath.row) 번째 타이틀"
        lbDesc.text = "설명"
    }
    
    func setup(title: String, desc: String, imageName: String) {
        ivImage.image = UIImage.init(systemName: imageName)
        lbTitle.text = title
        lbDesc.text = desc
    }
}
