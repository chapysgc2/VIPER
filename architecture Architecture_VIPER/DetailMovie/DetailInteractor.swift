//
//  DetailInteractor.swift
//  architecture Architecture_VIPER
//
//  Created by Hazel Alain on 12/04/24.
//

import Foundation

protocol DetailInteractable: AnyObject {
    func getDetailMovie(withId : String) async -> DetailMovieEntity
}

class DetailInteractor: DetailInteractable {
    
    
    func getDetailMovie(withId id : String) async -> DetailMovieEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=9052eef714cfc2180bcea731a6415776")!
        
        let (data, _) = try! await URLSession.shared.data(from: url)
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try! jsonDecoder.decode(DetailMovieEntity.self, from: data)
    }
}
