//
//  PaymentModel.swift
//  Lockeroom
//
//  Created by Zafar Najmi on 22/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import Foundation
struct PaymentModel : Codable {
    let success : Bool?
    let message : String?
    let data : PaymentModelData?
    let errors : PaymentModelErrors?
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
        data = try values.decodeIfPresent(PaymentModelData.self, forKey: .data)
        errors = try values.decodeIfPresent(PaymentModelErrors.self, forKey: .errors)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}


struct PaymentModelData : Codable {
    let collection : PaymentModelCollection?
    let pagination : Pagination?

    enum CodingKeys: String, CodingKey {

        case collection = "collection"
        case pagination = "pagination"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        collection = try values.decodeIfPresent(PaymentModelCollection.self, forKey: .collection)
        pagination = try values.decodeIfPresent(Pagination.self, forKey: .pagination)
    }

}


struct PaymentModelCollection : Codable {
    let id:Int?
    let total_scans : Int?
    let total_payed : Double?
    let month : Int?
    let year : Int?
    let payment_month : String?

    enum CodingKeys: String, CodingKey {
       case id = "id"
        case total_scans = "total_scans"
        case total_payed = "total_payed"
        case month = "month"
        case year = "year"
        case payment_month = "payment_month"
    }

    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        total_scans = try values.decodeIfPresent(Int.self, forKey: .total_scans)
        total_payed = try values.decodeIfPresent(Double.self, forKey: .total_payed)
        month = try values.decodeIfPresent(Int.self, forKey: .month)
        year = try values.decodeIfPresent(Int.self, forKey: .year)
        payment_month = try values.decodeIfPresent(String.self, forKey: .payment_month)
    }

}


struct PaymentModelErrors : Codable {

    enum CodingKeys:  CodingKey {

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    }

}
