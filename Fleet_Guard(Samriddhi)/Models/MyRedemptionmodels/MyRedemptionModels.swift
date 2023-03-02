/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct MyRedemptionModels : Codable {
	let objDreamProduct : String?
	let objCatalogueList : String?
	let objCatalogueCategoryList : String?
	let objCatalogueRedemReqList : [ObjCatalogueRedemReqList1]?
	let catalogueImageGallery : String?
	let objCatalogueFixedPoints : String?
	let locationCites : String?
	let objCustShippingAddressDetails : String?
	let lstCatalogueProductAvailableCity : String?
	let returnValue : Int?
	let returnMessage : String?
	let totalRecords : Int?

	enum CodingKeys: String, CodingKey {

		case objDreamProduct = "objDreamProduct"
		case objCatalogueList = "objCatalogueList"
		case objCatalogueCategoryList = "objCatalogueCategoryList"
		case objCatalogueRedemReqList = "objCatalogueRedemReqList"
		case catalogueImageGallery = "catalogueImageGallery"
		case objCatalogueFixedPoints = "objCatalogueFixedPoints"
		case locationCites = "locationCites"
		case objCustShippingAddressDetails = "objCustShippingAddressDetails"
		case lstCatalogueProductAvailableCity = "lstCatalogueProductAvailableCity"
		case returnValue = "returnValue"
		case returnMessage = "returnMessage"
		case totalRecords = "totalRecords"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		objDreamProduct = try values.decodeIfPresent(String.self, forKey: .objDreamProduct)
		objCatalogueList = try values.decodeIfPresent(String.self, forKey: .objCatalogueList)
		objCatalogueCategoryList = try values.decodeIfPresent(String.self, forKey: .objCatalogueCategoryList)
		objCatalogueRedemReqList = try values.decodeIfPresent([ObjCatalogueRedemReqList1].self, forKey: .objCatalogueRedemReqList)
		catalogueImageGallery = try values.decodeIfPresent(String.self, forKey: .catalogueImageGallery)
		objCatalogueFixedPoints = try values.decodeIfPresent(String.self, forKey: .objCatalogueFixedPoints)
		locationCites = try values.decodeIfPresent(String.self, forKey: .locationCites)
		objCustShippingAddressDetails = try values.decodeIfPresent(String.self, forKey: .objCustShippingAddressDetails)
		lstCatalogueProductAvailableCity = try values.decodeIfPresent(String.self, forKey: .lstCatalogueProductAvailableCity)
		returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
		totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
	}

}
