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
    var ui : ListOfMoviesUI? //creamos nuestra propiedad ui para poder usar el protocolo ListOfMoviesUI y este sera opcional
    //Esto va de la mano
    private let listOfMoviesInteractor : ListOfMoviesInteractor //creamos una referencia o propiedad a nuestro interactor
    init(listOfMoviesInteractor: ListOfMoviesInteractor) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
    }
    
    //hasta init
    
    //creamos el metodo onViewAppear, este emtodo llamara el interactor para realizar la solicitud http
    
    func onViewAppear() {
        
        Task {
            let models = await listOfMoviesInteractor.getListOfMovies() //aqui en la constante models se guarda lo que arroje la solicitud del interactor
            ui?.update(movies: models.result) //le pasamos el modelo
        }
        
    }
}
