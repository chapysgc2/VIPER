//
//  ListOfMoviesPresenter.swift
//  architecture Architecture_VIPER
//
//  Created by Hazel Alain on 25/03/24.
//

import Foundation

protocol ListOfMoviesPresentable : AnyObject {
    
    var ui : ListOfMoviesUI? { get }
    var viewModels : [ViewModel] { get }
    func onViewAppear() async
    
    func onTapCell(atIndex: Int)

}

protocol ListOfMoviesUI : AnyObject {
    
    func update(movies : [ViewModel])
    
}

class ListOfMoviesPresenter : ListOfMoviesPresentable {
    
    
    weak var ui: ListOfMoviesUI?
    private let listOfMoviesInteractor: ListofMoviesInteractable
    var viewModels : [ViewModel] = []
    
    private var models : [PopularMovieEntity] = []
    
    private let mapper : Mapper
    
    private let router : ListOfMoviesRouting

    init(listOfMoviesInteractor: ListofMoviesInteractable, mapper : Mapper = Mapper(), router : ListOfMoviesRouting) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
        self.mapper = mapper
        self.router = router
    }
    
    func onViewAppear() async {
        do {
            let response = try await listOfMoviesInteractor.getListOfMovies()
            models = response.results
            viewModels = models.map(mapper.map(entity:))
            ui?.update(movies: viewModels)
        } catch {
            print("Error fetching movies: \(error)")
        }
    }

    func onTapCell(atIndex: Int) {
        let movieId = models[atIndex].id
        print(movieId)
        router.showDetailMovie(withMovieId: movieId.description)

    }
}

