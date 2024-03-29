//
//  PopularMovieEntity.swift
//  architecture Architecture_VIPER
//
//  Created by Hazel Alain on 25/03/24.
//

import Foundation

struct PopularMovieEntity : Decodable {
    var id :Int
    var title : String
    var overview : String
    var imageURL : String
    var votes : Double
    
    enum Codingkeys : String, CodingKey {
        case id, title, overview
        case imageURL = "poster_path"
        case votes
    }
    
}
