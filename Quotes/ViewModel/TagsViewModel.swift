//
//  TagsViewModel.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import Foundation

class TagsViewModel: ObservableObject {
    
    // MARK: PROPERTIES -
    
    let tagUrl = Constants.get_tags_url
    
    @Published var tagsModel: [TagsModel]?
    @Published var isLoading: Bool = true
    
    // MARK: METHODS -
    
    func fetchTags() {
        guard let url = URL(string: tagUrl) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let tags = try JSONDecoder().decode([TagsModel].self, from: data)
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.tagsModel = tags
                }
            } catch {
                print("Error description: \(error)")
            }
        }.resume()
    }
    
}

