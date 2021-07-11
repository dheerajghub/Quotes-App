//
//  ImagesViewModel.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 07/07/21.
//

import Foundation

class ImageViewModel: ObservableObject {
    
    // MARK: PROPERTIES -
    
    @Published var imagesModel: ImagesModel?
    @Published var isLoading: Bool = true
    
    // MARK: METHODS -
    
    func fetchSearchedImage(for page: Int , search query: String) {
        guard let url = URL(string: Constants.image_base_url + "search/?query=\(query)&page=\(page)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(Constants.pexelsAPIKey, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let images = try JSONDecoder().decode(ImagesModel.self, from: data)
                print(images)
                DispatchQueue.main.async {
                    if page == 1 {
                        self.imagesModel = images
                        self.isLoading = false
                    } else {
                        self.isLoading = false
                        self.imagesModel?.page = images.page
                        self.imagesModel?.per_page = images.per_page
                        self.imagesModel?.total_results = images.total_results
                        self.imagesModel?.photos.append(contentsOf: images.photos)
                    }
                }
            } catch {
                print("Error description: \(error)")
            }
        }.resume()
    }
    
}
