//
//  Checkin.swift
//  Lockeroom
//
//  Created by Zafar Najmi on 14/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import Foundation
struct Checkin : Codable {
        let success : Bool?
        let message : String?
        let data : CheckinData?
        let errors : CheckinErrors?
        let status : Int?

        enum CodingKeys: String, CodingKey {

            case success = "success"
            case message = "message"
            case data = "data"
            case errors = "errors"
            case status = "status"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            success = try values.decodeIfPresent(Bool.self, forKey: .success)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            data = try values.decodeIfPresent(CheckinData.self, forKey: .data)
            errors = try values.decodeIfPresent(CheckinErrors.self, forKey: .errors)
            status = try values.decodeIfPresent(Int.self, forKey: .status)
        }

    }


struct CheckinData : Codable {
    let collection : CheckinCollection?
        let pagination : Pagination?

        enum CodingKeys: String, CodingKey {

            case collection = "collection"
            case pagination = "pagination"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            collection = try values.decodeIfPresent(CheckinCollection.self, forKey: .collection)
            pagination = try values.decodeIfPresent(Pagination.self, forKey: .pagination)
        }

    }

struct CheckinCollection : Codable {
    let tag_number : Int?

    enum CodingKeys: String, CodingKey {

        case tag_number = "tag_number"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        tag_number = try values.decodeIfPresent(Int.self, forKey: .tag_number)
    }

}


struct CheckinErrors : Codable {

    enum CodingKeys:  CodingKey {

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    }

}
