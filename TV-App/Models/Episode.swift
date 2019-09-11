//
//  Episode.swift
//  TV-App
//
//  Created by Angela Garrovillas on 9/11/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import Foundation
struct Episode: Codable {
    let name: String
    let season: Int
    let number: Int
    let summary: String?
    let image: ImageInfo?
    
    static func getEpisodes(url: String,completionHandler: @escaping (Result<[Episode],AppError>) -> ()) {
        NetworkManager.shared.getData(urlString: url) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let episodes = try JSONDecoder().decode([Episode].self, from: data)
                    completionHandler(.success(episodes))
                } catch {
                    print("error in getEpisodes")
                    completionHandler(.failure(.badJSONError))
                }
            }
        }
    }
    func getSeasonEpisode() -> String {
        return "S: \(season) E: \(number)"
    }
}
