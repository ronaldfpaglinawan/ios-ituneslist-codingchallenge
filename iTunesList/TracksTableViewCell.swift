//
//  TracksTableViewCell.swift
//  iTunesList
//
//  Created by Ronald Fornis Paglinawan on 15/06/21.
//

import UIKit

class TracksTableViewCell: UITableViewCell {

    /// IBOutlets
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    // MARK: - Default Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
