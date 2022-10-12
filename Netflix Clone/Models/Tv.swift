//
//  Tv.swift
//  Netflix Clone
//
//  Created by Карина Дудка on 12.10.2022.
//

import Foundation

struct TrendingTvsResponse: Codable {
    let results: [Tv]
    
}

struct Tv: Codable {
        let id: Int
        let mediaType: String?
        let originalName: String?
        let overview: String?
        let originalTitle: String?
        let voteCount: Int
        let posterPath: String?
        let releaseDate: String?
        let voteAverage: Double
        
        
    enum CodingKeys: String, CodingKey {
        case overview
        case id
        case mediaType = "media_type"
        case originalName = "original_name"
        case originalTitle = "original_title"
        case voteCount = "vote_count"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        
      }
}
