

import Foundation
struct RedemptionDetailsModels : Codable {
	let objDreamProduct : String?
	let objCatalogueList : [RedemptionCatalogueList]?
	let objCatalogueCategoryList : String?
	let objCatalogueRedemReqList : String?
	let catalogueImageGallery : String?
	let objCatalogueFixedPoints : String?
	let locationCites : String?
	let objCustShippingAddressDetails : RedemptionDetails?
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
		objCatalogueList = try values.decodeIfPresent([RedemptionCatalogueList].self, forKey: .objCatalogueList)
		objCatalogueCategoryList = try values.decodeIfPresent(String.self, forKey: .objCatalogueCategoryList)
		objCatalogueRedemReqList = try values.decodeIfPresent(String.self, forKey: .objCatalogueRedemReqList)
		catalogueImageGallery = try values.decodeIfPresent(String.self, forKey: .catalogueImageGallery)
		objCatalogueFixedPoints = try values.decodeIfPresent(String.self, forKey: .objCatalogueFixedPoints)
		locationCites = try values.decodeIfPresent(String.self, forKey: .locationCites)
		objCustShippingAddressDetails = try values.decodeIfPresent(RedemptionDetails.self, forKey: .objCustShippingAddressDetails)
		lstCatalogueProductAvailableCity = try values.decodeIfPresent(String.self, forKey: .lstCatalogueProductAvailableCity)
		returnValue = try values.decodeIfPresent(Int.self, forKey: .returnValue)
		returnMessage = try values.decodeIfPresent(String.self, forKey: .returnMessage)
		totalRecords = try values.decodeIfPresent(Int.self, forKey: .totalRecords)
	}

}
