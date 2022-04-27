//
//  TermsConditions.swift
//  Lockeroom
//
//  Created by Zafar Najmi on 17/04/2020.
//  Copyright © 2020 Zafar Najmi. All rights reserved.
//

import Foundation
struct Termscondition : Codable {
    let success : Bool?
    let message : String?
    let data : TermsconditionData?
    let errors : TermsconditionErrors?
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
        data = try values.decodeIfPresent(TermsconditionData.self, forKey: .data)
        errors = try values.decodeIfPresent(TermsconditionErrors.self, forKey: .errors)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}


struct TermsconditionData : Codable {
    let collection : TermsconditioCollection?
    let pagination : TermsconditioPagination?

    enum CodingKeys: String, CodingKey {

        case collection = "collection"
        case pagination = "pagination"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        collection = try values.decodeIfPresent(TermsconditioCollection.self, forKey: .collection)
        pagination = try values.decodeIfPresent(TermsconditioPagination.self, forKey: .pagination)
    }

}


struct TermsconditioCollection : Codable {
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

struct TermsconditionErrors : Codable {

    enum CodingKeys: CodingKey {

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    }

}


struct TermsconditioPagination : Codable {

    enum CodingKeys:  CodingKey {

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    }

}
