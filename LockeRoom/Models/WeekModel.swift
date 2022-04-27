//
//  WeekModel.swift
//  Lockeroom
//
//  Created by Zafar Najmi on 19/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import Foundation
struct WeekModel : Codable {
    let success : Bool?
    let message : String?
    let data : WeekModelData?
    let errors : WeekModelErrors?
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
        data = try values.decodeIfPresent(WeekModelData.self, forKey: .data)
        errors = try values.decodeIfPresent(WeekModelErrors.self, forKey: .errors)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}


struct WeekModelData : Codable {
    let collection : WeekModelCollection?
    let pagination : WeekModelPagination?

    enum CodingKeys: String, CodingKey {

        case collection = "collection"
        case pagination = "pagination"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        collection = try values.decodeIfPresent(WeekModelCollection.self, forKey: .collection)
        pagination = try values.decodeIfPresent(WeekModelPagination.self, forKey: .pagination)
    }

}


struct WeekModelCollection : Codable {
    let card : WeekModelCard?
    let report_listing : [WeekModelReport_listing]?

    enum CodingKeys: String, CodingKey {

        case card = "card"
        case report_listing = "report_listing"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        card = try values.decodeIfPresent(WeekModelCard.self, forKey: .card)
        report_listing = try values.decodeIfPresent([WeekModelReport_listing].self, forKey: .report_listing)
    }

}


struct WeekModelCard : Codable {
    let total_scanned : Int?
    let check_in_time : Int?
    let check_in_week : Int?
    let total_payed : Double?
    let total_unpaid : Double?
    let time_interval_string : String?

    enum CodingKeys: String, CodingKey {

        case total_scanned = "total_scanned"
        case check_in_time = "check_in_time"
        case check_in_week = "check_in_week"
        case total_payed = "total_payed"
        case total_unpaid = "total_unpaid"
        case time_interval_string = "time_interval_string"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total_scanned = try values.decodeIfPresent(Int.self, forKey: .total_scanned)
        check_in_time = try values.decodeIfPresent(Int.self, forKey: .check_in_time)
        check_in_week = try values.decodeIfPresent(Int.self, forKey: .check_in_week)
        total_payed = try values.decodeIfPresent(Double.self, forKey: .total_payed)
        total_unpaid = try values.decodeIfPresent(Double.self, forKey: .total_unpaid)
        time_interval_string = try values.decodeIfPresent(String.self, forKey: .time_interval_string)
    }

}


struct WeekModelReport_listing : Codable {
    let total_scanned : Int?
    let check_in_time : Int?
    let check_in_week : Int?
    let total_payed : Double?
    let total_unpaid : Double?
    let time_interval_string : String?

    enum CodingKeys: String, CodingKey {

        case total_scanned = "total_scanned"
        case check_in_time = "check_in_time"
        case check_in_week = "check_in_week"
        case total_payed = "total_payed"
        case total_unpaid = "total_unpaid"
        case time_interval_string = "time_interval_string"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total_scanned = try values.decodeIfPresent(Int.self, forKey: .total_scanned)
        check_in_time = try values.decodeIfPresent(Int.self, forKey: .check_in_time)
        check_in_week = try values.decodeIfPresent(Int.self, forKey: .check_in_week)
        total_payed = try values.decodeIfPresent(Double.self, forKey: .total_payed)
        total_unpaid = try values.decodeIfPresent(Double.self, forKey: .total_unpaid)
        time_interval_string = try values.decodeIfPresent(String.self, forKey: .time_interval_string)
    }

}


struct WeekModelPagination : Codable {
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

struct WeekModelErrors : Codable {

    enum CodingKeys:  CodingKey {

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    }

}
