/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ObjCatalogueRedemReqList1 : Codable {
	let redemptionId : Int?
	let redemptionRefno : String?
	let loyaltyId : String?
	let catalogueId : Int?
	let quantity : Int?
	let redemptionPoints : Double?
	let email : String?
	let mobile : String?
	let balance : String?
	let merchantEmail : String?
	let name : String?
	let merchantName : String?
	let redemptionDate : String?
	let jRedemptionDate : String?
	let status : Int?
	let vendorId : Int?
	let vendorName : String?
	let productName : String?
	let cashValue : Double?
	let productCode : String?
	let totRowCount : Int?
	let asm : String?
	let se : String?
	let dealer : String?
	let productImage : String?
	let locationName : String?
	let processedBy : String?
	let pointsPerUnit : Int?
	let cashPerUnit : Int?
	let pointsRequired : Int?
	let partialPaymentCash : Int?
	let deliveryType : Int?
	let createdBy : String?
	let productDesc : String?
	let termsCondition : String?
	let barcode : String?
	let expiryDate : String?
	let categoryName : String?
	let pdfLink : String?
	let address1 : String?
	let address2 : String?
	let addressId : Int?
	let cityId : Int?
	let cityName : String?
	let countryId : Int?
	let countryName : String?
	let landmark : String?
	let stateId : Int?
	let stateName : String?
	let zip : String?
	let addressType : String?
	let fullName : String?
	let redemptionType : Int?
	let custMobile : String?
	let catalogueType : String?
	let sku : String?
	let pendingVoucherBalance : Double?
	let redemptionStatus : Int?
	let referrenceCustName : String?
	let redeemedPoints : Double?
	let transferMode : String?
	let beneficiaryName : String?
	let beneficiaryAccount : String?
	let beneficiaryIFSC : String?
	let vendorCode : String?
	let sapCode : String?
	let walletNumber : String?
	let remarks : String?
	let customerImage : String?
	let dealerName : String?
	let dealerType : String?
	let scheme : String?
	let tdsPercentage : Int?
	let applicableTds : Double?
	let membertype : String?
	let token : String?
	let actorId : Int?
	let isActive : Bool?
	let actorRole : String?
	let actionType : Int?

	enum CodingKeys: String, CodingKey {

		case redemptionId = "redemptionId"
		case redemptionRefno = "redemptionRefno"
		case loyaltyId = "loyaltyId"
		case catalogueId = "catalogueId"
		case quantity = "quantity"
		case redemptionPoints = "redemptionPoints"
		case email = "email"
		case mobile = "mobile"
		case balance = "balance"
		case merchantEmail = "merchantEmail"
		case name = "name"
		case merchantName = "merchantName"
		case redemptionDate = "redemptionDate"
		case jRedemptionDate = "jRedemptionDate"
		case status = "status"
		case vendorId = "vendorId"
		case vendorName = "vendorName"
		case productName = "productName"
		case cashValue = "cashValue"
		case productCode = "productCode"
		case totRowCount = "totRowCount"
		case asm = "asm"
		case se = "se"
		case dealer = "dealer"
		case productImage = "productImage"
		case locationName = "locationName"
		case processedBy = "processedBy"
		case pointsPerUnit = "pointsPerUnit"
		case cashPerUnit = "cashPerUnit"
		case pointsRequired = "pointsRequired"
		case partialPaymentCash = "partialPaymentCash"
		case deliveryType = "deliveryType"
		case createdBy = "createdBy"
		case productDesc = "productDesc"
		case termsCondition = "termsCondition"
		case barcode = "barcode"
		case expiryDate = "expiryDate"
		case categoryName = "categoryName"
		case pdfLink = "pdfLink"
		case address1 = "address1"
		case address2 = "address2"
		case addressId = "addressId"
		case cityId = "cityId"
		case cityName = "cityName"
		case countryId = "countryId"
		case countryName = "countryName"
		case landmark = "landmark"
		case stateId = "stateId"
		case stateName = "stateName"
		case zip = "zip"
		case addressType = "addressType"
		case fullName = "fullName"
		case redemptionType = "redemptionType"
		case custMobile = "custMobile"
		case catalogueType = "catalogueType"
		case sku = "sku"
		case pendingVoucherBalance = "pendingVoucherBalance"
		case redemptionStatus = "redemptionStatus"
		case referrenceCustName = "referrenceCustName"
		case redeemedPoints = "redeemedPoints"
		case transferMode = "transferMode"
		case beneficiaryName = "beneficiaryName"
		case beneficiaryAccount = "beneficiaryAccount"
		case beneficiaryIFSC = "beneficiaryIFSC"
		case vendorCode = "vendorCode"
		case sapCode = "sapCode"
		case walletNumber = "walletNumber"
		case remarks = "remarks"
		case customerImage = "customerImage"
		case dealerName = "dealerName"
		case dealerType = "dealerType"
		case scheme = "scheme"
		case tdsPercentage = "tdsPercentage"
		case applicableTds = "applicableTds"
		case membertype = "membertype"
		case token = "token"
		case actorId = "actorId"
		case isActive = "isActive"
		case actorRole = "actorRole"
		case actionType = "actionType"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		redemptionId = try values.decodeIfPresent(Int.self, forKey: .redemptionId)
		redemptionRefno = try values.decodeIfPresent(String.self, forKey: .redemptionRefno)
		loyaltyId = try values.decodeIfPresent(String.self, forKey: .loyaltyId)
		catalogueId = try values.decodeIfPresent(Int.self, forKey: .catalogueId)
		quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
		redemptionPoints = try values.decodeIfPresent(Double.self, forKey: .redemptionPoints)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
		balance = try values.decodeIfPresent(String.self, forKey: .balance)
		merchantEmail = try values.decodeIfPresent(String.self, forKey: .merchantEmail)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		merchantName = try values.decodeIfPresent(String.self, forKey: .merchantName)
		redemptionDate = try values.decodeIfPresent(String.self, forKey: .redemptionDate)
		jRedemptionDate = try values.decodeIfPresent(String.self, forKey: .jRedemptionDate)
		status = try values.decodeIfPresent(Int.self, forKey: .status)
		vendorId = try values.decodeIfPresent(Int.self, forKey: .vendorId)
		vendorName = try values.decodeIfPresent(String.self, forKey: .vendorName)
		productName = try values.decodeIfPresent(String.self, forKey: .productName)
		cashValue = try values.decodeIfPresent(Double.self, forKey: .cashValue)
		productCode = try values.decodeIfPresent(String.self, forKey: .productCode)
		totRowCount = try values.decodeIfPresent(Int.self, forKey: .totRowCount)
		asm = try values.decodeIfPresent(String.self, forKey: .asm)
		se = try values.decodeIfPresent(String.self, forKey: .se)
		dealer = try values.decodeIfPresent(String.self, forKey: .dealer)
		productImage = try values.decodeIfPresent(String.self, forKey: .productImage)
		locationName = try values.decodeIfPresent(String.self, forKey: .locationName)
		processedBy = try values.decodeIfPresent(String.self, forKey: .processedBy)
		pointsPerUnit = try values.decodeIfPresent(Int.self, forKey: .pointsPerUnit)
		cashPerUnit = try values.decodeIfPresent(Int.self, forKey: .cashPerUnit)
		pointsRequired = try values.decodeIfPresent(Int.self, forKey: .pointsRequired)
		partialPaymentCash = try values.decodeIfPresent(Int.self, forKey: .partialPaymentCash)
		deliveryType = try values.decodeIfPresent(Int.self, forKey: .deliveryType)
		createdBy = try values.decodeIfPresent(String.self, forKey: .createdBy)
		productDesc = try values.decodeIfPresent(String.self, forKey: .productDesc)
		termsCondition = try values.decodeIfPresent(String.self, forKey: .termsCondition)
		barcode = try values.decodeIfPresent(String.self, forKey: .barcode)
		expiryDate = try values.decodeIfPresent(String.self, forKey: .expiryDate)
		categoryName = try values.decodeIfPresent(String.self, forKey: .categoryName)
		pdfLink = try values.decodeIfPresent(String.self, forKey: .pdfLink)
		address1 = try values.decodeIfPresent(String.self, forKey: .address1)
		address2 = try values.decodeIfPresent(String.self, forKey: .address2)
		addressId = try values.decodeIfPresent(Int.self, forKey: .addressId)
		cityId = try values.decodeIfPresent(Int.self, forKey: .cityId)
		cityName = try values.decodeIfPresent(String.self, forKey: .cityName)
		countryId = try values.decodeIfPresent(Int.self, forKey: .countryId)
		countryName = try values.decodeIfPresent(String.self, forKey: .countryName)
		landmark = try values.decodeIfPresent(String.self, forKey: .landmark)
		stateId = try values.decodeIfPresent(Int.self, forKey: .stateId)
		stateName = try values.decodeIfPresent(String.self, forKey: .stateName)
		zip = try values.decodeIfPresent(String.self, forKey: .zip)
		addressType = try values.decodeIfPresent(String.self, forKey: .addressType)
		fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
		redemptionType = try values.decodeIfPresent(Int.self, forKey: .redemptionType)
		custMobile = try values.decodeIfPresent(String.self, forKey: .custMobile)
		catalogueType = try values.decodeIfPresent(String.self, forKey: .catalogueType)
		sku = try values.decodeIfPresent(String.self, forKey: .sku)
		pendingVoucherBalance = try values.decodeIfPresent(Double.self, forKey: .pendingVoucherBalance)
		redemptionStatus = try values.decodeIfPresent(Int.self, forKey: .redemptionStatus)
		referrenceCustName = try values.decodeIfPresent(String.self, forKey: .referrenceCustName)
		redeemedPoints = try values.decodeIfPresent(Double.self, forKey: .redeemedPoints)
		transferMode = try values.decodeIfPresent(String.self, forKey: .transferMode)
		beneficiaryName = try values.decodeIfPresent(String.self, forKey: .beneficiaryName)
		beneficiaryAccount = try values.decodeIfPresent(String.self, forKey: .beneficiaryAccount)
		beneficiaryIFSC = try values.decodeIfPresent(String.self, forKey: .beneficiaryIFSC)
		vendorCode = try values.decodeIfPresent(String.self, forKey: .vendorCode)
		sapCode = try values.decodeIfPresent(String.self, forKey: .sapCode)
		walletNumber = try values.decodeIfPresent(String.self, forKey: .walletNumber)
		remarks = try values.decodeIfPresent(String.self, forKey: .remarks)
		customerImage = try values.decodeIfPresent(String.self, forKey: .customerImage)
		dealerName = try values.decodeIfPresent(String.self, forKey: .dealerName)
		dealerType = try values.decodeIfPresent(String.self, forKey: .dealerType)
		scheme = try values.decodeIfPresent(String.self, forKey: .scheme)
		tdsPercentage = try values.decodeIfPresent(Int.self, forKey: .tdsPercentage)
		applicableTds = try values.decodeIfPresent(Double.self, forKey: .applicableTds)
		membertype = try values.decodeIfPresent(String.self, forKey: .membertype)
		token = try values.decodeIfPresent(String.self, forKey: .token)
		actorId = try values.decodeIfPresent(Int.self, forKey: .actorId)
		isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
		actorRole = try values.decodeIfPresent(String.self, forKey: .actorRole)
		actionType = try values.decodeIfPresent(Int.self, forKey: .actionType)
	}

}
