//
//  Networking.swift
//  GCD-Demo
//
//  Created by Noor Walid on 09/06/2021.
//

import Foundation

struct Networking {
    
    let url = URL(string: Constants.apiKey)!
    
    
   func fetchArticles() {
        if let data = try? Data(contentsOf: url){
            //Data received, parse it
            parse(data: data)
            let task = URLSession.shared.dataTask(with: url)
                
                //parse()
                task.resume()
            } else {
                print("error fetching data.")
            }
    }
    
func parse(data: Data) {
    var articles = [Article]()
        if let decoder = try? JSONDecoder().decode(Articles.self, from: data) {
            articles = decoder.articles
            print(articles)
    }
}
    
    
}
