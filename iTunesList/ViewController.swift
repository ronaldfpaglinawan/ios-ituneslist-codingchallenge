//
//  ViewController.swift
//  iTunesList
//
//  Created by Ronald Fornis Paglinawan on 15/06/21.
//

import SDWebImage
import UIKit

class ViewController: UIViewController {
    
    /// IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    /// Class level variables and constants
    var totalResults = 0
    var totalWrapperTrack = 0
    var trackIdArray: [Int] = []
    var trackNameArray: [String] = []
    var priceArray: [Float] = []
    var genreArray: [String] = []
    var artImagesArray60: [String] = []
    var artImagesArray100: [String] = []
    var descriptionArray: [String] = []
    
    let customURL = "https://itunes.apple.com/search?term=star&amp;country=au&amp;media=movie&amp;all"
    
    
    /// ViewDidLoad Method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        performRequest(urlString: customURL)
        
        do {
            sleep(1)
        }
    }
    
    /// Method for performing requests to the server using URLSession
    func performRequest(urlString: String) {
        // Create a URL
        if let url = URL(string: urlString) {
            
            // Create a URLSession
            let session = URLSession(configuration: .default)
            
            // Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(webData: safeData)
                }
            }
            
            // Start the task
            task.resume()
        }
    }
    
    /// Method for parsing and converting the data to JSON
    func parseJSON(webData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CustomData.self, from: webData)
            
            totalResults = decodedData.resultCount
            
            for i in 1...totalResults {
                
                if decodedData.results[i-1].wrapperType == "track" {
                    trackIdArray.append(decodedData.results[i-1].trackId ?? 0)
                    trackNameArray.append(decodedData.results[i-1].trackName ?? "Track Name")
                    priceArray.append(decodedData.results[i-1].trackPrice ?? 0.00)
                    genreArray.append(decodedData.results[i-1].primaryGenreName ?? "Unknown Genre")
                    artImagesArray60.append(decodedData.results[i-1].artworkUrl60 ?? "No Image")
                    artImagesArray100.append(decodedData.results[i-1].artworkUrl100 ?? "No Image")
                    descriptionArray.append(decodedData.results[i-1].longDescription ?? "No Description")
                    
                    totalWrapperTrack = totalWrapperTrack + 1
                }
            }
        } catch {
            print(error)
        }
    }

}


// MARK: - UITableViewDataSource Protocols
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalWrapperTrack
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TracksTableViewCell
        
        cell?.artworkImageView.sd_setImage(with: URL(string: artImagesArray60[indexPath.row]),
                                          placeholderImage: UIImage(systemName: "photo"),
                                          options: .continueInBackground,
                                          completed: nil)
        cell?.trackNameLabel.text = trackNameArray[indexPath.row]
        cell?.priceLabel.text = String(priceArray[indexPath.row])
        cell?.genreLabel.text = genreArray[indexPath.row]
        
        return cell!
    }
}

// MARK: - UITableViewDelegate Protocol
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        
        vc?.title = trackNameArray[indexPath.row]
        vc?.imageURLString = artImagesArray100[indexPath.row]
        vc?.trackName = trackNameArray[indexPath.row]
        vc?.price = priceArray[indexPath.row]
        vc?.genre = genreArray[indexPath.row]
        vc?.longDescription = descriptionArray[indexPath.row]
        
        navigationController?.pushViewController(vc!, animated: true)
    }
}



