//
//  LockerListing.swift
//  Lockeroom
//
//  Created by Zafar Najmi on 11/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import Foundation
struct LockerListing : Codable {
    let success : Bool?
    let message : String?
    let data : LockerListingData?
    let errors : LockerListingErrors?
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
        data = try values.decodeIfPresent(LockerListingData.self, forKey: .data)
        errors = try values.decodeIfPresent(LockerListingErrors.self, forKey: .errors)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}



struct LockerListingData : Codable {
    let collection : LockerListingCollection?
    let pagination : LockerListingPagination?

    enum CodingKeys: String, CodingKey {

        case collection = "collection"
        case pagination = "pagination"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        collection = try values.decodeIfPresent(LockerListingCollection.self, forKey: .collection)
        pagination = try values.decodeIfPresent(LockerListingPagination.self, forKey: .pagination)
    }

}
struct LockerListingErrors : Codable {

    enum CodingKeys:  CodingKey {

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    }

}





struct Listing : Codable {
    let tag_number : Int?
    let id_image : String?

    enum CodingKeys: String, CodingKey {

        case tag_number = "tag_number"
        case id_image = "id_image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        tag_number = try values.decodeIfPresent(Int.self, forKey: .tag_number)
        id_image = try values.decodeIfPresent(String.self, forKey: .id_image)
    }

}

struct LockerListingPagination : Codable {
    let current_page : Int?
    let from : Int?
    let last_page : Int?
    let next_page_url : String?
    let path : String?
    let per_page : Int?
    let prev_page_url : String?
    let to : Int?
    let total : Int?

    enum CodingKeys: String, CodingKey {

        case current_page = "current_page"
        case from = "from"
        case last_page = "last_page"
        case next_page_url = "next_page_url"
        case path = "path"
        case per_page = "per_page"
        case prev_page_url = "prev_page_url"
        case to = "to"
        case total = "total"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        current_page = try values.decodeIfPresent(Int.self, forKey: .current_page)
        from = try values.decodeIfPresent(Int.self, forKey: .from)
        last_page = try values.decodeIfPresent(Int.self, forKey: .last_page)
        next_page_url = try values.decodeIfPresent(String.self, forKey: .next_page_url)
        path = try values.decodeIfPresent(String.self, forKey: .path)
        per_page = try values.decodeIfPresent(Int.self, forKey: .per_page)
        prev_page_url = try values.decodeIfPresent(String.self, forKey: .prev_page_url)
        to = try values.decodeIfPresent(Int.self, forKey: .to)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
    }

}
struct LockerListingCollection : Codable {
    let used : Int?
    let left : Int?
    let listing : [Listing]?

    enum CodingKeys: String, CodingKey {

        case used = "used"
        case left = "left"
        case listing = "listing"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        used = try values.decodeIfPresent(Int.self, forKey: .used)
        left = try values.decodeIfPresent(Int.self, forKey: .left)
        listing = try values.decodeIfPresent([Listing].self, forKey: .listing)
    }

}
