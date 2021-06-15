//
//  CustomData.swift
//  iTunesList
//
//  Created by Ronald Fornis Paglinawan on 15/06/21.
//

import Foundation

/// Struct for the outer most node/data
struct CustomData: Decodable {
    let resultCount: Int
    let results: [Results]
}

/// Struct for the nodes/data inside the results array
struct Results: Decodable {
    var wrapperType: String? = ""
    var trackId: Int? = 0
    var trackName: String? = ""
    var trackPrice: Float? = 9.99
    var primaryGenreName: String? = ""
    var artworkUrl60: String? = ""
    var artworkUrl100: String? = ""
    var longDescription: String? = ""
}
