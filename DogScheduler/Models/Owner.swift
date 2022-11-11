//
//  owners.swift
//  DogScheduler
//
//  Created by Samuel Tse on 11/10/22.
//

import Foundation

struct Owner: Codable {
    var id: Int
    var dogs: [Int]
    var name: String
}

