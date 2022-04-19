//
//  MovieRouter.swift
//  VIPERTest
//
//  Created by Ricardo Granja Chávez on 19/04/22.
//

import Foundation
import UIKit

class MovieRouter: PresenterToRouterMovieProtocol {
    
    static var storyboard: UIStoryboard { UIStoryboard(name: "Main", bundle: .main) }
    
    static func createMovieModule() -> MovieViewController {
        
        let view = MovieRouter.storyboard.instantiateViewController(withIdentifier: "MovieViewController") as! MovieViewController
        
        let presenter: ViewToPresenterMovieProtocol & InteractorToPresenterMovieProtocol = MoviePresenter()
        let interactor: PresenterToInteractorMovieProtocol = MovieInteractor()
        let router: PresenterToRouterMovieProtocol = MovieRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
}
