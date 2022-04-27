//
//  UploadImage.swift
//  Lockeroom
//
//  Created by Zafar Najmi on 14/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import Foundation
struct Uploadimage : Codable {
    let success : Bool?
    let message : String?
    let data : UploadimageData?
    let errors : UploadimageErrors?
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
        data = try values.decodeIfPresent(UploadimageData.self, forKey: .data)
        errors = try values.decodeIfPresent(UploadimageErrors.self, forKey: .errors)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}


struct UploadimageData : Codable {
    let collection : UploadimageCollection?
    let pagination : Pagination?

    enum CodingKeys: String, CodingKey {

        case collection = "collection"
        case pagination = "pagination"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        collection = try values.decodeIfPresent(UploadimageCollection.self, forKey: .collection)
        pagination = try values.decodeIfPresent(Pagination.self, forKey: .pagination)
    }

}

struct UploadimageCollection : Codable {
    let image : String?

    enum CodingKeys: String, CodingKey {

        case image = "image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }

}
struct UploadimageErrors : Codable {

    enum CodingKeys:  CodingKey {

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    }

}
