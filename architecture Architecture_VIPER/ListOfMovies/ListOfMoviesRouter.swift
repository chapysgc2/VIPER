//
//  ListOfMoviesRouter.swift
//  architecture Architecture_VIPER
//
//  Created by Hazel Alain on 25/03/24.
//

import Foundation
import UIKit

protocol ListOfMoviesRouting : AnyObject {
    var detailRouter : DetailRouting? { get }
    var listOfMoviesView : ListOfMoviesView? { get }
    
    func showListOfMovies(window: UIWindow?)
    func showDetailMovie(withMovieId movieId : String)

}

class ListOfMoviesRouter : ListOfMoviesRouting {
    
    var detailRouter : DetailRouting?
    var listOfMoviesView : ListOfMoviesView?

    
    // Método para mostrar la lista de películas
    func showListOfMovies(window: UIWindow?) {
        
        self.detailRouter = DetailRouter()
        // Creamos las instancias de los componentes de VIPER
        // Creamos una instancia de ListOfMoviesPresenter
        let interactor = ListOfMoviesInteractor() // Usando ListofMoviesInteractor que hace la solicitud httpp

        //let interactor = ListOfMoviesInteractorMock() // Usando ListofMoviesInteractorMock que es estatico
        let presenter = ListOfMoviesPresenter(listOfMoviesInteractor: interactor, router: self)

        // Creamos una instancia de ListOfMoviesView pasando el presenter como argumento
        let listOfMoviesView = ListOfMoviesView(presenter: presenter)
        // Asignamos la vista y el presenter
        //view.presenter = presenter
        
        presenter.ui = listOfMoviesView

        
        // Configuramos la vista como la raíz del controlador de la ventana principal
        window?.rootViewController = listOfMoviesView
        window?.makeKeyAndVisible()
    }
    
    func showDetailMovie(withMovieId movieId : String){
        
        guard let fromViewController = listOfMoviesView else {
            return
        }
        
        detailRouter?.showDetail(fromViewController: fromViewController, whitMovieId: movieId)
        
        
    }
}

