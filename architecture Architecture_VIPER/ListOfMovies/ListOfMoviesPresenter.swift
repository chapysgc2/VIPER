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

}

protocol ListOfMoviesUI : AnyObject {
    
    func update(movies : [ViewModel])
    
}

class ListOfMoviesPresenter : ListOfMoviesPresentable {
    weak var ui: ListOfMoviesUI?
    private let listOfMoviesInteractor: ListofMoviesInteractable
    var viewModels : [ViewModel] = []
    
    private let mapper : Mapper

    init(listOfMoviesInteractor: ListofMoviesInteractable, mapper : Mapper = Mapper()) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
        self.mapper = mapper
    }
    
    func onViewAppear() async {
        do {
            let response = try await listOfMoviesInteractor.getListOfMovies()
            let models = response.results
            viewModels = models.map(mapper.map(entity:))
            ui?.update(movies: viewModels)
        } catch {
            print("Error fetching movies: \(error)")
        }
    }

}

