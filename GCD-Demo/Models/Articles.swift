//
//  Articles.swift
//  GCD-Demo
//
//  Created by Noor Walid on 09/06/2021.
//

import Foundation

struct Articles: Codable {
    var articles : [Article]
}

struct Article: Codable{
    var title: String
    var description: String
    var publishedAt: String
    var content: String?
}
