//
//  MovieCell.swift
//  VIPERTest
//
//  Created by Ricardo Granja Chávez on 19/04/22.
//

import UIKit
import Alamofire
import AlamofireImage

class MovieCell: UITableViewCell {
    
    static let identifier = "MovieCell"
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var briefLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(movie: MovieModel) {
        guard let title = movie.title,
              let brief = movie.brief,
              let imageUrl = movie.imageUrl else { return }
        
        self.titleLabel.text = title
        self.briefLabel.text = brief
        
        Alamofire.request(imageUrl).responseData { (response) in
            if response.error == nil {
                if let data = response.data {
                    self.pictureImageView.image = UIImage(data: data)
                }
            }
        }
    }
}
