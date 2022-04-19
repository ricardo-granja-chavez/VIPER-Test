//
//  NoticeCell.swift
//  VIPERTest
//
//  Created by Ricardo Granja Chávez on 18/04/22.
//

import UIKit

class NoticeCell: UITableViewCell {

    static let identifier = "NoticeCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var briefLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(model: NoticeModel) {
        titleLabel.text = model.title
        briefLabel.text = model.brief
    }
    
}
