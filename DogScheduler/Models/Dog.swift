//
//  dogs.swift
//  DogScheduler
//
//  Created by Samuel Tse on 11/10/22.
//

import Foundation

struct Dog: Codable {
    var id: Int
    var name: String
    var thumbnail_image_url: String
    var friends: [Int]?
    var enemies:  [Int]?
}
