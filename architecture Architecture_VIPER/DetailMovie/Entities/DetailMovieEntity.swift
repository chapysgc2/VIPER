//
//  DetailMovieEntity.swift
//  architecture Architecture_VIPER
//
//  Created by Hazel Alain on 12/04/24.
//

import Foundation


struct DetailMovieEntity : Decodable {
    let title : String
    let overview: String
    let backdropPath: String
    let status : String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int

}
