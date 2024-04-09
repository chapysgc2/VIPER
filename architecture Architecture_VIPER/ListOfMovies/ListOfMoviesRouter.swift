//
//  ListOfMoviesRouter.swift
//  architecture Architecture_VIPER
//
//  Created by Hazel Alain on 25/03/24.
//

import Foundation
import UIKit

class ListOfMoviesRouter {
    
    // Método para mostrar la lista de películas
    func showListOfMovies(window: UIWindow?) {
        
        // Creamos las instancias de los componentes de VIPER
        // Creamos una instancia de ListOfMoviesPresenter
        let interactor = ListOfMoviesInteractor() // Usando ListofMoviesInteractor que hace la solicitud httpp

        //let interactor = ListOfMoviesInteractorMock() // Usando ListofMoviesInteractorMock que es estatico
        let presenter = ListOfMoviesPresenter(listOfMoviesInteractor: interactor)

        // Creamos una instancia de ListOfMoviesView pasando el presenter como argumento
        let view = ListOfMoviesView(presenter: presenter)
        // Asignamos la vista y el presenter
        //view.presenter = presenter
        
        presenter.ui = view

        
        // Configuramos la vista como la raíz del controlador de la ventana principal
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}

