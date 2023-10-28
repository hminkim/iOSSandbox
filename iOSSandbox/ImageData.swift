//
//  ImageData.swift
//  iOSSandbox
//
//  Created by kimhyeongmin on 10/28/23.
//

import Foundation

struct ImageData: Codable {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: String
    let downloadURL: String

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}
