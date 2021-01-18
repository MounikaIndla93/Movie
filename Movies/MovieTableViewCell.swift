//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by PTGHYD on 18/01/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static var identifier = "MovieTableViewCell"

    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblTitleMovie: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblVoteCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
