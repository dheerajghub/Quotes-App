//
//  AuthorsViewModel.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import Foundation

class AuthorsViewModel: ObservableObject {
    
    let apiURL = Constants.get_authors_url
    let authorWithSlugname  = Constants.get_author_with_slugname
    
    @Published var authorsModel: AuthorsModel?
    @Published var isLoading: Bool = true
    
    func fetchAuthors(for page: Int) {
        guard let url = URL(string: apiURL + "?page=\(page)") else { return }
        URLSession.shared.dataTask(with: url) { (data , response , error) in
            guard let data = data else { return }
            do {
                let authors = try JSONDecoder().decode(AuthorsModel.self, from: data)
                DispatchQueue.main.async {
                    self.isLoading = false
                    if page == 1 {
                        self.authorsModel = authors
                    } else {
                        self.authorsModel?.page = authors.page
                        self.authorsModel?.totalCount = authors.totalCount
                        self.authorsModel?.results.append(contentsOf: authors.results)
                    }
                }
            } catch {
                print("Error description: \(error)")
            }
        }.resume()
    }
    
    func fetchAuthorWithSlug( with slugname: String) {
        guard let url = URL(string: authorWithSlugname + slugname) else { return }
        URLSession.shared.dataTask(with: url) { (data , response , error) in
            guard let data = data else { return }
            do {
                let author = try JSONDecoder().decode(AuthorsModel.self, from: data)
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.authorsModel = author
                }
            } catch {
                print("Error description: \(error)")
            }
        }.resume()
    }
    
}
