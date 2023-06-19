/*
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct LstCustomerCart : Codable {
    let productName : String?
    let customerCartId : Int?
    let productId : Int?
    let skuId : Int?
    let prodCode : String?
    let prodDescription : String?
    let prodAvailabilityStatus : String?
    let prodPrice : Double?
    let rowTotalPrice : Double?
    let quantity : Int?
    let prodImg : String?
    let email : String?
    let rowNo : Int?
    let companyName : String?
    let fullName : String?
    let countryName : String?
    let stateName : String?
    let cityName : String?
    let zip : String?
    let orderId : Int?
    let orderNumber : String?
    let loyaltyId : String?
    let orderDate : String?
    let invoiceDate : String?
    let shippingName : String?
    let paymentStatus : String?
    let orderStatusId : Int?
    let netAmount : Double?
    let mobile : String?
    let address : String?
    let totalRows : Int?
    let productImg : String?
    let completedOrder : Int?
    let pendingOrder : Int?
    let shippedOrder : Int?
    let cancelledOrder : Int?
    let totalTransaction : Double?
    let invoiceNo : String?
    let orderStatus : String?
    let productStockQuantity : Int?
    let prodMiscellaneousCode : String?
    let userID : Int?
    let paymentTranID : String?
    let paymentMode : String?
    let itemType : String?
    let sapCode : String?
    let jEnrolledDate : String?
    let jCartDate : String?
    let discountCriteria : Int?
    let discountValue : Double?
    let promoCodeId : Int?
    let comment : String?
    let landingPrice : Double?
    let landingQuantityPrice : Double?
    let demoCharge : Double?
    let allowDemoCharge : Bool?
    let productGroupInfoId : Int?
    let promoCode : String?
    let firmTypeName : String?
    let gst : Double?
    let landingTotalGST : Double?
    let landingTotalPrice : Double?
    let sumLandingQuantityPrice : Double?
    let landingDiscount : Double?
    let locationName : String?
    let sku : String?
    let gstPercentage : String?
    let finalAmount : Int?
    let orderDetailsId : Int?
    let toPassStatus : Int?
    let statusName : String?
    let skuDesc : String?
    let uom : String?
    let color : String?
    let rate : Int?
    let lsrCartProductDetails : String?
    let categoryName : String?
    let cartIds : String?
    let categoryType : String?
    let partyLoyaltyId : String?
    let partyUserId : Int?
    let categoryId : Int?
    let articleNo : String?
    let nlStatus : String?
    let subCategoryId : Int?
    let brandId : Int?
    let orderSchemeID : Int?
    let orderSchemeName : String?
    let mrp : Double?
    let disPatchQty : Int?

    enum CodingKeys: String, CodingKey {

        case productName = "productName"
        case customerCartId = "customerCartId"
        case productId = "productId"
        case skuId = "skuId"
        case prodCode = "prodCode"
        case prodDescription = "prodDescription"
        case prodAvailabilityStatus = "prodAvailabilityStatus"
        case prodPrice = "prodPrice"
        case rowTotalPrice = "rowTotalPrice"
        case quantity = "quantity"
        case prodImg = "prodImg"
        case email = "email"
        case rowNo = "rowNo"
        case companyName = "companyName"
        case fullName = "fullName"
        case countryName = "countryName"
        case stateName = "stateName"
        case cityName = "cityName"
        case zip = "zip"
        case orderId = "orderId"
        case orderNumber = "orderNumber"
        case loyaltyId = "loyaltyId"
        case orderDate = "orderDate"
        case invoiceDate = "invoiceDate"
        case shippingName = "shippingName"
        case paymentStatus = "paymentStatus"
        case orderStatusId = "orderStatusId"
        case netAmount = "netAmount"
        case mobile = "mobile"
        case address = "address"
        case totalRows = "totalRows"
        case productImg = "productImg"
        case completedOrder = "completedOrder"
        case pendingOrder = "pendingOrder"
        case shippedOrder = "shippedOrder"
        case cancelledOrder = "cancelledOrder"
        case totalTransaction = "totalTransaction"
        case invoiceNo = "invoiceNo"
        case orderStatus = "orderStatus"
        case productStockQuantity = "productStockQuantity"
        case prodMiscellaneousCode = "prodMiscellaneousCode"
        case userID = "userID"
        case paymentTranID = "paymentTranID"
        case paymentMode = "paymentMode"
        case itemType = "itemType"
        case sapCode = "sapCode"
        case jEnrolledDate = "jEnrolledDate"
        case jCartDate = "jCartDate"
        case discountCriteria = "discountCriteria"
        case discountValue = "discountValue"
        case promoCodeId = "promoCodeId"
        case comment = "comment"
        case landingPrice = "landingPrice"
        case landingQuantityPrice = "landingQuantityPrice"
        case demoCharge = "demoCharge"
        case allowDemoCharge = "allowDemoCharge"
        case productGroupInfoId = "productGroupInfoId"
        case promoCode = "promoCode"
        case firmTypeName = "firmTypeName"
        case gst = "gst"
        case landingTotalGST = "landingTotalGST"
        case landingTotalPrice = "landingTotalPrice"
        case sumLandingQuantityPrice = "sumLandingQuantityPrice"
        case landingDiscount = "landingDiscount"
        case locationName = "locationName"
        case sku = "sku"
        case gstPercentage = "gstPercentage"
        case finalAmount = "finalAmount"
        case orderDetailsId = "orderDetailsId"
        case toPassStatus = "toPassStatus"
        case statusName = "statusName"
        case skuDesc = "skuDesc"
        case uom = "uom"
        case color = "color"
        case rate = "rate"
        case lsrCartProductDetails = "lsrCartProductDetails"
        case categoryName = "categoryName"
        case cartIds = "cartIds"
        case categoryType = "categoryType"
        case partyLoyaltyId = "partyLoyaltyId"
        case partyUserId = "partyUserId"
        case categoryId = "categoryId"
        case articleNo = "articleNo"
        case nlStatus = "nlStatus"
        case subCategoryId = "subCategoryId"
        case brandId = "brandId"
        case orderSchemeID = "orderSchemeID"
        case orderSchemeName = "orderSchemeName"
        case mrp = "mrp"
        case disPatchQty = "disPatchQty"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        productName = try values.decodeIfPresent(String.self, forKey: .productName)
        customerCartId = try values.decodeIfPresent(Int.self, forKey: .customerCartId)
        productId = try values.decodeIfPresent(Int.self, forKey: .productId)
        skuId = try values.decodeIfPresent(Int.self, forKey: .skuId)
        prodCode = try values.decodeIfPresent(String.self, forKey: .prodCode)
        prodDescription = try values.decodeIfPresent(String.self, forKey: .prodDescription)
        prodAvailabilityStatus = try values.decodeIfPresent(String.self, forKey: .prodAvailabilityStatus)
        prodPrice = try values.decodeIfPresent(Double.self, forKey: .prodPrice)
        rowTotalPrice = try values.decodeIfPresent(Double.self, forKey: .rowTotalPrice)
        quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
        prodImg = try values.decodeIfPresent(String.self, forKey: .prodImg)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        rowNo = try values.decodeIfPresent(Int.self, forKey: .rowNo)
        companyName = try values.decodeIfPresent(String.self, forKey: .companyName)
        fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
        countryName = try values.decodeIfPresent(String.self, forKey: .countryName)
        stateName = try values.decodeIfPresent(String.self, forKey: .stateName)
        cityName = try values.decodeIfPresent(String.self, forKey: .cityName)
        zip = try values.decodeIfPresent(String.self, forKey: .zip)
        orderId = try values.decodeIfPresent(Int.self, forKey: .orderId)
        orderNumber = try values.decodeIfPresent(String.self, forKey: .orderNumber)
        loyaltyId = try values.decodeIfPresent(String.self, forKey: .loyaltyId)
        orderDate = try values.decodeIfPresent(String.self, forKey: .orderDate)
        invoiceDate = try values.decodeIfPresent(String.self, forKey: .invoiceDate)
        shippingName = try values.decodeIfPresent(String.self, forKey: .shippingName)
        paymentStatus = try values.decodeIfPresent(String.self, forKey: .paymentStatus)
        orderStatusId = try values.decodeIfPresent(Int.self, forKey: .orderStatusId)
        netAmount = try values.decodeIfPresent(Double.self, forKey: .netAmount)
        mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        totalRows = try values.decodeIfPresent(Int.self, forKey: .totalRows)
        productImg = try values.decodeIfPresent(String.self, forKey: .productImg)
        completedOrder = try values.decodeIfPresent(Int.self, forKey: .completedOrder)
        pendingOrder = try values.decodeIfPresent(Int.self, forKey: .pendingOrder)
        shippedOrder = try values.decodeIfPresent(Int.self, forKey: .shippedOrder)
        cancelledOrder = try values.decodeIfPresent(Int.self, forKey: .cancelledOrder)
        totalTransaction = try values.decodeIfPresent(Double.self, forKey: .totalTransaction)
        invoiceNo = try values.decodeIfPresent(String.self, forKey: .invoiceNo)
        orderStatus = try values.decodeIfPresent(String.self, forKey: .orderStatus)
        productStockQuantity = try values.decodeIfPresent(Int.self, forKey: .productStockQuantity)
        prodMiscellaneousCode = try values.decodeIfPresent(String.self, forKey: .prodMiscellaneousCode)
        userID = try values.decodeIfPresent(Int.self, forKey: .userID)
        paymentTranID = try values.decodeIfPresent(String.self, forKey: .paymentTranID)
        paymentMode = try values.decodeIfPresent(String.self, forKey: .paymentMode)
        itemType = try values.decodeIfPresent(String.self, forKey: .itemType)
        sapCode = try values.decodeIfPresent(String.self, forKey: .sapCode)
        jEnrolledDate = try values.decodeIfPresent(String.self, forKey: .jEnrolledDate)
        jCartDate = try values.decodeIfPresent(String.self, forKey: .jCartDate)
        discountCriteria = try values.decodeIfPresent(Int.self, forKey: .discountCriteria)
        discountValue = try values.decodeIfPresent(Double.self, forKey: .discountValue)
        promoCodeId = try values.decodeIfPresent(Int.self, forKey: .promoCodeId)
        comment = try values.decodeIfPresent(String.self, forKey: .comment)
        landingPrice = try values.decodeIfPresent(Double.self, forKey: .landingPrice)
        landingQuantityPrice = try values.decodeIfPresent(Double.self, forKey: .landingQuantityPrice)
        demoCharge = try values.decodeIfPresent(Double.self, forKey: .demoCharge)
        allowDemoCharge = try values.decodeIfPresent(Bool.self, forKey: .allowDemoCharge)
        productGroupInfoId = try values.decodeIfPresent(Int.self, forKey: .productGroupInfoId)
        promoCode = try values.decodeIfPresent(String.self, forKey: .promoCode)
        firmTypeName = try values.decodeIfPresent(String.self, forKey: .firmTypeName)
        gst = try values.decodeIfPresent(Double.self, forKey: .gst)
        landingTotalGST = try values.decodeIfPresent(Double.self, forKey: .landingTotalGST)
        landingTotalPrice = try values.decodeIfPresent(Double.self, forKey: .landingTotalPrice)
        sumLandingQuantityPrice = try values.decodeIfPresent(Double.self, forKey: .sumLandingQuantityPrice)
        landingDiscount = try values.decodeIfPresent(Double.self, forKey: .landingDiscount)
        locationName = try values.decodeIfPresent(String.self, forKey: .locationName)
        sku = try values.decodeIfPresent(String.self, forKey: .sku)
        gstPercentage = try values.decodeIfPresent(String.self, forKey: .gstPercentage)
        finalAmount = try values.decodeIfPresent(Int.self, forKey: .finalAmount)
        orderDetailsId = try values.decodeIfPresent(Int.self, forKey: .orderDetailsId)
        toPassStatus = try values.decodeIfPresent(Int.self, forKey: .toPassStatus)
        statusName = try values.decodeIfPresent(String.self, forKey: .statusName)
        skuDesc = try values.decodeIfPresent(String.self, forKey: .skuDesc)
        uom = try values.decodeIfPresent(String.self, forKey: .uom)
        color = try values.decodeIfPresent(String.self, forKey: .color)
        rate = try values.decodeIfPresent(Int.self, forKey: .rate)
        lsrCartProductDetails = try values.decodeIfPresent(String.self, forKey: .lsrCartProductDetails)
        categoryName = try values.decodeIfPresent(String.self, forKey: .categoryName)
        cartIds = try values.decodeIfPresent(String.self, forKey: .cartIds)
        categoryType = try values.decodeIfPresent(String.self, forKey: .categoryType)
        partyLoyaltyId = try values.decodeIfPresent(String.self, forKey: .partyLoyaltyId)
        partyUserId = try values.decodeIfPresent(Int.self, forKey: .partyUserId)
        categoryId = try values.decodeIfPresent(Int.self, forKey: .categoryId)
        articleNo = try values.decodeIfPresent(String.self, forKey: .articleNo)
        nlStatus = try values.decodeIfPresent(String.self, forKey: .nlStatus)
        subCategoryId = try values.decodeIfPresent(Int.self, forKey: .subCategoryId)
        brandId = try values.decodeIfPresent(Int.self, forKey: .brandId)
        orderSchemeID = try values.decodeIfPresent(Int.self, forKey: .orderSchemeID)
        orderSchemeName = try values.decodeIfPresent(String.self, forKey: .orderSchemeName)
        mrp = try values.decodeIfPresent(Double.self, forKey: .mrp)
        disPatchQty = try values.decodeIfPresent(Int.self, forKey: .disPatchQty)
    }

}
