//
//  AllModel.swift
//  Lockeroom
//
//  Created by Zafar Najmi on 15/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import Foundation
struct All : Codable {
    let success : Bool?
    let message : String?
    let data : AllData?
    let errors : AllErrors?
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
        data = try values.decodeIfPresent(AllData.self, forKey: .data)
        errors = try values.decodeIfPresent(AllErrors.self, forKey: .errors)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}


struct AllData : Codable {
    let collection : AllCollection?
    let pagination : AllPagination?

    enum CodingKeys: String, CodingKey {

        case collection = "collection"
        case pagination = "pagination"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        collection = try values.decodeIfPresent(AllCollection.self, forKey: .collection)
        pagination = try values.decodeIfPresent(AllPagination.self, forKey: .pagination)
    }

}


struct AllErrors : Codable {

    enum CodingKeys:  CodingKey {

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    }

}


struct AllCollection : Codable {
    let report_data : AllReport_data?
    let card : AllCard?

    enum CodingKeys: String, CodingKey {

        case report_data = "report_data"
        case card = "card"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        report_data = try values.decodeIfPresent(AllReport_data.self, forKey: .report_data)
        card = try values.decodeIfPresent(AllCard.self, forKey: .card)
    }

}


struct AllReport_data : Codable {
    let total_scanned : Int?
    let total_payed : Double?
    let total_unpaid : Double?
    let total_amount_scans : Double?
    let first_entry : String?
    let last_entry : String?

    enum CodingKeys: String, CodingKey {

        case total_scanned = "total_scanned"
        case total_payed = "total_payed"
        case total_unpaid = "total_unpaid"
        case total_amount_scans = "total_amount_scans"
        case first_entry = "first_entry"
        case last_entry = "last_entry"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total_scanned = try values.decodeIfPresent(Int.self, forKey: .total_scanned)
        total_payed = try values.decodeIfPresent(Double.self, forKey: .total_payed)
        total_unpaid = try values.decodeIfPresent(Double.self, forKey: .total_unpaid)
        total_amount_scans = try values.decodeIfPresent(Double.self, forKey: .total_amount_scans)
        first_entry = try values.decodeIfPresent(String.self, forKey: .first_entry)
        last_entry = try values.decodeIfPresent(String.self, forKey: .last_entry)
    }

}


struct AllCard : Codable {
    let total_scanned : Int?
    let total_payed : Double?
    let total_unpaid : Double?
    let total_amount_scans : Double?
    let first_entry : String?
    let last_entry : String?

    enum CodingKeys: String, CodingKey {

        case total_scanned = "total_scanned"
        case total_payed = "total_payed"
        case total_unpaid = "total_unpaid"
        case total_amount_scans = "total_amount_scans"
        case first_entry = "first_entry"
        case last_entry = "last_entry"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total_scanned = try values.decodeIfPresent(Int.self, forKey: .total_scanned)
        total_payed = try values.decodeIfPresent(Double.self, forKey: .total_payed)
        total_unpaid = try values.decodeIfPresent(Double.self, forKey: .total_unpaid)
        total_amount_scans = try values.decodeIfPresent(Double.self, forKey: .total_amount_scans)
        first_entry = try values.decodeIfPresent(String.self, forKey: .first_entry)
        last_entry = try values.decodeIfPresent(String.self, forKey: .last_entry)
    }

}


struct AllPagination : Codable {

    enum CodingKeys:  CodingKey {

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    }

}
