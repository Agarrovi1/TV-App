//
//  ImageHelper.swift
//  TV-App
//
//  Created by Angela Garrovillas on 9/10/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
import UIKit
class ImageHelper {
    func getImage(urlString: String,completionHandler: @escaping (Result<UIImage,AppError>) -> ()) {
        NetworkManager.shared.getData(urlString: urlString) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                if let imageFromData = UIImage(data: data) {
                completionHandler(.success(imageFromData))
                } else {
                    completionHandler(.failure(.badImageData))
                }
            }
        }
    }
}
