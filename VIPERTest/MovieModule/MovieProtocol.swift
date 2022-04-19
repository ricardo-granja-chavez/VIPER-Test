//
//  MovieProtocol.swift
//  VIPERTest
//
//  Created by Ricardo Granja Chávez on 19/04/22.
//

import Foundation

protocol ViewToPresenterMovieProtocol: AnyObject {
    
    var view: PresenterToViewMovieProtocol? { get set }
    var interactor: PresenterToInteractorMovieProtocol? { get set }
    var router: PresenterToRouterMovieProtocol? { get set }
    func startFetchingMovie()

}

protocol PresenterToViewMovieProtocol: AnyObject {
    
    func onMovieResponseSuccess(movieModelArrayList: [MovieModel])
    func onMovieResponseFailed(error: String)
    
}

protocol PresenterToRouterMovieProtocol: AnyObject {
    
    static func createMovieModule() -> MovieViewController

}

protocol PresenterToInteractorMovieProtocol: AnyObject {
    
    var presenter:InteractorToPresenterMovieProtocol? { get set }
    func fetchMovie()
    
}

protocol InteractorToPresenterMovieProtocol: AnyObject {
    
    func movieFetchSuccess(movieList: [MovieModel])
    func movieFetchFailed()
    
}
