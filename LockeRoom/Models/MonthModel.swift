//
//  MonthModel.swift
//  Lockeroom
//
//  Created by Zafar Najmi on 18/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import Foundation
struct Month : Codable {
    let success : Bool?
    let message : String?
    let data : MonthData?
    let errors : MonthErrors?
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
        data = try values.decodeIfPresent(MonthData.self, forKey: .data)
        errors = try values.decodeIfPresent(MonthErrors.self, forKey: .errors)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}


struct MonthData : Codable {
    let collection : MonthCollection?
    let pagination : MonthPagination?

    enum CodingKeys: String, CodingKey {

        case collection = "collection"
        case pagination = "pagination"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        collection = try values.decodeIfPresent(MonthCollection.self, forKey: .collection)
        pagination = try values.decodeIfPresent(MonthPagination.self, forKey: .pagination)
    }

}



struct MonthCollection : Codable {
    let card : MonthCard?
    let report_listing : [MonthReport_listing]?

    enum CodingKeys: String, CodingKey {

        case card = "card"
        case report_listing = "report_listing"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        card = try values.decodeIfPresent(MonthCard.self, forKey: .card)
        report_listing = try values.decodeIfPresent([MonthReport_listing].self, forKey: .report_listing)
    }

}

struct MonthReport_listing : Codable {
    let total_scanned : Int?
    let check_in_month : Int?
    let check_in_year : Int?
    let total_payed : Double?
    let total_unpaid : Double?
    let first_date : String?
    let last_date : String?
    let current_month : String?
    let time_interval_string : String?

    enum CodingKeys: String, CodingKey {

        case total_scanned = "total_scanned"
        case check_in_month = "check_in_month"
        case check_in_year = "check_in_year"
        case total_payed = "total_payed"
        case total_unpaid = "total_unpaid"
        case first_date = "first_date"
        case last_date = "last_date"
        case current_month = "current_month"
        case time_interval_string = "time_interval_string"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total_scanned = try values.decodeIfPresent(Int.self, forKey: .total_scanned)
        check_in_month = try values.decodeIfPresent(Int.self, forKey: .check_in_month)
        check_in_year = try values.decodeIfPresent(Int.self, forKey: .check_in_year)
        total_payed = try values.decodeIfPresent(Double.self, forKey: .total_payed)
        total_unpaid = try values.decodeIfPresent(Double.self, forKey: .total_unpaid)
        first_date = try values.decodeIfPresent(String.self, forKey: .first_date)
        last_date = try values.decodeIfPresent(String.self, forKey: .last_date)
        current_month = try values.decodeIfPresent(String.self, forKey: .current_month)
        time_interval_string = try values.decodeIfPresent(String.self, forKey: .time_interval_string)
    }

}

struct MonthCard : Codable {
    let total_scanned : Int?
    let check_in_month : Int?
    let check_in_year : Int?
    let total_payed : Double?
    let total_unpaid : Double?
    let first_date : String?
    let last_date : String?
    let current_month : String?
    let time_interval_string : String?

    enum CodingKeys: String, CodingKey {

        case total_scanned = "total_scanned"
        case check_in_month = "check_in_month"
        case check_in_year = "check_in_year"
        case total_payed = "total_payed"
        case total_unpaid = "total_unpaid"
        case first_date = "first_date"
        case last_date = "last_date"
        case current_month = "current_month"
        case time_interval_string = "time_interval_string"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total_scanned = try values.decodeIfPresent(Int.self, forKey: .total_scanned)
        check_in_month = try values.decodeIfPresent(Int.self, forKey: .check_in_month)
        check_in_year = try values.decodeIfPresent(Int.self, forKey: .check_in_year)
        total_payed = try values.decodeIfPresent(Double.self, forKey: .total_payed)
        total_unpaid = try values.decodeIfPresent(Double.self, forKey: .total_unpaid)
        first_date = try values.decodeIfPresent(String.self, forKey: .first_date)
        last_date = try values.decodeIfPresent(String.self, forKey: .last_date)
        current_month = try values.decodeIfPresent(String.self, forKey: .current_month)
        time_interval_string = try values.decodeIfPresent(String.self, forKey: .time_interval_string)
    }

}


struct MonthErrors : Codable {

    enum CodingKeys: CodingKey {

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    }

}


struct MonthPagination : Codable {
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
