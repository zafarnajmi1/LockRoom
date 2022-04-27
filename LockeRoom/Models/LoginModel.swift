////
////  LoginModel.swift
////  Lockeroom
////
////  Created by Zafar Najmi on 10/04/2020.
////  Copyright © 2020 Zafar Najmi. All rights reserved.
////
//
import Foundation
class LoginModel : Codable {
    let success : Bool?
    let message : String?
    let data : LoginModelData?
    let errors : LoginModelErrors?
    let status : Int?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case message = "message"
        case data = "data"
        case errors = "errors"
        case status = "status"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(LoginModelData.self, forKey: .data)
        errors = try values.decodeIfPresent(LoginModelErrors.self, forKey: .errors)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
    }

}


class LoginModelErrors : Codable {
    
    enum CodingKeys:  CodingKey {





    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

    }

}


class LoginModelData : Codable {
    let collection : Collection?
    let pagination : Pagination?

    enum CodingKeys: String, CodingKey {

        case collection = "collection"
        case pagination = "pagination"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        collection = try values.decodeIfPresent(Collection.self, forKey: .collection)
        pagination = try values.decodeIfPresent(Pagination.self, forKey: .pagination)
    }

}



class Collection : Codable {
    let id : Int?
    let role_id : String?
    let email : String?
    let club_name : String?
    let country : String?
    let city : String?
    let fcm_token : String?
    let is_verified : Bool?
    let is_active : Int?
    let verification_code : String?
    let image : String?
    let created_at : Int?
    let updated_at : Int?
    let deleted_at : String?
    let available_balance : Float?
    let total_balance : Float?
    let amount_due : Float?
   let authorization : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case role_id = "role_id"
        case email = "email"
        case club_name = "club_name"
        case country = "country"
        case city = "city"
        case fcm_token = "fcm_token"
        case is_verified = "is_verified"
        case is_active = "is_active"
        case verification_code = "verification_code"
        case image = "image"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case deleted_at = "deleted_at"
        case available_balance = "available_balance"
        case total_balance = "total_balance"
        case amount_due = "amount_due"
        case authorization = "authorization"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        role_id = try values.decodeIfPresent(String.self, forKey: .role_id) ?? "1"
        email = try values.decodeIfPresent(String.self, forKey: .email) ?? "1"
        club_name = try values.decodeIfPresent(String.self, forKey: .club_name) ?? "1"
        country = try values.decodeIfPresent(String.self, forKey: .country) ?? "1"
        city = try? values.decodeIfPresent(String.self, forKey: .city) ?? "1"
        fcm_token = try values.decodeIfPresent(String.self, forKey: .fcm_token) ?? "1"
        is_verified = try values.decodeIfPresent(Bool.self, forKey: .is_verified) ?? true
        is_active = try values.decodeIfPresent(Int.self, forKey: .is_active) ?? 0
        verification_code = try values.decodeIfPresent(String.self, forKey: .verification_code) ?? "1"
        image = try values.decodeIfPresent(String.self, forKey: .image) ?? "1"
        created_at = try values.decodeIfPresent(Int.self, forKey: .created_at) ?? 0
        updated_at = try values.decodeIfPresent(Int.self, forKey: .updated_at) ?? 0
        deleted_at = try values.decodeIfPresent(String.self, forKey: .deleted_at) ?? "1"
        available_balance = try values.decodeIfPresent(Float.self, forKey: .available_balance) ?? 0
        total_balance = try values.decodeIfPresent(Float.self, forKey: .total_balance) ?? 0
         amount_due = try values.decodeIfPresent(Float.self, forKey: .amount_due) ?? 0
        authorization = try? values.decodeIfPresent(String.self, forKey: .authorization) ?? "11"
    }

}




class Pagination : Codable {

    enum CodingKeys:  CodingKey {

    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    }

}





