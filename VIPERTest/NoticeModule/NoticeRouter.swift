//
//  NoticeRouter.swift
//  VIPERTest
//
//  Created by Ricardo Granja Chávez on 18/04/22.
//

import Foundation
import UIKit

class NoticeRouter: PresenterToRouterProtocol {
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "Main",bundle: Bundle.main)
    }
    
    static func createModule() -> NoticeViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "NoticeViewController") as! NoticeViewController
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
    
    func pushToMovieScreen(navigationConroller navigationController:UINavigationController) {
//        let movieModue = MovieRouter.createMovieModule()
//        navigationController.pushViewController(movieModue,animated: true)
    }
    
}
