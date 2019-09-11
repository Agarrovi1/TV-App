//
//  TVShowAPIHelper.swift
//  TV-App
//
//  Created by Angela Garrovillas on 9/10/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//
//
import Foundation
class UrlHolder {
    let shows = "https://api.tvmaze.com/shows"
    func searchShowsQuery(string: String) -> String {
        return "http://api.tvmaze.com/search/shows?q=\(string.lowercased())"
    }
    func episode(by id: Int) -> String {
        return "http://api.tvmaze.com/shows/\(id)/episodes"
    }
}


