//
//  SampleLibraryViewController.swift
//  SampleCollection
//
//  Created by Jo on 2022/04/21.
//

import UIKit
import Kingfisher

class SampleLibraryViewController: UIViewController {

    @IBOutlet weak var ivTest: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadImage()
    }
    
    func downloadImage() {
//        let url = URL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/logo.png")
//        ivTest.kf.setImage(with: url)
        
        let url = URL(string: "https://t1.daumcdn.net/kakaopay/20211101153709/e90ac3e391.png")
        let processor = DownsamplingImageProcessor(size: ivTest.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        ivTest.kf.indicatorType = .activity
        ivTest.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]) {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }

}
