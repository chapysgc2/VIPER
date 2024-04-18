//
//  DetailRouter.swift
//  architecture Architecture_VIPER
//
//  Created by Hazel Alain on 12/04/24.
//

import Foundation
import UIKit

protocol DetailRouting : AnyObject {
    func showDetail(fromViewController : UIViewController, whitMovieId movieId : String)
}
class DetailRouter: DetailRouting {
    
    func showDetail(fromViewController : UIViewController, whitMovieId movieId : String) {
        
        let interactor = DetailInteractor()
        let presenter = DetailPresenter(movieId: movieId, interactor: interactor, mapper: MapperDetailMovieViewModel())
        
        let view = DetailView(presenter: presenter)
        presenter.ui = view
        
        
        fromViewController.present(view, animated : true)
    }
    
}
