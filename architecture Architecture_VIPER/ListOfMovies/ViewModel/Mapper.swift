//
//  Mapper.swift
//  architecture Architecture_VIPER
//
//  Created by Hazel Alain on 08/04/24.
//

import Foundation

struct Mapper {
    
    func map(entity : PopularMovieEntity) -> ViewModel {
        ViewModel(title: entity.title,
                  overview: entity.overview,
                  imageURL: URL(string: "https://image.tmdb.org/t/p/w200" + entity.imageURL ))
    }
}
