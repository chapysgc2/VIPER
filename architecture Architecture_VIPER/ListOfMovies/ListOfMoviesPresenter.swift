//
//  ListOfMoviesPresenter.swift
//  architecture Architecture_VIPER
//
//  Created by Hazel Alain on 25/03/24.
//

import Foundation

protocol ListOfMoviesUI : AnyObject {
    
    func update(movies : [PopularMovieEntity])
    
}

class ListOfMoviesPresenter {
    var ui: ListOfMoviesUI?
    private let listOfMoviesInteractor: ListOfMoviesInteractor
    
    init(listOfMoviesInteractor: ListOfMoviesInteractor) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
    }
    
    func onViewAppear() {
        listOfMoviesInteractor.getListOfMovies { [weak self] result in
            switch result {
            case .success(let models):
                self?.ui?.update(movies: models.results)
            case .failure(let error):
                print("Error fetching movies: \(error)")
            }
        }
    }
}

