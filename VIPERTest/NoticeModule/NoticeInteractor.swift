//
//  NoticeInteractor.swift
//  VIPERTest
//
//  Created by Ricardo Granja Chávez on 18/04/22.
//

import Foundation

class NoticeInteractor: PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    
    func fetchNotice() {
        let jsonString = """
            [
                {
                  "id": "1",
                  "title": "Notice 1",
                  "brief": "Notice1 is the legal concept describing a requirement that a party be aware of legal process affecting their rights, obligations or duties.",
                  "filesource": "http://mobotechnology.com/uploads/appnotice/est.pdf"
                },
                {
                  "id": "2",
                  "title": "Notice 2",
                  "brief": "Notice2 is the legal concept describing a requirement that a party be aware of legal process affecting their rights, obligations or duties.",
                  "filesource": "http://mobotechnology.com/uploads/appnotice/est.pdf"
                },
                {
                  "id": "3",
                  "title": "Notice 3",
                  "brief": "Notice3 is the legal concept describing a requirement that a party be aware of legal process affecting their rights, obligations or duties.",
                  "filesource": "http://mobotechnology.com/uploads/appnotice/est.pdf"
                }
              ]
            """
        let jsonData = Data(jsonString.utf8)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            do {
                let notices = try JSONDecoder().decode([NoticeModel].self, from: jsonData)
                self.presenter?.noticeFetchedSuccess(noticeModelArray: notices)
            } catch {
                self.presenter?.noticeFetchFailed()
            }
        }
    }
}
