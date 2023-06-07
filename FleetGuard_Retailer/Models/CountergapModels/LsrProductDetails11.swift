/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct LsrProductDetails11 : Codable {
	let skuId : Int?
	let skuName : String?
	let skuDesc : String?
	let discount : Int?
	let skuPrice : Double?
	let payment : String?
	let gstValue : String?
	let quantity : String?
	let productId : Int?
	let statusId : Int?
	let orderDetailsId : Int?
	let status : String?
	let salePrice : Double?
	let productCode : String?
	let productDesc : String?
	let productShortDesc : String?
	let productName : String?
	let productImg : String?
	let customerCartId : Int?
	let customerCartCount : Int?
	let sumQuantity : Int?
	let points : Int?
	let cat_Id1 : Int?
	let cat_Id2 : Int?
	let totalRows : Int?
	let cat_Name1 : String?
	let cat_Code1 : String?
	let cat_Image1 : String?
	let cat_Name2 : String?
	let uom : String?
	let color : String?
	let colorId : Int?
	let colorName : String?
	let colorHexaCode : String?
	let rate : Int?
	let brandId : Int?
	let brandImg : String?
	let catImages : String?
	let brandName : String?
	let partyLoyaltyId : String?
	let isCaseUOM : Int?
	let isSetUOM : Int?
	let isPairUOM : Int?
	let articleNo : String?
	let nlStatus : Int?
	let skuImage : String?
	let size_Desc : String?
	let size_Id : Int?
	let size_Code : String?
	let lsrCartProductDetails : String?
	let orderQuantity : Int?
	let isfavorite : Int?
	let mrp : String?
	let qrResult : Int?
	let orderSchemeId : Int?
	let orderSchemeName : String?
	let totalCartprdouct : Int?
	let programName : String?
	let programEndDate : String?
	let programDescription : String?
	let categoryId : Int?
	let token : String?
	let actorId : Int?
	let isActive : Bool?
	let actorRole : String?
	let actionType : Int?

	enum CodingKeys: String, CodingKey {

		case skuId = "skuId"
		case skuName = "skuName"
		case skuDesc = "skuDesc"
		case discount = "discount"
		case skuPrice = "skuPrice"
		case payment = "payment"
		case gstValue = "gstValue"
		case quantity = "quantity"
		case productId = "productId"
		case statusId = "statusId"
		case orderDetailsId = "orderDetailsId"
		case status = "status"
		case salePrice = "salePrice"
		case productCode = "productCode"
		case productDesc = "productDesc"
		case productShortDesc = "productShortDesc"
		case productName = "productName"
		case productImg = "productImg"
		case customerCartId = "customerCartId"
		case customerCartCount = "customerCartCount"
		case sumQuantity = "sumQuantity"
		case points = "points"
		case cat_Id1 = "cat_Id1"
		case cat_Id2 = "cat_Id2"
		case totalRows = "totalRows"
		case cat_Name1 = "cat_Name1"
		case cat_Code1 = "cat_Code1"
		case cat_Image1 = "cat_Image1"
		case cat_Name2 = "cat_Name2"
		case uom = "uom"
		case color = "color"
		case colorId = "colorId"
		case colorName = "colorName"
		case colorHexaCode = "colorHexaCode"
		case rate = "rate"
		case brandId = "brandId"
		case brandImg = "brandImg"
		case catImages = "catImages"
		case brandName = "brandName"
		case partyLoyaltyId = "partyLoyaltyId"
		case isCaseUOM = "isCaseUOM"
		case isSetUOM = "isSetUOM"
		case isPairUOM = "isPairUOM"
		case articleNo = "articleNo"
		case nlStatus = "nlStatus"
		case skuImage = "skuImage"
		case size_Desc = "size_Desc"
		case size_Id = "size_Id"
		case size_Code = "size_Code"
		case lsrCartProductDetails = "lsrCartProductDetails"
		case orderQuantity = "orderQuantity"
		case isfavorite = "isfavorite"
		case mrp = "mrp"
		case qrResult = "qrResult"
		case orderSchemeId = "orderSchemeId"
		case orderSchemeName = "orderSchemeName"
		case totalCartprdouct = "totalCartprdouct"
		case programName = "programName"
		case programEndDate = "programEndDate"
		case programDescription = "programDescription"
		case categoryId = "categoryId"
		case token = "token"
		case actorId = "actorId"
		case isActive = "isActive"
		case actorRole = "actorRole"
		case actionType = "actionType"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		skuId = try values.decodeIfPresent(Int.self, forKey: .skuId)
		skuName = try values.decodeIfPresent(String.self, forKey: .skuName)
		skuDesc = try values.decodeIfPresent(String.self, forKey: .skuDesc)
		discount = try values.decodeIfPresent(Int.self, forKey: .discount)
		skuPrice = try values.decodeIfPresent(Double.self, forKey: .skuPrice)
		payment = try values.decodeIfPresent(String.self, forKey: .payment)
		gstValue = try values.decodeIfPresent(String.self, forKey: .gstValue)
		quantity = try values.decodeIfPresent(String.self, forKey: .quantity)
		productId = try values.decodeIfPresent(Int.self, forKey: .productId)
		statusId = try values.decodeIfPresent(Int.self, forKey: .statusId)
		orderDetailsId = try values.decodeIfPresent(Int.self, forKey: .orderDetailsId)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		salePrice = try values.decodeIfPresent(Double.self, forKey: .salePrice)
		productCode = try values.decodeIfPresent(String.self, forKey: .productCode)
		productDesc = try values.decodeIfPresent(String.self, forKey: .productDesc)
		productShortDesc = try values.decodeIfPresent(String.self, forKey: .productShortDesc)
		productName = try values.decodeIfPresent(String.self, forKey: .productName)
		productImg = try values.decodeIfPresent(String.self, forKey: .productImg)
		customerCartId = try values.decodeIfPresent(Int.self, forKey: .customerCartId)
		customerCartCount = try values.decodeIfPresent(Int.self, forKey: .customerCartCount)
		sumQuantity = try values.decodeIfPresent(Int.self, forKey: .sumQuantity)
		points = try values.decodeIfPresent(Int.self, forKey: .points)
		cat_Id1 = try values.decodeIfPresent(Int.self, forKey: .cat_Id1)
		cat_Id2 = try values.decodeIfPresent(Int.self, forKey: .cat_Id2)
		totalRows = try values.decodeIfPresent(Int.self, forKey: .totalRows)
		cat_Name1 = try values.decodeIfPresent(String.self, forKey: .cat_Name1)
		cat_Code1 = try values.decodeIfPresent(String.self, forKey: .cat_Code1)
		cat_Image1 = try values.decodeIfPresent(String.self, forKey: .cat_Image1)
		cat_Name2 = try values.decodeIfPresent(String.self, forKey: .cat_Name2)
		uom = try values.decodeIfPresent(String.self, forKey: .uom)
		color = try values.decodeIfPresent(String.self, forKey: .color)
		colorId = try values.decodeIfPresent(Int.self, forKey: .colorId)
		colorName = try values.decodeIfPresent(String.self, forKey: .colorName)
		colorHexaCode = try values.decodeIfPresent(String.self, forKey: .colorHexaCode)
		rate = try values.decodeIfPresent(Int.self, forKey: .rate)
		brandId = try values.decodeIfPresent(Int.self, forKey: .brandId)
		brandImg = try values.decodeIfPresent(String.self, forKey: .brandImg)
		catImages = try values.decodeIfPresent(String.self, forKey: .catImages)
		brandName = try values.decodeIfPresent(String.self, forKey: .brandName)
		partyLoyaltyId = try values.decodeIfPresent(String.self, forKey: .partyLoyaltyId)
		isCaseUOM = try values.decodeIfPresent(Int.self, forKey: .isCaseUOM)
		isSetUOM = try values.decodeIfPresent(Int.self, forKey: .isSetUOM)
		isPairUOM = try values.decodeIfPresent(Int.self, forKey: .isPairUOM)
		articleNo = try values.decodeIfPresent(String.self, forKey: .articleNo)
		nlStatus = try values.decodeIfPresent(Int.self, forKey: .nlStatus)
		skuImage = try values.decodeIfPresent(String.self, forKey: .skuImage)
		size_Desc = try values.decodeIfPresent(String.self, forKey: .size_Desc)
		size_Id = try values.decodeIfPresent(Int.self, forKey: .size_Id)
		size_Code = try values.decodeIfPresent(String.self, forKey: .size_Code)
		lsrCartProductDetails = try values.decodeIfPresent(String.self, forKey: .lsrCartProductDetails)
		orderQuantity = try values.decodeIfPresent(Int.self, forKey: .orderQuantity)
		isfavorite = try values.decodeIfPresent(Int.self, forKey: .isfavorite)
		mrp = try values.decodeIfPresent(String.self, forKey: .mrp)
		qrResult = try values.decodeIfPresent(Int.self, forKey: .qrResult)
		orderSchemeId = try values.decodeIfPresent(Int.self, forKey: .orderSchemeId)
		orderSchemeName = try values.decodeIfPresent(String.self, forKey: .orderSchemeName)
		totalCartprdouct = try values.decodeIfPresent(Int.self, forKey: .totalCartprdouct)
		programName = try values.decodeIfPresent(String.self, forKey: .programName)
		programEndDate = try values.decodeIfPresent(String.self, forKey: .programEndDate)
		programDescription = try values.decodeIfPresent(String.self, forKey: .programDescription)
		categoryId = try values.decodeIfPresent(Int.self, forKey: .categoryId)
		token = try values.decodeIfPresent(String.self, forKey: .token)
		actorId = try values.decodeIfPresent(Int.self, forKey: .actorId)
		isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
		actorRole = try values.decodeIfPresent(String.self, forKey: .actorRole)
		actionType = try values.decodeIfPresent(Int.self, forKey: .actionType)
	}

}
