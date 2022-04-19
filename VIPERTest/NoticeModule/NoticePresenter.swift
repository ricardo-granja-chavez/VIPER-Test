//
//  NoticePresenter.swift
//  VIPERTest
//
//  Created by Ricardo Granja Chávez on 18/04/22.
//

import Foundation
import UIKit

class NoticePresenter: ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingNotice() {
        interactor?.fetchNotice()
    }
    
    func showMovieController(navigationController: UINavigationController) {
        router?.pushToMovieScreen(navigationConroller: navigationController)
    }

}

extension NoticePresenter: InteractorToPresenterProtocol {
    
    func noticeFetchedSuccess(noticeModelArray: Array<NoticeModel>) {
        view?.showNotice(noticeArray: noticeModelArray)
    }
    
    func noticeFetchFailed() {
        view?.showError()
    }
    
}
