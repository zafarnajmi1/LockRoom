//
//  LicenseKeyModel.swift
//  Lockeroom
//
//  Created by Zafar Najmi on 19/07/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import Foundation
struct LicenseKeyModel : Codable {
    let success : Bool?
    let message : String?
    let data : LicenseKeyModelData?
    let errors : LicenseKeyModelErrors?
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
        data = try values.decodeIfPresent(LicenseKeyModelData.self, forKey: .data)
        errors = try values.decodeIfPresent(LicenseKeyModelErrors.self, forKey: .errors)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}
struct LicenseKeyModelData : Codable {
    let collection : LicenseKeyModelCollection?
    let pagination : Pagination?

    enum CodingKeys: String, CodingKey {

        case collection = "collection"
        case pagination = "pagination"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        collection = try values.decodeIfPresent(LicenseKeyModelCollection.self, forKey: .collection)
        pagination = try values.decodeIfPresent(Pagination.self, forKey: .pagination)
    }

}
struct LicenseKeyModelCollection : Codable {
    let title : String?
    let content : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case content = "content"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        content = try values.decodeIfPresent(String.self, forKey: .content)
    }

}
struct LicenseKeyModelErrors : Codable {

    enum CodingKeys:  CodingKey {

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    }

}
