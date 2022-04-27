//
//  AlamofireViewController.swift
//  SampleCollection
//
//  Created by Jo on 2022/04/27.
//

import UIKit
import Alamofire

class AlamofireViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let query = ["query": "apple"]
        let header: HTTPHeaders = ["X-Naver-Client-Id": "xd5WmkaxTTKYFMqaAqkf",
                                   "X-Naver-Client-Secret": "D59FMGZyOx"]
        
        AF.request("https://openapi.naver.com/v1/search/blog.json",
                   method: .get,
                   parameters: query,
                   headers: header)
            .responseDecodable(completionHandler: { (response : DataResponse<Blog, AFError>) in
                NSLog("response : \(response)")
                switch (response.result) {
                case .success(let data):
                    NSLog("data : \(data)")
                default:
                    NSLog("response: \(response)")
                }
            })
    }
}

// MARK: - Blog
struct Blog: Codable {
    let lastBuildDate: String
    let total, start, display: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let title: String
    let link: String
    let itemDescription, bloggername: String
    let bloggerlink: String
    let postdate: String
    
    enum CodingKeys: String, CodingKey {
        case title, link
        case itemDescription = "description"
        case bloggername, bloggerlink, postdate
    }
}

//
//
//func searchBlogs() {
//    let params = ["query": "apple"]
//    let headers: HTTPHeaders = ["X-Naver-Client-Id": "KYCTGWa967jhznNB3pKb",
//                                "X-Naver-Client-Secret": "GY9zt3XlS_"]
//    AF.request("https://openapi.naver.com/v1/search/blog.json",
//               method: .get,
//               parameters: params,
//               encoding: URLEncoding.default,
//               headers: headers)
//        .responseDecodable(completionHandler: { (response : DataResponse<Search, AFError>) in
//            NSLog("response : \(response)")
//            switch (response.result) {
//            case .success(let data):
//                NSLog("data : \(data)")
//            default:
//                NSLog("response: \(response)")
//            }
//        })
//
//}
