//
//  ListOfMoviesInteractor.swift
//  architecture Architecture_VIPER
//
//  Created by Hazel Alain on 25/03/24.
//
//9052eef714cfc2180bcea731a6415776

import UIKit
import Foundation

class ListOfMoviesInteractor {
    
    func getListOfMovies() async -> PopularMovieResponseEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?apikey=9052eef714cfc2180bcea731a6415776")!
        
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
        
    }
}
