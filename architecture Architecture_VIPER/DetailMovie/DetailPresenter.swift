//
//  DetailPresenter.swift
//  architecture Architecture_VIPER
//
//  Created by Hazel Alain on 12/04/24.
//

import Foundation

protocol DetailPresenterUI : AnyObject {
    func updateUI(viewModel : DetailMovieViewModel)
}
protocol DetailPresentable : AnyObject {
    var ui : DetailPresenterUI? { get }
    var movieId : String { get }
    func onViewAppear()
}

class DetailPresenter : DetailPresentable {
    weak var ui : DetailPresenterUI?
    public let movieId : String
    private let interactor : DetailInteractable//creamos una referencia a interactor
    private let mapper : MapperDetailMovieViewModel
    
        
    init(movieId : String, interactor : DetailInteractable, mapper : MapperDetailMovieViewModel) {
        self.movieId = movieId
        self.interactor = interactor
        self.mapper = mapper
    }
    
    func onViewAppear(){
        Task {
            
            let model = await interactor.getDetailMovie(withId: movieId)
            let viewModel = mapper.map(entity: model)
            print(viewModel)
            
            await MainActor.run {
                self.ui?.updateUI(viewModel: viewModel)
                print(viewModel)
            }
        }
    }
    
}
