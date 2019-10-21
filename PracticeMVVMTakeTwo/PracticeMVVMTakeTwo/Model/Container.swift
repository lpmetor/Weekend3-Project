//
//  Container.swift
//  PracticeMVVMTakeTwo
//
//  Created by Christopher Pung on 10/19/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import UIKit

struct Container: Decodable{
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
    init?(dict: [String: Any]){
        guard let albumId = dict["albumId"]as? Int,
        let id = dict["id"]as? Int,
        let title = dict["title"]as? String,
        let url = dict["url"]as? String,
        let thumbnailUrl = dict["thumbnailUrl"]as? String else{
            return nil
        }
        self.albumId = albumId
        self.id = id
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }
    func getSmallImage(completion: @escaping (UIImage?) -> Void) {
        cache.downloadFrom(endpoint: thumbnailUrl) { dat in
            if let data = dat {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            }
        }
    }
    func getBigImage(completion: @escaping (UIImage?) -> Void) {
        cache.downloadFrom(endpoint: url) { dat in
            if let data = dat {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            }
        }
    }
}
