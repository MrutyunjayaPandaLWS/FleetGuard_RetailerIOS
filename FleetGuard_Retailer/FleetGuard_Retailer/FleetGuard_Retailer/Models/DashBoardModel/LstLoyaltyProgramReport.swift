/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct LstLoyaltyProgramReport : Codable {
	let rewardCurrency : String?
	let rewardCurrencyID : Int?
	let noofTrans : Double?
	let totalAmount : Double?
	let rewardGiven : Double?
	let rewardDebited : Double?
	let rewardQty : Double?
	let txnsDate : String?
	let loyalityID : String?
	let programStartDate : String?
	let membershipName : String?
	let invoiceNo : String?
	let quantity : Int?
	let merchantName : String?
	let totalAwarded : Int?
	let transactionDate : String?
	let jTransactionDate : String?
	let amount : Double?
	let currencyName : String?
	let transactionType : String?
	let discount : Double?
	let serialNo : String?
	let remarks : String?
	let locationName : String?
	let grandTotalAmount : Double?
	let grandTotalAwarded : Double?
	let totAward : Int?
	let totDeebit : Int?
	let totAmt : Int?
	let totSalesReturn : Int?
	let salesReturn : Double?
	let ltyTranTempId : Int?
	let productCode : String?
	let productName : String?
	let authenticityCardImgPath : String?
	let isProgramValid : Int?
	let merchantUserId : Int?
	let memberCount : Int?
	let noOfAwardTrxn : Int?
	let noOfNotAwardTrxn : Int?
	let grandTotalRedemed : Double?
	let customerGrade : String?
	let customerType : String?
	let accountStatus : String?
	let verificationStatus : String?
	let brandName : String?
	let programID : Int?
	let programName : String?
	let programDesc : String?
	let status : Bool?
	let locationID : Int?
	let locationUserID : Int?
	let id : Int?
	let name : String?

	enum CodingKeys: String, CodingKey {

		case rewardCurrency = "rewardCurrency"
		case rewardCurrencyID = "rewardCurrencyID"
		case noofTrans = "noofTrans"
		case totalAmount = "totalAmount"
		case rewardGiven = "rewardGiven"
		case rewardDebited = "rewardDebited"
		case rewardQty = "rewardQty"
		case txnsDate = "txnsDate"
		case loyalityID = "loyalityID"
		case programStartDate = "programStartDate"
		case membershipName = "membershipName"
		case invoiceNo = "invoiceNo"
		case quantity = "quantity"
		case merchantName = "merchantName"
		case totalAwarded = "totalAwarded"
		case transactionDate = "transactionDate"
		case jTransactionDate = "jTransactionDate"
		case amount = "amount"
		case currencyName = "currencyName"
		case transactionType = "transactionType"
		case discount = "discount"
		case serialNo = "serialNo"
		case remarks = "remarks"
		case locationName = "locationName"
		case grandTotalAmount = "grandTotalAmount"
		case grandTotalAwarded = "grandTotalAwarded"
		case totAward = "totAward"
		case totDeebit = "totDeebit"
		case totAmt = "totAmt"
		case totSalesReturn = "totSalesReturn"
		case salesReturn = "salesReturn"
		case ltyTranTempId = "ltyTranTempId"
		case productCode = "productCode"
		case productName = "productName"
		case authenticityCardImgPath = "authenticityCardImgPath"
		case isProgramValid = "isProgramValid"
		case merchantUserId = "merchantUserId"
		case memberCount = "memberCount"
		case noOfAwardTrxn = "noOfAwardTrxn"
		case noOfNotAwardTrxn = "noOfNotAwardTrxn"
		case grandTotalRedemed = "grandTotalRedemed"
		case customerGrade = "customerGrade"
		case customerType = "customerType"
		case accountStatus = "accountStatus"
		case verificationStatus = "verificationStatus"
		case brandName = "brandName"
		case programID = "programID"
		case programName = "programName"
		case programDesc = "programDesc"
		case status = "status"
		case locationID = "locationID"
		case locationUserID = "locationUserID"
		case id = "id"
		case name = "name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		rewardCurrency = try values.decodeIfPresent(String.self, forKey: .rewardCurrency)
		rewardCurrencyID = try values.decodeIfPresent(Int.self, forKey: .rewardCurrencyID)
		noofTrans = try values.decodeIfPresent(Double.self, forKey: .noofTrans)
		totalAmount = try values.decodeIfPresent(Double.self, forKey: .totalAmount)
		rewardGiven = try values.decodeIfPresent(Double.self, forKey: .rewardGiven)
		rewardDebited = try values.decodeIfPresent(Double.self, forKey: .rewardDebited)
		rewardQty = try values.decodeIfPresent(Double.self, forKey: .rewardQty)
		txnsDate = try values.decodeIfPresent(String.self, forKey: .txnsDate)
		loyalityID = try values.decodeIfPresent(String.self, forKey: .loyalityID)
		programStartDate = try values.decodeIfPresent(String.self, forKey: .programStartDate)
		membershipName = try values.decodeIfPresent(String.self, forKey: .membershipName)
		invoiceNo = try values.decodeIfPresent(String.self, forKey: .invoiceNo)
		quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
		merchantName = try values.decodeIfPresent(String.self, forKey: .merchantName)
		totalAwarded = try values.decodeIfPresent(Int.self, forKey: .totalAwarded)
		transactionDate = try values.decodeIfPresent(String.self, forKey: .transactionDate)
		jTransactionDate = try values.decodeIfPresent(String.self, forKey: .jTransactionDate)
		amount = try values.decodeIfPresent(Double.self, forKey: .amount)
		currencyName = try values.decodeIfPresent(String.self, forKey: .currencyName)
		transactionType = try values.decodeIfPresent(String.self, forKey: .transactionType)
		discount = try values.decodeIfPresent(Double.self, forKey: .discount)
		serialNo = try values.decodeIfPresent(String.self, forKey: .serialNo)
		remarks = try values.decodeIfPresent(String.self, forKey: .remarks)
		locationName = try values.decodeIfPresent(String.self, forKey: .locationName)
		grandTotalAmount = try values.decodeIfPresent(Double.self, forKey: .grandTotalAmount)
		grandTotalAwarded = try values.decodeIfPresent(Double.self, forKey: .grandTotalAwarded)
		totAward = try values.decodeIfPresent(Int.self, forKey: .totAward)
		totDeebit = try values.decodeIfPresent(Int.self, forKey: .totDeebit)
		totAmt = try values.decodeIfPresent(Int.self, forKey: .totAmt)
		totSalesReturn = try values.decodeIfPresent(Int.self, forKey: .totSalesReturn)
		salesReturn = try values.decodeIfPresent(Double.self, forKey: .salesReturn)
		ltyTranTempId = try values.decodeIfPresent(Int.self, forKey: .ltyTranTempId)
		productCode = try values.decodeIfPresent(String.self, forKey: .productCode)
		productName = try values.decodeIfPresent(String.self, forKey: .productName)
		authenticityCardImgPath = try values.decodeIfPresent(String.self, forKey: .authenticityCardImgPath)
		isProgramValid = try values.decodeIfPresent(Int.self, forKey: .isProgramValid)
		merchantUserId = try values.decodeIfPresent(Int.self, forKey: .merchantUserId)
		memberCount = try values.decodeIfPresent(Int.self, forKey: .memberCount)
		noOfAwardTrxn = try values.decodeIfPresent(Int.self, forKey: .noOfAwardTrxn)
		noOfNotAwardTrxn = try values.decodeIfPresent(Int.self, forKey: .noOfNotAwardTrxn)
		grandTotalRedemed = try values.decodeIfPresent(Double.self, forKey: .grandTotalRedemed)
		customerGrade = try values.decodeIfPresent(String.self, forKey: .customerGrade)
		customerType = try values.decodeIfPresent(String.self, forKey: .customerType)
		accountStatus = try values.decodeIfPresent(String.self, forKey: .accountStatus)
		verificationStatus = try values.decodeIfPresent(String.self, forKey: .verificationStatus)
		brandName = try values.decodeIfPresent(String.self, forKey: .brandName)
		programID = try values.decodeIfPresent(Int.self, forKey: .programID)
		programName = try values.decodeIfPresent(String.self, forKey: .programName)
		programDesc = try values.decodeIfPresent(String.self, forKey: .programDesc)
		status = try values.decodeIfPresent(Bool.self, forKey: .status)
		locationID = try values.decodeIfPresent(Int.self, forKey: .locationID)
		locationUserID = try values.decodeIfPresent(Int.self, forKey: .locationUserID)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}

}