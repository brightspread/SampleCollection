//
//  KingFisherViewController.swift
//  SampleCollection
//
//  Created by Jo on 2022/04/21.
//

import UIKit
import Kingfisher

class KingFisherViewController: UIViewController {
    
    @IBOutlet weak var ivTest: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadImage()
    }
    
    private func downloadImage() {
        if let url = URL(string: "https://t1.daumcdn.net/kakaopay/20211101153527/f9f1b12af0.png") {
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
}
