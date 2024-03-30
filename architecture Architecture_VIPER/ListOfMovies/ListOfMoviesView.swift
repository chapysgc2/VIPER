//
//  ListOfMoviesView.swift
//  architecture Architecture_VIPER
//
//  Created by Hazel Alain on 25/03/24.
//

import Foundation
import UIKit


class ListOfMoviesView : UIViewController {
    
    var presenter: ListOfMoviesPresenter? // Declarar como variable

    
    init(presenter: ListOfMoviesPresenter) {
           self.presenter = presenter
           super.init(nibName: nil, bundle: nil)
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        presenter?.onViewAppear()
    }
}

extension ListOfMoviesView : ListOfMoviesUI {
    func update(movies: [PopularMovieEntity]) {
        print("Datos recibidos \(movies)")
    }
}
