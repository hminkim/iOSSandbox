//
//  DataManager.swift
//  iOSSandbox
//
//  Created by kimhyeongmin on 10/28/23.
//

import Foundation

final class DataManager {
    
    func performRequest(with urlString: String, completion: @escaping ([ImageData]?) -> Void) {
            
        // URL 구조체
        guard let url = URL(string: urlString) else { return }
            
        // URLSession 생성
        URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                completion(nil)
                return
            }
            
            guard let safeData = data else {
                completion(nil)
                return
            }
            
            // 데이터 분석하기
            if let imageData = self.parseJSON(safeData) {
                completion(imageData)
            } else {
                completion(nil)
            }
        }.resume()   // 일시정지된 상태로 작업이 시작하기 때문
    }

    func parseJSON(_ jsonData: Data) -> [ImageData]? {
        let imageData = try? JSONDecoder().decode([ImageData].self, from: jsonData)
        return imageData
    }
}
