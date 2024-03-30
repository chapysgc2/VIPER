//
//  PopularMovieEntity.swift
//  architecture Architecture_VIPER
//
//  Created by Hazel Alain on 25/03/24.
//

import Foundation

struct PopularMovieEntity: Decodable {
    let id: Int
    let title: String
    let overview: String
    let imageURL: String
    let votes: Double
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case imageURL = "poster_path"
        case votes = "vote_average"
    }
}
