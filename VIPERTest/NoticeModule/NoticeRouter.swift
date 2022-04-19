//
//  NoticeRouter.swift
//  VIPERTest
//
//  Created by Ricardo Granja Chávez on 18/04/22.
//

import Foundation
import UIKit

class NoticeRouter: PresenterToRouterProtocol {
    
    static var storyboard: UIStoryboard { UIStoryboard(name: "Main", bundle: .main) }
    
    static func createModule() -> NoticeViewController {
        let view = storyboard.instantiateViewController(withIdentifier: "NoticeViewController") as! NoticeViewController
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = NoticePresenter()
        let interactor: PresenterToInteractorProtocol = NoticeInteractor()
        let router: PresenterToRouterProtocol = NoticeRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    func pushToMovieScreen(navigationConroller navigationController: UINavigationController) {
        let movieModule = MovieRouter.createMovieModule()
        navigationController.pushViewController(movieModule, animated: true)
    }
    
}
