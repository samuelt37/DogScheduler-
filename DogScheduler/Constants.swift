//
//  Constants.swift
//  DogScheduler
//
//  Created by Samuel Tse on 11/10/22.
//

import Foundation

struct Constants {
    static let jsonOwnerString = #"""
            [
                {
                    "id": 1,
                    "dogs": [648616841],
                    "name": "Owner 1"
                },
                {
                    "id": 2,
                    "dogs": [121648332, 3151823],
                    "name": "Owner 2"
                },
                {
                    "id": 3,
                    "dogs": [8382917],
                    "name": "Owner 3"
                },
                {
                    "id": 4,
                    "dogs": [9585212],
                    "name": "Owner 4"
                },
                {
                    "id": 5,
                    "dogs": [121212, 1529828],
                    "name": "Owner 5"
                },
                {
                    "id": 6,
                    "dogs": [91482821],
                    "name": "Owner 6"
                },
                {
                    "id": 8,
                    "dogs": [261988],
                    "name": "Owner 8"
                }
            ]
            """#
    
    static let jsonScheduleString = #"""
            [
                {
                    "dog_id": 648616841,
                    "start": "2022-10-01T13:00:00",
                    "end": "2022-10-01T16:00:00"
                },
                {
                    "dog_id": 648616841,
                    "start": "2022-10-01T07:00:00",
                    "end": "2022-10-01T09:00:00"
                },
                {
                    "dog_id": 8382917,
                    "start": "2022-10-01T14:00:00",
                    "end": "2022-10-01T16:00:00"
                },
                {
                    "dog_id": 121648332,
                    "start": "2022-10-01T18:00:00",
                    "end": "2022-10-01T19:00:00"
                },
                {
                    "dog_id": 3151823,
                    "start": "2022-10-01T09:00:00",
                    "end": "2022-10-01T11:00:00"
                },
                {
                    "dog_id": 9585212,
                    "start": "2022-10-01T08:00:00",
                    "end": "2022-10-01T10:00:00"
                },
                {
                    "dog_id": 1529828,
                    "start": "2022-10-01T19:00:00",
                    "end": "2022-10-01T20:00:00"
                },
                {
                    "dog_id": 261988,
                    "start": "2022-10-01T15:00:00",
                    "end": "2022-10-01T19:00:00"
                }
            ]
            """#
    
    static let jsonDogsString = #"""
            [
                {
                    "id": 648616841,
                    "name": "Günter",
                    "thumbnail_image_url": "shepkita-adult.jpg",
                    "friends": [121648332, 8382917],
                    "enemies": [261988, 1529828]
                },
                {
                    "id": 8382917,
                    "name": "Max",
                    "thumbnail_image_url": "shepkita-puppy.jpg",
                    "friends": [648616841]
                },
                {
                    "id": 121648332,
                    "name": "Kenji",
                    "thumbnail_image_url": "akita-inu.jpg"
                },
                {
                    "id": 3151823,
                    "name": "Gertrude",
                    "thumbnail_image_url": "great-dane-ball.jpg"
                },
                {
                    "id": 9585212,
                    "name": "Boris",
                    "thumbnail_image_url": "happy-samoyed.jpg"
                },
                {
                    "id": 121212,
                    "name": "Bora",
                    "thumbnail_image_url": "jindo-puppy.jpg"
                },
                {
                    "id": 91482821,
                    "name": "Jimbo",
                    "thumbnail_image_url": "pitbull-terrier.jpg"
                },
                {
                    "id": 1529828,
                    "name": "Shredder",
                    "thumbnail_image_url": "tibetan-mastiff.jpg"
                },
                {
                    "id": 261988,
                    "name": "Princess",
                    "thumbnail_image_url": "weird-poodle.jpg"
                }
            ]
            """#
}
