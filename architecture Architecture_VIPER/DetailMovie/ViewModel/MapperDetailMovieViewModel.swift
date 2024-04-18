//
//  MapperDetailMovieViewModel.swift
//  architecture Architecture_VIPER
//
//  Created by Hazel Alain on 12/04/24.
//

import Foundation

struct MapperDetailMovieViewModel {
    func map(entity : DetailMovieEntity) -> DetailMovieViewModel { //transforma del modelo a al modelo b
        .init(title: entity.title,
              overview: entity.overview,
              backdropPath: URL(string: "https://image.tmdb.org/t/p/w200" + entity.backdropPath))
    }
}
