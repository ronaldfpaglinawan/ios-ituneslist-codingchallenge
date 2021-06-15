//
//  DetailViewController.swift
//  iTunesList
//
//  Created by Ronald Fornis Paglinawan on 15/06/21.
//

import SDWebImage
import UIKit

class DetailViewController: UIViewController {

    /// IBOutlets
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    /// Class level variables and constants
    var imageURLString = ""
    var trackName = ""
    var price:Float = 0.00
    var genre = ""
    var longDescription = ""
    
    
    /// ViewDidLoad Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // assign the values received from ViewController
        artworkImageView.sd_setImage(with: URL(string: imageURLString),
                                     placeholderImage: UIImage(systemName: "photo"),
                                     options: .continueInBackground,
                                     completed: nil)
        trackNameLabel.text = trackName
        priceLabel.text = String(price)
        genreLabel.text = genre
        descriptionTextView.text = longDescription
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
