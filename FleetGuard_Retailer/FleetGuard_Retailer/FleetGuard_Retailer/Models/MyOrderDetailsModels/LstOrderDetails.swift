/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct LstOrderDetails : Codable {
	let orderNumberApi : String?
	let orderDateApi : String?
	let dueDate : String?
	let dueAmount : Int?
	let finalAmountApi : Int?
	let toPassStatusApi : Int?
	let isButtonShow : Int?
	let invoiceNOApi : String?
	let invoiceDate : String?
	let orderDetailsId : Int?
	let orderStatus : Int?
	let quantity : Int?
	let customerName : String?
	let customerLoyaltyId : String?
	let customerUserId : Int?
	let mobile : String?
	let lstCustomerCartApi : [LstCustomerCartApi]?
	let lstApproverOrderDetailsApi : String?
	let producType : String?
	let producClass : String?
	let subCategory : String?
	let gender : String?

	enum CodingKeys: String, CodingKey {

		case orderNumberApi = "orderNumberApi"
		case orderDateApi = "orderDateApi"
		case dueDate = "dueDate"
		case dueAmount = "dueAmount"
		case finalAmountApi = "finalAmountApi"
		case toPassStatusApi = "toPassStatusApi"
		case isButtonShow = "isButtonShow"
		case invoiceNOApi = "invoiceNOApi"
		case invoiceDate = "invoiceDate"
		case orderDetailsId = "orderDetailsId"
		case orderStatus = "orderStatus"
		case quantity = "quantity"
		case customerName = "customerName"
		case customerLoyaltyId = "customerLoyaltyId"
		case customerUserId = "customerUserId"
		case mobile = "mobile"
		case lstCustomerCartApi = "lstCustomerCartApi"
		case lstApproverOrderDetailsApi = "lstApproverOrderDetailsApi"
		case producType = "producType"
		case producClass = "producClass"
		case subCategory = "subCategory"
		case gender = "gender"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		orderNumberApi = try values.decodeIfPresent(String.self, forKey: .orderNumberApi)
		orderDateApi = try values.decodeIfPresent(String.self, forKey: .orderDateApi)
		dueDate = try values.decodeIfPresent(String.self, forKey: .dueDate)
		dueAmount = try values.decodeIfPresent(Int.self, forKey: .dueAmount)
		finalAmountApi = try values.decodeIfPresent(Int.self, forKey: .finalAmountApi)
		toPassStatusApi = try values.decodeIfPresent(Int.self, forKey: .toPassStatusApi)
		isButtonShow = try values.decodeIfPresent(Int.self, forKey: .isButtonShow)
		invoiceNOApi = try values.decodeIfPresent(String.self, forKey: .invoiceNOApi)
		invoiceDate = try values.decodeIfPresent(String.self, forKey: .invoiceDate)
		orderDetailsId = try values.decodeIfPresent(Int.self, forKey: .orderDetailsId)
		orderStatus = try values.decodeIfPresent(Int.self, forKey: .orderStatus)
		quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
		customerName = try values.decodeIfPresent(String.self, forKey: .customerName)
		customerLoyaltyId = try values.decodeIfPresent(String.self, forKey: .customerLoyaltyId)
		customerUserId = try values.decodeIfPresent(Int.self, forKey: .customerUserId)
		mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
		lstCustomerCartApi = try values.decodeIfPresent([LstCustomerCartApi].self, forKey: .lstCustomerCartApi)
		lstApproverOrderDetailsApi = try values.decodeIfPresent(String.self, forKey: .lstApproverOrderDetailsApi)
		producType = try values.decodeIfPresent(String.self, forKey: .producType)
		producClass = try values.decodeIfPresent(String.self, forKey: .producClass)
		subCategory = try values.decodeIfPresent(String.self, forKey: .subCategory)
		gender = try values.decodeIfPresent(String.self, forKey: .gender)
	}

}