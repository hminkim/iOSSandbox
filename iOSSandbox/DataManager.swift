//
//  DataManager.swift
//  iOSSandbox
//
//  Created by kimhyeongmin on 10/28/23.
//

import Foundation

final class DataManager {
    func parseJSON(_ jsonData: Data) -> [ImageData]? {
        let imageData = try? JSONDecoder().decode([ImageData].self, from: jsonData)
        return imageData
    }
}
