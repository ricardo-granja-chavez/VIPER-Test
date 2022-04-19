//
//  MovieViewController.swift
//  VIPERTest
//
//  Created by Ricardo Granja Chávez on 19/04/22.
//

import UIKit
import SVProgressHUD

class MovieViewController: UIViewController {

    var presenter: ViewToPresenterMovieProtocol?
    
    @IBOutlet weak var myTableView: UITableView!
    var arrayList: [MovieModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Movie-Module"
        presenter?.startFetchingMovie()
        SVProgressHUD.show()
        
        myTableView.register(UINib(nibName: MovieCell.identifier, bundle: nil), forCellReuseIdentifier: MovieCell.identifier)
        myTableView.delegate = self
        myTableView.dataSource = self

    }

}

extension MovieViewController: PresenterToViewMovieProtocol {
    
    func onMovieResponseSuccess(movieModelArrayList: [MovieModel]) {
        self.arrayList = movieModelArrayList
        self.myTableView.reloadData()
        SVProgressHUD.dismiss()
        
    }
    
    func onMovieResponseFailed(error: String) {
        SVProgressHUD.dismiss()
        let alert = UIAlertController(title: "Alert", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true)
        
    }
    
    
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { arrayList.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as! MovieCell
        cell.configure(movie: self.arrayList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
