

import Foundation
struct RedemptionSubmission : Codable {
    let pdfLink : String?
    let uniqueID : String?
    let userId : Int?
    let responseCode : String?
    let membershipID : String?
    let redemptionReferenceNumber : String?
    let redemptionStatus : String?
    let objCatalogueList : String?
    let returnValue : Int?
    let returnMessage : String?
    let totalRecords : Int?

    enum CodingKeys: String, CodingKey {

        case pdfLink = "pdfLink"
        case uniqueID = "uniqueID"
        case userId = "userId"
        case responseCode = "responseCode"
        case membershipID = "membershipID"
        case redemptionReferenceNumber = "redemptionReferenceNumber"
        case redemptionStatus = "redemptionStatus"
        case objCatalogueList = "objCatalogueList"
        case returnValue = "returnValue"
        case returnMessage = "returnMessage"
        case totalRecords = "totalRecords"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pdfLink = try values.decodeIfPresent(String.self, forKey: .pdfLink)
        uniqueID = try values.decodeIfPresent(String.self, forKey: .uniqueID)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        responseCode = try values.decodeIfPresent(String.self, forKey: .responseCode)
        membershipID = try values.decodeIfPresent(String.self, forKey: .membershipID)
        redemptionReferenceNumber = try values.decodeIfPresent(String.self, forKey: .redemptionReferenceNumber)
        redemptionStatus = try values.decodeIfPresent(String.self, forKey: .redemptionStatus)
        objCatalogueList = try values.decodeIfPresent(String.self, forKey: .objCatalogueList)
        returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
        returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
        totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
    }

}
