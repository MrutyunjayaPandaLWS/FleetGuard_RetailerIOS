/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct LstTransactionApprovalDetails : Codable {
	let invoiceNo : String?
	let tranDate : String?
	let approvedDate : String?
	let amount : Double?
	let rewardPoints : Double?
	let merchantName : String?
	let loyaltyId : String?
	let gstNumber : String?
	let locationName : String?
	let merchantID : Int?
	let transactionType : String?
	let remarks : String?
	let isColor : Int?
	let productId : Int?
	let totalEarnPoint : Int?
	let partyLoyaltyId : String?
	let totalRows : Int?
	let memberName : String?
	let loyaltyBehaviour : String?
	let userRole : String?
	let userRoleID : Int?
	let prodCode : String?
	let prodName : String?
	let sellingPrice : String?
	let locationID : Int?
	let approvalStatusID : Int?
	let approvalStatus : String?
	let approverName : String?
	let approverIP : String?
	let ltyTranTempID : Int?
	let pointsCredited : Int?
	let serialNumber : String?
	let skuName : String?
	let email : String?
	let mobile : String?
	let pointBalance : String?
	let partyName : String?
	let userType : String?
	let productImage : String?
	let prodDescription : String?
	let prodVideoLink : String?
	let batchNo : Int?
	let quantity : Double?
	let qty : Double?
	let approverMemberId : String?
	let approverMemberName : String?
	let approverMemberType : String?
	let escalationMemberId : String?
	let escalationMemberName : String?
	let escalationMemberType : String?
	let escalationDate : String?
	let approvedByMemberName : String?
	let approvedByMemberType : String?
	let isVisible : Int?
	let retailerName : String?
	let plumberName : String?
	let isReversalStatus : Int?
	let ordreId : Int?
	let ordreNumber : String?
	let memberType : String?
	let uom : String?
	let color : String?
	let sourceDevice : String?
	let createdDate : String?
	let invoiceAttachment : String?
	let retailerID : String?
	let retailerType : String?
	let retailerLocation : String?
	let retailerApprovedStatus : String?
	let retailerApprovedDate : String?
	let seID : String?
	let seType : String?
	let seApprovedStatus : String?
	let seApprovedDate : String?
	let seLocation : String?
	let merchantApprovedStatus : String?
	let retailerFirmName : String?
	let shopName : String?
	let dealerLocation : String?

	enum CodingKeys: String, CodingKey {

		case invoiceNo = "invoiceNo"
		case tranDate = "tranDate"
		case approvedDate = "approvedDate"
		case amount = "amount"
		case rewardPoints = "rewardPoints"
		case merchantName = "merchantName"
		case loyaltyId = "loyaltyId"
		case gstNumber = "gstNumber"
		case locationName = "locationName"
		case merchantID = "merchantID"
		case transactionType = "transactionType"
		case remarks = "remarks"
		case isColor = "isColor"
		case productId = "productId"
		case totalEarnPoint = "totalEarnPoint"
		case partyLoyaltyId = "partyLoyaltyId"
		case totalRows = "totalRows"
		case memberName = "memberName"
		case loyaltyBehaviour = "loyaltyBehaviour"
		case userRole = "userRole"
		case userRoleID = "userRoleID"
		case prodCode = "prodCode"
		case prodName = "prodName"
		case sellingPrice = "sellingPrice"
		case locationID = "locationID"
		case approvalStatusID = "approvalStatusID"
		case approvalStatus = "approvalStatus"
		case approverName = "approverName"
		case approverIP = "approverIP"
		case ltyTranTempID = "ltyTranTempID"
		case pointsCredited = "pointsCredited"
		case serialNumber = "serialNumber"
		case skuName = "skuName"
		case email = "email"
		case mobile = "mobile"
		case pointBalance = "pointBalance"
		case partyName = "partyName"
		case userType = "userType"
		case productImage = "productImage"
		case prodDescription = "prodDescription"
		case prodVideoLink = "prodVideoLink"
		case batchNo = "batchNo"
		case quantity = "quantity"
		case qty = "qty"
		case approverMemberId = "approverMemberId"
		case approverMemberName = "approverMemberName"
		case approverMemberType = "approverMemberType"
		case escalationMemberId = "escalationMemberId"
		case escalationMemberName = "escalationMemberName"
		case escalationMemberType = "escalationMemberType"
		case escalationDate = "escalationDate"
		case approvedByMemberName = "approvedByMemberName"
		case approvedByMemberType = "approvedByMemberType"
		case isVisible = "isVisible"
		case retailerName = "retailerName"
		case plumberName = "plumberName"
		case isReversalStatus = "isReversalStatus"
		case ordreId = "ordreId"
		case ordreNumber = "ordreNumber"
		case memberType = "memberType"
		case uom = "uom"
		case color = "color"
		case sourceDevice = "sourceDevice"
		case createdDate = "createdDate"
		case invoiceAttachment = "invoiceAttachment"
		case retailerID = "retailerID"
		case retailerType = "retailerType"
		case retailerLocation = "retailerLocation"
		case retailerApprovedStatus = "retailerApprovedStatus"
		case retailerApprovedDate = "retailerApprovedDate"
		case seID = "seID"
		case seType = "seType"
		case seApprovedStatus = "seApprovedStatus"
		case seApprovedDate = "seApprovedDate"
		case seLocation = "seLocation"
		case merchantApprovedStatus = "merchantApprovedStatus"
		case retailerFirmName = "retailerFirmName"
		case shopName = "shopName"
		case dealerLocation = "dealerLocation"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		invoiceNo = try values.decodeIfPresent(String.self, forKey: .invoiceNo)
		tranDate = try values.decodeIfPresent(String.self, forKey: .tranDate)
		approvedDate = try values.decodeIfPresent(String.self, forKey: .approvedDate)
		amount = try values.decodeIfPresent(Double.self, forKey: .amount)
		rewardPoints = try values.decodeIfPresent(Double.self, forKey: .rewardPoints)
		merchantName = try values.decodeIfPresent(String.self, forKey: .merchantName)
		loyaltyId = try values.decodeIfPresent(String.self, forKey: .loyaltyId)
		gstNumber = try values.decodeIfPresent(String.self, forKey: .gstNumber)
		locationName = try values.decodeIfPresent(String.self, forKey: .locationName)
		merchantID = try values.decodeIfPresent(Int.self, forKey: .merchantID)
		transactionType = try values.decodeIfPresent(String.self, forKey: .transactionType)
		remarks = try values.decodeIfPresent(String.self, forKey: .remarks)
		isColor = try values.decodeIfPresent(Int.self, forKey: .isColor)
		productId = try values.decodeIfPresent(Int.self, forKey: .productId)
		totalEarnPoint = try values.decodeIfPresent(Int.self, forKey: .totalEarnPoint)
		partyLoyaltyId = try values.decodeIfPresent(String.self, forKey: .partyLoyaltyId)
		totalRows = try values.decodeIfPresent(Int.self, forKey: .totalRows)
		memberName = try values.decodeIfPresent(String.self, forKey: .memberName)
		loyaltyBehaviour = try values.decodeIfPresent(String.self, forKey: .loyaltyBehaviour)
		userRole = try values.decodeIfPresent(String.self, forKey: .userRole)
		userRoleID = try values.decodeIfPresent(Int.self, forKey: .userRoleID)
		prodCode = try values.decodeIfPresent(String.self, forKey: .prodCode)
		prodName = try values.decodeIfPresent(String.self, forKey: .prodName)
		sellingPrice = try values.decodeIfPresent(String.self, forKey: .sellingPrice)
		locationID = try values.decodeIfPresent(Int.self, forKey: .locationID)
		approvalStatusID = try values.decodeIfPresent(Int.self, forKey: .approvalStatusID)
		approvalStatus = try values.decodeIfPresent(String.self, forKey: .approvalStatus)
		approverName = try values.decodeIfPresent(String.self, forKey: .approverName)
		approverIP = try values.decodeIfPresent(String.self, forKey: .approverIP)
		ltyTranTempID = try values.decodeIfPresent(Int.self, forKey: .ltyTranTempID)
		pointsCredited = try values.decodeIfPresent(Int.self, forKey: .pointsCredited)
		serialNumber = try values.decodeIfPresent(String.self, forKey: .serialNumber)
		skuName = try values.decodeIfPresent(String.self, forKey: .skuName)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
		pointBalance = try values.decodeIfPresent(String.self, forKey: .pointBalance)
		partyName = try values.decodeIfPresent(String.self, forKey: .partyName)
		userType = try values.decodeIfPresent(String.self, forKey: .userType)
		productImage = try values.decodeIfPresent(String.self, forKey: .productImage)
		prodDescription = try values.decodeIfPresent(String.self, forKey: .prodDescription)
		prodVideoLink = try values.decodeIfPresent(String.self, forKey: .prodVideoLink)
		batchNo = try values.decodeIfPresent(Int.self, forKey: .batchNo)
		quantity = try values.decodeIfPresent(Double.self, forKey: .quantity)
		qty = try values.decodeIfPresent(Double.self, forKey: .qty)
		approverMemberId = try values.decodeIfPresent(String.self, forKey: .approverMemberId)
		approverMemberName = try values.decodeIfPresent(String.self, forKey: .approverMemberName)
		approverMemberType = try values.decodeIfPresent(String.self, forKey: .approverMemberType)
		escalationMemberId = try values.decodeIfPresent(String.self, forKey: .escalationMemberId)
		escalationMemberName = try values.decodeIfPresent(String.self, forKey: .escalationMemberName)
		escalationMemberType = try values.decodeIfPresent(String.self, forKey: .escalationMemberType)
		escalationDate = try values.decodeIfPresent(String.self, forKey: .escalationDate)
		approvedByMemberName = try values.decodeIfPresent(String.self, forKey: .approvedByMemberName)
		approvedByMemberType = try values.decodeIfPresent(String.self, forKey: .approvedByMemberType)
		isVisible = try values.decodeIfPresent(Int.self, forKey: .isVisible)
		retailerName = try values.decodeIfPresent(String.self, forKey: .retailerName)
		plumberName = try values.decodeIfPresent(String.self, forKey: .plumberName)
		isReversalStatus = try values.decodeIfPresent(Int.self, forKey: .isReversalStatus)
		ordreId = try values.decodeIfPresent(Int.self, forKey: .ordreId)
		ordreNumber = try values.decodeIfPresent(String.self, forKey: .ordreNumber)
		memberType = try values.decodeIfPresent(String.self, forKey: .memberType)
		uom = try values.decodeIfPresent(String.self, forKey: .uom)
		color = try values.decodeIfPresent(String.self, forKey: .color)
		sourceDevice = try values.decodeIfPresent(String.self, forKey: .sourceDevice)
		createdDate = try values.decodeIfPresent(String.self, forKey: .createdDate)
		invoiceAttachment = try values.decodeIfPresent(String.self, forKey: .invoiceAttachment)
		retailerID = try values.decodeIfPresent(String.self, forKey: .retailerID)
		retailerType = try values.decodeIfPresent(String.self, forKey: .retailerType)
		retailerLocation = try values.decodeIfPresent(String.self, forKey: .retailerLocation)
		retailerApprovedStatus = try values.decodeIfPresent(String.self, forKey: .retailerApprovedStatus)
		retailerApprovedDate = try values.decodeIfPresent(String.self, forKey: .retailerApprovedDate)
		seID = try values.decodeIfPresent(String.self, forKey: .seID)
		seType = try values.decodeIfPresent(String.self, forKey: .seType)
		seApprovedStatus = try values.decodeIfPresent(String.self, forKey: .seApprovedStatus)
		seApprovedDate = try values.decodeIfPresent(String.self, forKey: .seApprovedDate)
		seLocation = try values.decodeIfPresent(String.self, forKey: .seLocation)
		merchantApprovedStatus = try values.decodeIfPresent(String.self, forKey: .merchantApprovedStatus)
		retailerFirmName = try values.decodeIfPresent(String.self, forKey: .retailerFirmName)
		shopName = try values.decodeIfPresent(String.self, forKey: .shopName)
		dealerLocation = try values.decodeIfPresent(String.self, forKey: .dealerLocation)
	}

}