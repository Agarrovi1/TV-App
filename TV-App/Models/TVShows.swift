//
//  TVShows.swift
//  TV-App
//
//  Created by Angela Garrovillas on 9/10/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
struct TVShows: Codable {
    let shows: ShowInfo
    
    static func getShows(from urlString:String, completionHandler: @escaping (Result<[TVShows],AppError>) -> ()) {
        NetworkManager.shared.getData(urlString: urlString) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                let shows = try JSONDecoder().decode([TVShows].self, from: data)
                    completionHandler(.success(shows))
                } catch {
                    completionHandler(.failure(.badJSONError))
                }
            }
        }
    }
}

struct ShowInfo: Codable {
    let id: Int
    let name: String
    let rating: Rating
    let image: ImageInfo
}

struct Rating: Codable {
    let average: Double
}

struct ImageInfo: Codable {
    let medium: String
    let original: String
}
