//
//  CheckOut.swift
//  Lockeroom
//
//  Created by Zafar Najmi on 19/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import Foundation
struct CheckOut : Codable {
    let success : Bool?
    let message : String?
    let data : CheckOutData?
    let errors : CheckOutErrors?
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
        data = try values.decodeIfPresent(CheckOutData.self, forKey: .data)
        errors = try values.decodeIfPresent(CheckOutErrors.self, forKey: .errors)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}


struct CheckOutData : Codable {
    let collection : [String]?
    let pagination : Pagination?

    enum CodingKeys: String, CodingKey {

        case collection = "collection"
        case pagination = "pagination"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        collection = try values.decodeIfPresent([String].self, forKey: .collection)
        pagination = try values.decodeIfPresent(Pagination.self, forKey: .pagination)
    }

}


struct CheckOutErrors : Codable {

    enum CodingKeys:  CodingKey {

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    }

}
