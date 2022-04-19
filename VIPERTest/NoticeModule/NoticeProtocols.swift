//
//  NoticeProtocols.swift
//  VIPERTest
//
//  Created by Ricardo Granja Chávez on 18/04/22.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: AnyObject {
    
    var view: PresenterToViewProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }
    
    func startFetchingNotice()
    func showMovieController(navigationController: UINavigationController)

}

protocol PresenterToViewProtocol: AnyObject {
    func showNotice(noticeArray: [NoticeModel])
    func showError()
}

protocol PresenterToRouterProtocol: AnyObject {
    static func createModule() -> NoticeViewController
    func pushToMovieScreen(navigationConroller: UINavigationController)
}

protocol PresenterToInteractorProtocol: AnyObject {
    var presenter: InteractorToPresenterProtocol? { get set }
    func fetchNotice()
}

protocol InteractorToPresenterProtocol: AnyObject {
    func noticeFetchedSuccess(noticeModelArray: [NoticeModel])
    func noticeFetchFailed()
}
