//
//  MoviePresenter.swift
//  VIPERTest
//
//  Created by Ricardo Granja Chávez on 19/04/22.
//

import Foundation

class MoviePresenter: ViewToPresenterMovieProtocol {
    
    var view: PresenterToViewMovieProtocol?
    var interactor: PresenterToInteractorMovieProtocol?
    var router: PresenterToRouterMovieProtocol?
    
    func startFetchingMovie() {
        interactor?.fetchMovie()
    }
    
}

extension MoviePresenter: InteractorToPresenterMovieProtocol {
    
    func movieFetchSuccess(movieList: [MovieModel]) {
        view?.onMovieResponseSuccess(movieModelArrayList: movieList)
    }
    
    func movieFetchFailed() {
        view?.onMovieResponseFailed(error: "Some Error message from api response")
    }
    
    
}
