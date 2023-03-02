/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct LstCustomerJson : Codable {
	let customerId : Int?
	let merchantId : Int?
	let loyaltyId : String?
	let displayImage : String?
	let title : String?
	let locationId : Int?
	let firstName : String?
	let lastName : String?
	let mobile : String?
	let mobilePrefix : String?
	let email : String?
	let mobile_Two : String?
	let jCreatedDate : String?
	let jdob : String?
	let jAnniversary : String?
	let dob : String?
	let domain : String?
	let address1 : String?
	let address2 : String?
	let addressId : Int?
	let countryName : String?
	let countryId : Int?
	let stateId : Int?
	let stateName : String?
	let cityId : Int?
	let cityName : String?
	let nativeCountryId : Int?
	let nativeStateId : Int?
	let regType : String?
	let regStatus : Int?
	let mobileNumberLimitation : Int?
	let enrollmentReferenceNumber : String?
	let jEnrollmentReferenceDate : String?
	let zip : String?
	let district : String?
	let landmark : String?
	let village : String?
	let tehsilBlockMandal : String?
	let customer_Grade_ID : Int?
	let isVerified : Int?
	let customerTypeID : Int?
	let customerType : String?
	let vehicleID : Int?
	let vehicleNumber : String?
	let chassisNumber : String?
	let modelNumber : String?
	let jInsuranceExpDate : String?
	let laborAmount : Int?
	let policyNumber : String?
	let jD_InvoiceNo : String?
	let jjD_InvoiceDate : String?
	let jPolicyDate : String?
	let insuranceRenewalAmount : Int?
	let isGradeVerified : Bool?
	let isBlackListed : Bool?
	let accountNumber : String?
	let acountHolderName : String?
	let bankName : String?
	let bankBranch : String?
	let ifscCode : String?
	let districtId : Int?
	let talukName : String?
	let districtName : String?
	let talukId : Int?
	let locationName : String?
	let walletNumber : String?
	let bankAccountVerifiedStatus : Int?
	let referedBy : String?
	let customerCategoryId : Int?
	let nominee : String?
	let nativeStateName : String?
	let customerDetailId : Int?
	let lIdentificationType : Int?
	let identificationOthers : String?
	let identificationNo : String?
	let professionId : Int?
	let ageGroupId : Int?
	let anniversary : String?
	let incomeRangeId : Int?
	let maritalStatus : String?
	let profilePicture : String?
	let emailStatus : Int?
	let locality : String?
	let executiveName : String?
	let gender : String?
	let customerRemarks : String?
	let languageId : Int?
	let religionID : Int?
	let isSmartphoneUser : Bool?
	let isWhatsappUser : Bool?
	let languageName : String?
	let nomineeDOB : String?
	let customerRelationshipId : Int?
	let locationCode : String?
	let custFamilyId : Int?
	let familyMemberName : String?
	let familyMemberBirthday : String?
	let relationship : String?
	let vehicleBrand : String?
	let whatsAppNumber : String?
	let userId : Int?
	let bankCountryId : Int?
	let bankCountryName : String?
	let currency : String?
	let bankAddress : String?
	let ibanNumber : String?
	let bicSwiftCode : String?
	let bsbAbaRoutingNumber : String?
	let currencyId : Int?
	let accountStatus : String?
	let contractName : String?
	let contractId : Int?
	let contractFileName : String?
	let remarks : String?
	let accountComStatus : Int?
	let isActive : Int?
	let accountTypeID : Int?
	let accountType : String?
	let customerGrade : String?
	let tradeLicence : String?
	let password : String?
	let vehicleType : String?
	let engineNumber : String?
	let invoiceNo : String?
	let invoiceAmount : String?
	let customerTypeId : Int?
	let relateD_PROJECT_TYPE : String?
	let jDateOfSale : String?
	let isVinChassis_Active : String?
	let isUpdatePassword : Bool?
	let addressLatitude : String?
	let addressLongitude : String?
	let plainPassword : String?
	let registrationSource : Int?
	let bankPassbookImage : String?
	let isBankPassbookNewImage : Bool?
	let verifiedStatus : String?
	let loyaltyIdAutoGen : Bool?
	let company : String?
	let areaId : Int?
	let referralCode : String?
	let parentCustomerId : Int?
	let payOut : Int?
	let taxId : String?
	let recipientPhonenumber : String?
	let bankCity : String?
	let autoAccountType : String?
	let recipientType : String?
	let autoBankCounty : String?
	let autoBankPostCode : String?
	let bankCode : String?
	let createdDate : String?
	let pointBalance : Double?
	let createdBy : String?
	let enrollmentReferenceDate : String?
	let areaName : String?
	let branchCode : String?
	let customerOrderCount : Int?
	let departmentId : Int?
	let designationId : Int?
	let referrerCode : String?
	let insuranceExpDate : String?
	let jD_InvoiceDate : String?
	let policyDate : String?
	let customerCategory : String?
	let walletVerifiedStatus : Bool?
	let enrollmentStatus : Bool?
	let dealerUserId : String?
	let dealerName : String?
	let aadharNumber : String?

	enum CodingKeys: String, CodingKey {

		case customerId = "customerId"
		case merchantId = "merchantId"
		case loyaltyId = "loyaltyId"
		case displayImage = "displayImage"
		case title = "title"
		case locationId = "locationId"
		case firstName = "firstName"
		case lastName = "lastName"
		case mobile = "mobile"
		case mobilePrefix = "mobilePrefix"
		case email = "email"
		case mobile_Two = "mobile_Two"
		case jCreatedDate = "jCreatedDate"
		case jdob = "jdob"
		case jAnniversary = "jAnniversary"
		case dob = "dob"
		case domain = "domain"
		case address1 = "address1"
		case address2 = "address2"
		case addressId = "addressId"
		case countryName = "countryName"
		case countryId = "countryId"
		case stateId = "stateId"
		case stateName = "stateName"
		case cityId = "cityId"
		case cityName = "cityName"
		case nativeCountryId = "nativeCountryId"
		case nativeStateId = "nativeStateId"
		case regType = "regType"
		case regStatus = "regStatus"
		case mobileNumberLimitation = "mobileNumberLimitation"
		case enrollmentReferenceNumber = "enrollmentReferenceNumber"
		case jEnrollmentReferenceDate = "jEnrollmentReferenceDate"
		case zip = "zip"
		case district = "district"
		case landmark = "landmark"
		case village = "village"
		case tehsilBlockMandal = "tehsilBlockMandal"
		case customer_Grade_ID = "customer_Grade_ID"
		case isVerified = "isVerified"
		case customerTypeID = "customerTypeID"
		case customerType = "customerType"
		case vehicleID = "vehicleID"
		case vehicleNumber = "vehicleNumber"
		case chassisNumber = "chassisNumber"
		case modelNumber = "modelNumber"
		case jInsuranceExpDate = "jInsuranceExpDate"
		case laborAmount = "laborAmount"
		case policyNumber = "policyNumber"
		case jD_InvoiceNo = "jD_InvoiceNo"
		case jjD_InvoiceDate = "jjD_InvoiceDate"
		case jPolicyDate = "jPolicyDate"
		case insuranceRenewalAmount = "insuranceRenewalAmount"
		case isGradeVerified = "isGradeVerified"
		case isBlackListed = "isBlackListed"
		case accountNumber = "accountNumber"
		case acountHolderName = "acountHolderName"
		case bankName = "bankName"
		case bankBranch = "bankBranch"
		case ifscCode = "ifscCode"
		case districtId = "districtId"
		case talukName = "talukName"
		case districtName = "districtName"
		case talukId = "talukId"
		case locationName = "locationName"
		case walletNumber = "walletNumber"
		case bankAccountVerifiedStatus = "bankAccountVerifiedStatus"
		case referedBy = "referedBy"
		case customerCategoryId = "customerCategoryId"
		case nominee = "nominee"
		case nativeStateName = "nativeStateName"
		case customerDetailId = "customerDetailId"
		case lIdentificationType = "lIdentificationType"
		case identificationOthers = "identificationOthers"
		case identificationNo = "identificationNo"
		case professionId = "professionId"
		case ageGroupId = "ageGroupId"
		case anniversary = "anniversary"
		case incomeRangeId = "incomeRangeId"
		case maritalStatus = "maritalStatus"
		case profilePicture = "profilePicture"
		case emailStatus = "emailStatus"
		case locality = "locality"
		case executiveName = "executiveName"
		case gender = "gender"
		case customerRemarks = "customerRemarks"
		case languageId = "languageId"
		case religionID = "religionID"
		case isSmartphoneUser = "isSmartphoneUser"
		case isWhatsappUser = "isWhatsappUser"
		case languageName = "languageName"
		case nomineeDOB = "nomineeDOB"
		case customerRelationshipId = "customerRelationshipId"
		case locationCode = "locationCode"
		case custFamilyId = "custFamilyId"
		case familyMemberName = "familyMemberName"
		case familyMemberBirthday = "familyMemberBirthday"
		case relationship = "relationship"
		case vehicleBrand = "vehicleBrand"
		case whatsAppNumber = "whatsAppNumber"
		case userId = "userId"
		case bankCountryId = "bankCountryId"
		case bankCountryName = "bankCountryName"
		case currency = "currency"
		case bankAddress = "bankAddress"
		case ibanNumber = "ibanNumber"
		case bicSwiftCode = "bicSwiftCode"
		case bsbAbaRoutingNumber = "bsbAbaRoutingNumber"
		case currencyId = "currencyId"
		case accountStatus = "accountStatus"
		case contractName = "contractName"
		case contractId = "contractId"
		case contractFileName = "contractFileName"
		case remarks = "remarks"
		case accountComStatus = "accountComStatus"
		case isActive = "isActive"
		case accountTypeID = "accountTypeID"
		case accountType = "accountType"
		case customerGrade = "customerGrade"
		case tradeLicence = "tradeLicence"
		case password = "password"
		case vehicleType = "vehicleType"
		case engineNumber = "engineNumber"
		case invoiceNo = "invoiceNo"
		case invoiceAmount = "invoiceAmount"
		case customerTypeId = "customerTypeId"
		case relateD_PROJECT_TYPE = "relateD_PROJECT_TYPE"
		case jDateOfSale = "jDateOfSale"
		case isVinChassis_Active = "isVinChassis_Active"
		case isUpdatePassword = "isUpdatePassword"
		case addressLatitude = "addressLatitude"
		case addressLongitude = "addressLongitude"
		case plainPassword = "plainPassword"
		case registrationSource = "registrationSource"
		case bankPassbookImage = "bankPassbookImage"
		case isBankPassbookNewImage = "isBankPassbookNewImage"
		case verifiedStatus = "verifiedStatus"
		case loyaltyIdAutoGen = "loyaltyIdAutoGen"
		case company = "company"
		case areaId = "areaId"
		case referralCode = "referralCode"
		case parentCustomerId = "parentCustomerId"
		case payOut = "payOut"
		case taxId = "taxId"
		case recipientPhonenumber = "recipientPhonenumber"
		case bankCity = "bankCity"
		case autoAccountType = "autoAccountType"
		case recipientType = "recipientType"
		case autoBankCounty = "autoBankCounty"
		case autoBankPostCode = "autoBankPostCode"
		case bankCode = "bankCode"
		case createdDate = "createdDate"
		case pointBalance = "pointBalance"
		case createdBy = "createdBy"
		case enrollmentReferenceDate = "enrollmentReferenceDate"
		case areaName = "areaName"
		case branchCode = "branchCode"
		case customerOrderCount = "customerOrderCount"
		case departmentId = "departmentId"
		case designationId = "designationId"
		case referrerCode = "referrerCode"
		case insuranceExpDate = "insuranceExpDate"
		case jD_InvoiceDate = "jD_InvoiceDate"
		case policyDate = "policyDate"
		case customerCategory = "customerCategory"
		case walletVerifiedStatus = "walletVerifiedStatus"
		case enrollmentStatus = "enrollmentStatus"
		case dealerUserId = "dealerUserId"
		case dealerName = "dealerName"
		case aadharNumber = "aadharNumber"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		customerId = try values.decodeIfPresent(Int.self, forKey: .customerId)
		merchantId = try values.decodeIfPresent(Int.self, forKey: .merchantId)
		loyaltyId = try values.decodeIfPresent(String.self, forKey: .loyaltyId)
		displayImage = try values.decodeIfPresent(String.self, forKey: .displayImage)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		locationId = try values.decodeIfPresent(Int.self, forKey: .locationId)
		firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
		lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
		mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
		mobilePrefix = try values.decodeIfPresent(String.self, forKey: .mobilePrefix)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		mobile_Two = try values.decodeIfPresent(String.self, forKey: .mobile_Two)
		jCreatedDate = try values.decodeIfPresent(String.self, forKey: .jCreatedDate)
		jdob = try values.decodeIfPresent(String.self, forKey: .jdob)
		jAnniversary = try values.decodeIfPresent(String.self, forKey: .jAnniversary)
		dob = try values.decodeIfPresent(String.self, forKey: .dob)
		domain = try values.decodeIfPresent(String.self, forKey: .domain)
		address1 = try values.decodeIfPresent(String.self, forKey: .address1)
		address2 = try values.decodeIfPresent(String.self, forKey: .address2)
		addressId = try values.decodeIfPresent(Int.self, forKey: .addressId)
		countryName = try values.decodeIfPresent(String.self, forKey: .countryName)
		countryId = try values.decodeIfPresent(Int.self, forKey: .countryId)
		stateId = try values.decodeIfPresent(Int.self, forKey: .stateId)
		stateName = try values.decodeIfPresent(String.self, forKey: .stateName)
		cityId = try values.decodeIfPresent(Int.self, forKey: .cityId)
		cityName = try values.decodeIfPresent(String.self, forKey: .cityName)
		nativeCountryId = try values.decodeIfPresent(Int.self, forKey: .nativeCountryId)
		nativeStateId = try values.decodeIfPresent(Int.self, forKey: .nativeStateId)
		regType = try values.decodeIfPresent(String.self, forKey: .regType)
		regStatus = try values.decodeIfPresent(Int.self, forKey: .regStatus)
		mobileNumberLimitation = try values.decodeIfPresent(Int.self, forKey: .mobileNumberLimitation)
		enrollmentReferenceNumber = try values.decodeIfPresent(String.self, forKey: .enrollmentReferenceNumber)
		jEnrollmentReferenceDate = try values.decodeIfPresent(String.self, forKey: .jEnrollmentReferenceDate)
		zip = try values.decodeIfPresent(String.self, forKey: .zip)
		district = try values.decodeIfPresent(String.self, forKey: .district)
		landmark = try values.decodeIfPresent(String.self, forKey: .landmark)
		village = try values.decodeIfPresent(String.self, forKey: .village)
		tehsilBlockMandal = try values.decodeIfPresent(String.self, forKey: .tehsilBlockMandal)
		customer_Grade_ID = try values.decodeIfPresent(Int.self, forKey: .customer_Grade_ID)
		isVerified = try values.decodeIfPresent(Int.self, forKey: .isVerified)
		customerTypeID = try values.decodeIfPresent(Int.self, forKey: .customerTypeID)
		customerType = try values.decodeIfPresent(String.self, forKey: .customerType)
		vehicleID = try values.decodeIfPresent(Int.self, forKey: .vehicleID)
		vehicleNumber = try values.decodeIfPresent(String.self, forKey: .vehicleNumber)
		chassisNumber = try values.decodeIfPresent(String.self, forKey: .chassisNumber)
		modelNumber = try values.decodeIfPresent(String.self, forKey: .modelNumber)
		jInsuranceExpDate = try values.decodeIfPresent(String.self, forKey: .jInsuranceExpDate)
		laborAmount = try values.decodeIfPresent(Int.self, forKey: .laborAmount)
		policyNumber = try values.decodeIfPresent(String.self, forKey: .policyNumber)
		jD_InvoiceNo = try values.decodeIfPresent(String.self, forKey: .jD_InvoiceNo)
		jjD_InvoiceDate = try values.decodeIfPresent(String.self, forKey: .jjD_InvoiceDate)
		jPolicyDate = try values.decodeIfPresent(String.self, forKey: .jPolicyDate)
		insuranceRenewalAmount = try values.decodeIfPresent(Int.self, forKey: .insuranceRenewalAmount)
		isGradeVerified = try values.decodeIfPresent(Bool.self, forKey: .isGradeVerified)
		isBlackListed = try values.decodeIfPresent(Bool.self, forKey: .isBlackListed)
		accountNumber = try values.decodeIfPresent(String.self, forKey: .accountNumber)
		acountHolderName = try values.decodeIfPresent(String.self, forKey: .acountHolderName)
		bankName = try values.decodeIfPresent(String.self, forKey: .bankName)
		bankBranch = try values.decodeIfPresent(String.self, forKey: .bankBranch)
		ifscCode = try values.decodeIfPresent(String.self, forKey: .ifscCode)
		districtId = try values.decodeIfPresent(Int.self, forKey: .districtId)
		talukName = try values.decodeIfPresent(String.self, forKey: .talukName)
		districtName = try values.decodeIfPresent(String.self, forKey: .districtName)
		talukId = try values.decodeIfPresent(Int.self, forKey: .talukId)
		locationName = try values.decodeIfPresent(String.self, forKey: .locationName)
		walletNumber = try values.decodeIfPresent(String.self, forKey: .walletNumber)
		bankAccountVerifiedStatus = try values.decodeIfPresent(Int.self, forKey: .bankAccountVerifiedStatus)
		referedBy = try values.decodeIfPresent(String.self, forKey: .referedBy)
		customerCategoryId = try values.decodeIfPresent(Int.self, forKey: .customerCategoryId)
		nominee = try values.decodeIfPresent(String.self, forKey: .nominee)
		nativeStateName = try values.decodeIfPresent(String.self, forKey: .nativeStateName)
		customerDetailId = try values.decodeIfPresent(Int.self, forKey: .customerDetailId)
		lIdentificationType = try values.decodeIfPresent(Int.self, forKey: .lIdentificationType)
		identificationOthers = try values.decodeIfPresent(String.self, forKey: .identificationOthers)
		identificationNo = try values.decodeIfPresent(String.self, forKey: .identificationNo)
		professionId = try values.decodeIfPresent(Int.self, forKey: .professionId)
		ageGroupId = try values.decodeIfPresent(Int.self, forKey: .ageGroupId)
		anniversary = try values.decodeIfPresent(String.self, forKey: .anniversary)
		incomeRangeId = try values.decodeIfPresent(Int.self, forKey: .incomeRangeId)
		maritalStatus = try values.decodeIfPresent(String.self, forKey: .maritalStatus)
		profilePicture = try values.decodeIfPresent(String.self, forKey: .profilePicture)
		emailStatus = try values.decodeIfPresent(Int.self, forKey: .emailStatus)
		locality = try values.decodeIfPresent(String.self, forKey: .locality)
		executiveName = try values.decodeIfPresent(String.self, forKey: .executiveName)
		gender = try values.decodeIfPresent(String.self, forKey: .gender)
		customerRemarks = try values.decodeIfPresent(String.self, forKey: .customerRemarks)
		languageId = try values.decodeIfPresent(Int.self, forKey: .languageId)
		religionID = try values.decodeIfPresent(Int.self, forKey: .religionID)
		isSmartphoneUser = try values.decodeIfPresent(Bool.self, forKey: .isSmartphoneUser)
		isWhatsappUser = try values.decodeIfPresent(Bool.self, forKey: .isWhatsappUser)
		languageName = try values.decodeIfPresent(String.self, forKey: .languageName)
		nomineeDOB = try values.decodeIfPresent(String.self, forKey: .nomineeDOB)
		customerRelationshipId = try values.decodeIfPresent(Int.self, forKey: .customerRelationshipId)
		locationCode = try values.decodeIfPresent(String.self, forKey: .locationCode)
		custFamilyId = try values.decodeIfPresent(Int.self, forKey: .custFamilyId)
		familyMemberName = try values.decodeIfPresent(String.self, forKey: .familyMemberName)
		familyMemberBirthday = try values.decodeIfPresent(String.self, forKey: .familyMemberBirthday)
		relationship = try values.decodeIfPresent(String.self, forKey: .relationship)
		vehicleBrand = try values.decodeIfPresent(String.self, forKey: .vehicleBrand)
		whatsAppNumber = try values.decodeIfPresent(String.self, forKey: .whatsAppNumber)
		userId = try values.decodeIfPresent(Int.self, forKey: .userId)
		bankCountryId = try values.decodeIfPresent(Int.self, forKey: .bankCountryId)
		bankCountryName = try values.decodeIfPresent(String.self, forKey: .bankCountryName)
		currency = try values.decodeIfPresent(String.self, forKey: .currency)
		bankAddress = try values.decodeIfPresent(String.self, forKey: .bankAddress)
		ibanNumber = try values.decodeIfPresent(String.self, forKey: .ibanNumber)
		bicSwiftCode = try values.decodeIfPresent(String.self, forKey: .bicSwiftCode)
		bsbAbaRoutingNumber = try values.decodeIfPresent(String.self, forKey: .bsbAbaRoutingNumber)
		currencyId = try values.decodeIfPresent(Int.self, forKey: .currencyId)
		accountStatus = try values.decodeIfPresent(String.self, forKey: .accountStatus)
		contractName = try values.decodeIfPresent(String.self, forKey: .contractName)
		contractId = try values.decodeIfPresent(Int.self, forKey: .contractId)
		contractFileName = try values.decodeIfPresent(String.self, forKey: .contractFileName)
		remarks = try values.decodeIfPresent(String.self, forKey: .remarks)
		accountComStatus = try values.decodeIfPresent(Int.self, forKey: .accountComStatus)
		isActive = try values.decodeIfPresent(Int.self, forKey: .isActive)
		accountTypeID = try values.decodeIfPresent(Int.self, forKey: .accountTypeID)
		accountType = try values.decodeIfPresent(String.self, forKey: .accountType)
		customerGrade = try values.decodeIfPresent(String.self, forKey: .customerGrade)
		tradeLicence = try values.decodeIfPresent(String.self, forKey: .tradeLicence)
		password = try values.decodeIfPresent(String.self, forKey: .password)
		vehicleType = try values.decodeIfPresent(String.self, forKey: .vehicleType)
		engineNumber = try values.decodeIfPresent(String.self, forKey: .engineNumber)
		invoiceNo = try values.decodeIfPresent(String.self, forKey: .invoiceNo)
		invoiceAmount = try values.decodeIfPresent(String.self, forKey: .invoiceAmount)
		customerTypeId = try values.decodeIfPresent(Int.self, forKey: .customerTypeId)
		relateD_PROJECT_TYPE = try values.decodeIfPresent(String.self, forKey: .relateD_PROJECT_TYPE)
		jDateOfSale = try values.decodeIfPresent(String.self, forKey: .jDateOfSale)
		isVinChassis_Active = try values.decodeIfPresent(String.self, forKey: .isVinChassis_Active)
		isUpdatePassword = try values.decodeIfPresent(Bool.self, forKey: .isUpdatePassword)
		addressLatitude = try values.decodeIfPresent(String.self, forKey: .addressLatitude)
		addressLongitude = try values.decodeIfPresent(String.self, forKey: .addressLongitude)
		plainPassword = try values.decodeIfPresent(String.self, forKey: .plainPassword)
		registrationSource = try values.decodeIfPresent(Int.self, forKey: .registrationSource)
		bankPassbookImage = try values.decodeIfPresent(String.self, forKey: .bankPassbookImage)
		isBankPassbookNewImage = try values.decodeIfPresent(Bool.self, forKey: .isBankPassbookNewImage)
		verifiedStatus = try values.decodeIfPresent(String.self, forKey: .verifiedStatus)
		loyaltyIdAutoGen = try values.decodeIfPresent(Bool.self, forKey: .loyaltyIdAutoGen)
		company = try values.decodeIfPresent(String.self, forKey: .company)
		areaId = try values.decodeIfPresent(Int.self, forKey: .areaId)
		referralCode = try values.decodeIfPresent(String.self, forKey: .referralCode)
		parentCustomerId = try values.decodeIfPresent(Int.self, forKey: .parentCustomerId)
		payOut = try values.decodeIfPresent(Int.self, forKey: .payOut)
		taxId = try values.decodeIfPresent(String.self, forKey: .taxId)
		recipientPhonenumber = try values.decodeIfPresent(String.self, forKey: .recipientPhonenumber)
		bankCity = try values.decodeIfPresent(String.self, forKey: .bankCity)
		autoAccountType = try values.decodeIfPresent(String.self, forKey: .autoAccountType)
		recipientType = try values.decodeIfPresent(String.self, forKey: .recipientType)
		autoBankCounty = try values.decodeIfPresent(String.self, forKey: .autoBankCounty)
		autoBankPostCode = try values.decodeIfPresent(String.self, forKey: .autoBankPostCode)
		bankCode = try values.decodeIfPresent(String.self, forKey: .bankCode)
		createdDate = try values.decodeIfPresent(String.self, forKey: .createdDate)
		pointBalance = try values.decodeIfPresent(Double.self, forKey: .pointBalance)
		createdBy = try values.decodeIfPresent(String.self, forKey: .createdBy)
		enrollmentReferenceDate = try values.decodeIfPresent(String.self, forKey: .enrollmentReferenceDate)
		areaName = try values.decodeIfPresent(String.self, forKey: .areaName)
		branchCode = try values.decodeIfPresent(String.self, forKey: .branchCode)
		customerOrderCount = try values.decodeIfPresent(Int.self, forKey: .customerOrderCount)
		departmentId = try values.decodeIfPresent(Int.self, forKey: .departmentId)
		designationId = try values.decodeIfPresent(Int.self, forKey: .designationId)
		referrerCode = try values.decodeIfPresent(String.self, forKey: .referrerCode)
		insuranceExpDate = try values.decodeIfPresent(String.self, forKey: .insuranceExpDate)
		jD_InvoiceDate = try values.decodeIfPresent(String.self, forKey: .jD_InvoiceDate)
		policyDate = try values.decodeIfPresent(String.self, forKey: .policyDate)
		customerCategory = try values.decodeIfPresent(String.self, forKey: .customerCategory)
		walletVerifiedStatus = try values.decodeIfPresent(Bool.self, forKey: .walletVerifiedStatus)
		enrollmentStatus = try values.decodeIfPresent(Bool.self, forKey: .enrollmentStatus)
		dealerUserId = try values.decodeIfPresent(String.self, forKey: .dealerUserId)
		dealerName = try values.decodeIfPresent(String.self, forKey: .dealerName)
		aadharNumber = try values.decodeIfPresent(String.self, forKey: .aadharNumber)
	}

}