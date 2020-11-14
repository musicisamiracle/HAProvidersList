//
//  ListTableViewCell.swift
//  HAProvidersList
//
//  Created by Dane Thomas on 11/14/20.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        self.ratingLabel.font = UIFont.systemFont(ofSize: 16)
    }
    

    override func prepareForReuse() {
        super.prepareForReuse()
        self.nameLabel.text = ""
        self.ratingLabel.text = ""
        self.ratingLabel.textColor = .black
    }

}
