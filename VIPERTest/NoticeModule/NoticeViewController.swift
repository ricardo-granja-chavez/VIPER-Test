//
//  ViewController.swift
//  VIPERTest
//
//  Created by Ricardo Granja Chávez on 18/04/22.
//

import UIKit
import SVProgressHUD

class NoticeViewController: UIViewController {

    var presentor:ViewToPresenterProtocol?
    
    @IBOutlet weak var myTableView: UITableView!
    
    var noticeArrayList: [NoticeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Notice-Module"
        presentor?.startFetchingNotice()
        SVProgressHUD.show()
        
        myTableView.register(UINib(nibName: NoticeCell.identifier, bundle: nil), forCellReuseIdentifier: NoticeCell.identifier)
        myTableView.delegate = self
        myTableView.dataSource = self
        
        
    }

}

extension NoticeViewController:PresenterToViewProtocol{
    
    func showNotice(noticeArray: [NoticeModel]) {

        self.noticeArrayList = noticeArray
        self.myTableView.reloadData()
        SVProgressHUD.dismiss()
        
    }
    
    func showError() {

        SVProgressHUD.dismiss()
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}

extension NoticeViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoticeCell.identifier, for: indexPath) as! NoticeCell
        cell.configure(model: noticeArrayList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentor?.showMovieController(navigationController: self.navigationController!)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
