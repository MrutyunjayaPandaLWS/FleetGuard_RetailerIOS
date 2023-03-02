/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct LstCustOrderDeliveryDetails : Codable {
	let orderID : Int?
	let productName : String?
	let orderNo : String?
	let invoiceNo : String?
	let invoiceDate : String?
	let prodCode : String?
	let productId : Int?
	let deliveryAddress : String?
	let deliveryStatus : String?
	let deliveryStatusID : Int?
	let quantity : Int?
	let orderDate : String?
	let finalAmount : String?
	let sourceMode : String?
	let sourceModeID : Int?
	let distributorName : String?
	let distributorCode : String?
	let orderDetailsID : Int?
	let skuId : Int?
	let sku : String?
	let uom : String?
	let color : String?
	let rate : String?
	let sellingPrice : Double?
	let netItemValue : Double?
	let customerMobile : String?
	let customerCode : String?
	let categoryName : String?
	let dealerName : String?
	let customerName : String?
	let orderStatus : String?
	let orderStatusId : Int?
	let mrp : Double?
	let skuRate : Double?
	let distributorUserId : Int?
	let customerUserId : Int?
	let productImg : String?
	let customerTypeId : Int?
	let orderQuantity : Int?
	let totalRow : Int?
	let district : String?
	let state : String?
	let toState : String?
	let toPlace : String?
	let coupon : String?
	let scheme : String?
	let status : String?
	let toUserType : String?
	let plant : String?
	let transacationType : String?
	let toRetailer : String?
	let balancecoupon : String?
	let redemptionDate : String?
	let loyaltyID : String?
	let trxn_Date : String?
	let articleNo : String?
	let size : String?

	enum CodingKeys: String, CodingKey {

		case orderID = "orderID"
		case productName = "productName"
		case orderNo = "orderNo"
		case invoiceNo = "invoiceNo"
		case invoiceDate = "invoiceDate"
		case prodCode = "prodCode"
		case productId = "productId"
		case deliveryAddress = "deliveryAddress"
		case deliveryStatus = "deliveryStatus"
		case deliveryStatusID = "deliveryStatusID"
		case quantity = "quantity"
		case orderDate = "orderDate"
		case finalAmount = "finalAmount"
		case sourceMode = "sourceMode"
		case sourceModeID = "sourceModeID"
		case distributorName = "distributorName"
		case distributorCode = "distributorCode"
		case orderDetailsID = "orderDetailsID"
		case skuId = "skuId"
		case sku = "sku"
		case uom = "uom"
		case color = "color"
		case rate = "rate"
		case sellingPrice = "sellingPrice"
		case netItemValue = "netItemValue"
		case customerMobile = "customerMobile"
		case customerCode = "customerCode"
		case categoryName = "categoryName"
		case dealerName = "dealerName"
		case customerName = "customerName"
		case orderStatus = "orderStatus"
		case orderStatusId = "orderStatusId"
		case mrp = "mrp"
		case skuRate = "skuRate"
		case distributorUserId = "distributorUserId"
		case customerUserId = "customerUserId"
		case productImg = "productImg"
		case customerTypeId = "customerTypeId"
		case orderQuantity = "orderQuantity"
		case totalRow = "totalRow"
		case district = "district"
		case state = "state"
		case toState = "toState"
		case toPlace = "toPlace"
		case coupon = "coupon"
		case scheme = "scheme"
		case status = "status"
		case toUserType = "toUserType"
		case plant = "plant"
		case transacationType = "transacationType"
		case toRetailer = "toRetailer"
		case balancecoupon = "balancecoupon"
		case redemptionDate = "redemptionDate"
		case loyaltyID = "loyaltyID"
		case trxn_Date = "trxn_Date"
		case articleNo = "articleNo"
		case size = "size"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		orderID = try values.decodeIfPresent(Int.self, forKey: .orderID)
		productName = try values.decodeIfPresent(String.self, forKey: .productName)
		orderNo = try values.decodeIfPresent(String.self, forKey: .orderNo)
		invoiceNo = try values.decodeIfPresent(String.self, forKey: .invoiceNo)
		invoiceDate = try values.decodeIfPresent(String.self, forKey: .invoiceDate)
		prodCode = try values.decodeIfPresent(String.self, forKey: .prodCode)
		productId = try values.decodeIfPresent(Int.self, forKey: .productId)
		deliveryAddress = try values.decodeIfPresent(String.self, forKey: .deliveryAddress)
		deliveryStatus = try values.decodeIfPresent(String.self, forKey: .deliveryStatus)
		deliveryStatusID = try values.decodeIfPresent(Int.self, forKey: .deliveryStatusID)
		quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
		orderDate = try values.decodeIfPresent(String.self, forKey: .orderDate)
		finalAmount = try values.decodeIfPresent(String.self, forKey: .finalAmount)
		sourceMode = try values.decodeIfPresent(String.self, forKey: .sourceMode)
		sourceModeID = try values.decodeIfPresent(Int.self, forKey: .sourceModeID)
		distributorName = try values.decodeIfPresent(String.self, forKey: .distributorName)
		distributorCode = try values.decodeIfPresent(String.self, forKey: .distributorCode)
		orderDetailsID = try values.decodeIfPresent(Int.self, forKey: .orderDetailsID)
		skuId = try values.decodeIfPresent(Int.self, forKey: .skuId)
		sku = try values.decodeIfPresent(String.self, forKey: .sku)
		uom = try values.decodeIfPresent(String.self, forKey: .uom)
		color = try values.decodeIfPresent(String.self, forKey: .color)
		rate = try values.decodeIfPresent(String.self, forKey: .rate)
		sellingPrice = try values.decodeIfPresent(Double.self, forKey: .sellingPrice)
		netItemValue = try values.decodeIfPresent(Double.self, forKey: .netItemValue)
		customerMobile = try values.decodeIfPresent(String.self, forKey: .customerMobile)
		customerCode = try values.decodeIfPresent(String.self, forKey: .customerCode)
		categoryName = try values.decodeIfPresent(String.self, forKey: .categoryName)
		dealerName = try values.decodeIfPresent(String.self, forKey: .dealerName)
		customerName = try values.decodeIfPresent(String.self, forKey: .customerName)
		orderStatus = try values.decodeIfPresent(String.self, forKey: .orderStatus)
		orderStatusId = try values.decodeIfPresent(Int.self, forKey: .orderStatusId)
		mrp = try values.decodeIfPresent(Double.self, forKey: .mrp)
		skuRate = try values.decodeIfPresent(Double.self, forKey: .skuRate)
		distributorUserId = try values.decodeIfPresent(Int.self, forKey: .distributorUserId)
		customerUserId = try values.decodeIfPresent(Int.self, forKey: .customerUserId)
		productImg = try values.decodeIfPresent(String.self, forKey: .productImg)
		customerTypeId = try values.decodeIfPresent(Int.self, forKey: .customerTypeId)
		orderQuantity = try values.decodeIfPresent(Int.self, forKey: .orderQuantity)
		totalRow = try values.decodeIfPresent(Int.self, forKey: .totalRow)
		district = try values.decodeIfPresent(String.self, forKey: .district)
		state = try values.decodeIfPresent(String.self, forKey: .state)
		toState = try values.decodeIfPresent(String.self, forKey: .toState)
		toPlace = try values.decodeIfPresent(String.self, forKey: .toPlace)
		coupon = try values.decodeIfPresent(String.self, forKey: .coupon)
		scheme = try values.decodeIfPresent(String.self, forKey: .scheme)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		toUserType = try values.decodeIfPresent(String.self, forKey: .toUserType)
		plant = try values.decodeIfPresent(String.self, forKey: .plant)
		transacationType = try values.decodeIfPresent(String.self, forKey: .transacationType)
		toRetailer = try values.decodeIfPresent(String.self, forKey: .toRetailer)
		balancecoupon = try values.decodeIfPresent(String.self, forKey: .balancecoupon)
		redemptionDate = try values.decodeIfPresent(String.self, forKey: .redemptionDate)
		loyaltyID = try values.decodeIfPresent(String.self, forKey: .loyaltyID)
		trxn_Date = try values.decodeIfPresent(String.self, forKey: .trxn_Date)
		articleNo = try values.decodeIfPresent(String.self, forKey: .articleNo)
		size = try values.decodeIfPresent(String.self, forKey: .size)
	}

}