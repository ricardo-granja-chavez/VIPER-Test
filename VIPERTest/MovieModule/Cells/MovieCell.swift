//
//  MovieCell.swift
//  VIPERTest
//
//  Created by Ricardo Granja Chávez on 19/04/22.
//

import UIKit

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
              let imageUrl = movie.imageUrl,
              let url = URL(string: imageUrl) else { return }
        
        self.titleLabel.text = title
        self.briefLabel.text = brief
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                if let data = data {
                    self.pictureImageView.image = UIImage(data: data)
                }
            } else {
                debugPrint("No se pudo cargar imagen: \(imageUrl)")
            }
        }
    }
}
