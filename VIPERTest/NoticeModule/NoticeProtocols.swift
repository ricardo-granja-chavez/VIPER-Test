//
//  NoticeProtocols.swift
//  VIPERTest
//
//  Created by Ricardo Granja Chávez on 18/04/22.
//

import Foundation
import UIKit

// MARK: - To Presenter
protocol ViewToPresenterProtocol: AnyObject {
    
    var view: PresenterToViewProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }
    
    func startFetchingNotice()
    func showMovieController(navigationController: UINavigationController)
    
}

protocol InteractorToPresenterProtocol: AnyObject {
    func noticeFetchedSuccess(noticeModelArray: [NoticeModel])
    func noticeFetchFailed()
}

// MARK: - To View
protocol PresenterToViewProtocol: AnyObject {
    func showNotice(noticeArray: [NoticeModel])
    func showError()
}

// MARK: - To Router
protocol PresenterToRouterProtocol: AnyObject {
    static func createModule() -> NoticeViewController
    func pushToMovieScreen(navigationConroller: UINavigationController)
}

// MARK: - To Interactor
protocol PresenterToInteractorProtocol: AnyObject {
    var presenter: InteractorToPresenterProtocol? { get set }
    func fetchNotice()
}
