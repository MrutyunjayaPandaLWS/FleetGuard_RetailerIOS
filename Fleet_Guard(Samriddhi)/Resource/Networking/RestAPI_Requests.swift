//
//  RestAPI_Requests.swift
//  Millers_Customer_App
//
//  Created by ArokiaIT on 10/30/20.
//

import UIKit

typealias JSON = [String: Any]

class RestAPI_Requests {
    private let client = WebClient(baseUrl: baseURl)
    private let clientSE = WebClient1(baseUrl: baseURL_SE)
    private let clientEarn = WebClient2(myEarningsBaseURL: myEarningsBaseURL)
    
    func otp_Post_API(parameters: JSON, completion: @escaping (OTPModel?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: getOTP_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(OTPModel?.self, from: data as! Data)
                    //print(result1)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    func loginApi(parameters: JSON, completion: @escaping (LoginModel?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: login_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(LoginModel?.self, from: data as! Data)
                    //print(result1)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    func dashboardApi(parameters: JSON, completion: @escaping (DashBoardModel?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: dashboard_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(DashBoardModel?.self, from: data as! Data)
                    //print(result1)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    
    func dashboardTotalPointsApi(parameters: JSON, completion: @escaping (DashboardTotalPointsModel?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: dashboardTotalPts_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(DashboardTotalPointsModel?.self, from: data as! Data)
                    //print(result1)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    func productListingApi(parameters: JSON, completion: @escaping (ProductListingModel?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: productList_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(ProductListingModel?.self, from: data as! Data)
                    //print(result1)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    func addToCartAPi(parameters: JSON, completion: @escaping (AddToCartModel?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: addToCart_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(AddToCartModel?.self, from: data as! Data)
                    //print(result1)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    
    
    func myCartListApi(parameters: JSON, completion: @escaping (MyCartModel?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: myCartList_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(MyCartModel?.self, from: data as! Data)
                    //print(result1)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    func productQuantityUpdateApi(parameters: JSON, completion: @escaping (ProductQuantityUpdateModel?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: updateCart_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(ProductQuantityUpdateModel?.self, from: data as! Data)
                    //print(result1)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    func productRemoveInCartApi(parameters: JSON, completion: @escaping (RemoveProductModel?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: updateCart_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(RemoveProductModel?.self, from: data as! Data)
                    //print(result1)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    func productPlaceOrderApi(parameters: JSON, completion: @escaping (PlaceOrderModel?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: placeOrder_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(PlaceOrderModel?.self, from: data as! Data)
                    //print(result1)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    func productsCategoryListApi(parameters: JSON, completion: @escaping (ProductCataloguesCategoryModel?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: preferredLanguage_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(ProductCataloguesCategoryModel?.self, from: data as! Data)
                    //print(result1)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    func redemptionCatalogueListApi(parameters: JSON, completion: @escaping (RedemptionCatalogueListModel?, Error?) -> ()) -> URLSessionDataTask? {
        return clientSE.load(path: redemptionCatalogue_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(RedemptionCatalogueListModel?.self, from: data as! Data)
                    //print(result1)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    func redemptionCatalogueMycartListApi(parameters: JSON, completion: @escaping (RedemptionCatalogueMyCartListModel?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: redemptionCatalogueMyCart_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(RedemptionCatalogueMyCartListModel?.self, from: data as! Data)
                    print(result1)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    //redemptionCatalogueAddToCart_URLMethod

    
    func redemptionCatalogueAddToCartApi(parameters: JSON, completion: @escaping (RedemptionCatalogueAddToCartModel?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: redemptionCatalogueAddToCart_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(RedemptionCatalogueAddToCartModel?.self, from: data as! Data)
                    //print(result1)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    func redemptionCatalogueCartRemoveApi(parameters: JSON, completion: @escaping (RedemptionCatalogueProductRemoveModel?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: catalogueUpdate_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(RedemptionCatalogueProductRemoveModel?.self, from: data as! Data)
                    //print(result1)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    func redemptionCatalogueCartUpdateApi(parameters: JSON, completion: @escaping (RedemptionCatalogueCartUpdateModel?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: catalogueUpdate_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(RedemptionCatalogueCartUpdateModel?.self, from: data as! Data)
                    //print(result1)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    func myProfileDetailsApi(parameters: JSON, completion: @escaping (MyProfileModel?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: myProfile_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(MyProfileModel?.self, from: data as! Data)
                    //print(result1)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    
    func getStateListApi(parameters: JSON, completion: @escaping (StateListModel?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: getStateList_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(StateListModel?.self, from: data as! Data)
                    //print(result1)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    func getCityListApi(parameters: JSON, completion: @escaping (CityListModel?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: getCityList_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(CityListModel?.self, from: data as! Data)
                    //print(result1)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    //PromotionListingModels
    func promotionsListingAPI(parameters: JSON, completion: @escaping (PromotionListingModels?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: offersandPromotions_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(PromotionListingModels?.self, from: data as! Data)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    
    func promotionsDetailsAPI(parameters: JSON, completion: @escaping (PromotionsModels?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: getCustomerPromotionDetailsByPromotionID, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(PromotionsModels?.self, from: data as! Data)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    
    
    func mileStoneRedemptionAPI(parameters: JSON, completion: @escaping (MileStoneModels?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: GetCustomerMileStoneRedemption, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(MileStoneModels?.self, from: data as! Data)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    func billingsListingAPI(parameters: JSON, completion: @escaping (BillingModels?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: billling_URLMethode, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(BillingModels?.self, from: data as! Data)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    func myOrderListingAPI(parameters: JSON, completion: @escaping (MyOrderModels?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: getOrderDetails_URLMethode, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(MyOrderModels?.self, from: data as! Data)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    func myOrderDetailsListingAPI(parameters: JSON, completion: @escaping (MyOrderDetailsModels?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: myOrderDtails_URLMethode, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(MyOrderDetailsModels?.self, from: data as! Data)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    func filterProductCatAPI(parameters: JSON, completion: @escaping (FilterProductCatModels?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: filterProdtCat_URLMethode, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(FilterProductCatModels?.self, from: data as! Data)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    
    //Help Topic
    func getHelpTopicList(parameters: JSON, completion: @escaping (HelpTopicModels?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: helpTopic_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(HelpTopicModels.self, from: data as! Data)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    //New Query Submission
    
    func newQuerySubmission(parameters: JSON, completion: @escaping (SubmitNewQueryModels?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: chatSubmission_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(SubmitNewQueryModels.self, from: data as! Data)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    //Query Listing
    func queryListApi(parameters: JSON, completion: @escaping (QueryListingModels?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: queryList_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(QueryListingModels.self, from: data as! Data)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    // CHAT DETAILS LISTING
    
    func chatDetailsApi(parameters: JSON, completion: @escaping (ChatDetailsModels?, Error?) -> ()) -> URLSessionDataTask? {
       return client.load(path: chatDetails_URLMethod, method: .post, params: parameters) { data, error in
           do{
               if data != nil{
                   let result1 =  try JSONDecoder().decode(ChatDetailsModels?.self, from: data as! Data)
                   completion(result1, nil)
               }
           }catch{
               completion(nil, error)
           }
       }
   }
    //NEW CHAT SUBMISSION
    
    func newChatSubmissio(parameters: JSON, completion: @escaping (NewChatSubmission?, Error?) -> ()) -> URLSessionDataTask? {
       return client.load(path: chatSubmission_URLMethod, method: .post, params: parameters) { data, error in
           do{
               if data != nil{
                   let result1 =  try JSONDecoder().decode(NewChatSubmission?.self, from: data as! Data)
                   completion(result1, nil)
               }
           }catch{
               completion(nil, error)
           }
       }
    }
    
    //Didnt Completed this API
    func myBillingDetailsListingAPI(parameters: JSON, completion: @escaping (MyOrderDetailsModels?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: myOrderDtails_URLMethode, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(MyOrderDetailsModels?.self, from: data as! Data)
                    completion(result1, nil)
                }
            }catch{
                completion(nil, error)
            }
        }
    }
    
    
    //MY PROFILE DETAILS
    
    func myProfile(parameters: JSON, completion: @escaping (ProfileDetailsModels?, Error?) -> ()) -> URLSessionDataTask? {
            return client.load(path: myProfile_URLMethod, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(ProfileDetailsModels?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                }catch{
                    completion(nil, error)
                }
            }
        }
    
    
    
    func editProfileDetailsAPI(parameters: JSON, completion: @escaping (EditProfileModels?, Error?) -> ()) -> URLSessionDataTask? {
            return client.load(path: saveCustomerDetails_URLMethodes, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(EditProfileModels?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                }catch{
                    completion(nil, error)
                }
            }
        }
    
    
    
    // MARK : - MY REDEMPTION LISTING
    func redemptionListing_Post_API(parameters: JSON, completion: @escaping (MyRedemptionModels?, Error?) -> ()) -> URLSessionDataTask? {
            return client.load(path: myRedemptionList_URLMethod, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(MyRedemptionModels?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                }catch{
                    completion(nil, error)
                }
            }
        }
    
    
    func pointBalenceAPI(parameters: JSON, completion: @escaping (PointBalenceModels?, Error?) -> ()) -> URLSessionDataTask? {
            return clientEarn.load(path: dashboardTotalPts_URLMethod, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(PointBalenceModels?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                }catch{
                    completion(nil, error)
                }
            }
        }
    
    
    func myEarningAPI(parameters: JSON, completion: @escaping (MyEarningModels?, Error?) -> ()) -> URLSessionDataTask? {
        print(clientEarn)
            return clientEarn.load(path: dashboardTotalPts_URLMethod, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(MyEarningModels?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                    print(data,"dlskjhd")
                    
                }catch{
                    completion(nil, error)
                }
            }
        }
    
    
    // Redemption OTP
    
    func redemptionOTP(parameters: JSON, completion: @escaping (RedemptionOTPModels?, Error?) -> ()) -> URLSessionDataTask? {
            return client.load(path: getOTP_URLMethod, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(RedemptionOTPModels?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                }catch{
                    completion(nil, error)
                }
            }
        }
    
    
    //SEND SMS
    
    func sendSMSApi(parameters: JSON, completion: @escaping (SendSMSModel?, Error?) -> ()) -> URLSessionDataTask? {
            return client.load(path: sendSMS_URL, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(SendSMSModel?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                }catch{
                    completion(nil, error)
                }
            }
        }
    
    
    
    // USER ISACTIVE
    func userIsActive(parameters: JSON, completion: @escaping (UserStatusModels?, Error?) -> ()) -> URLSessionDataTask? {
            return client.load(path: userStatus_URLMethod, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(UserStatusModels?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                }catch{
                    completion(nil, error)
                }
            }
        }
    
    // REDEMPTION SUBMISSION
    
    func redemptionSubmission(parameters: JSON, completion: @escaping (RedemptionSubmission?, Error?) -> ()) -> URLSessionDataTask? {
            return client.load(path: redemptionSubmission_URLMethod, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(RedemptionSubmission?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                }catch{
                    completion(nil, error)
                }
            }
        }
    
    
    //SEND SUCCESS MESSAGE
    
    func sendSuccessMessage(parameters: JSON, completion: @escaping (SendSuccessModels?, Error?) -> ()) -> URLSessionDataTask? {
            return client.load(path: sendSuccessURL, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(SendSuccessModels?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                }catch{
                    completion(nil, error)
                }
            }
        }
    //REMOVE DREAM GIFT
    func removeDreamGifts(parameters: JSON, completion: @escaping (RemoveGiftModels?, Error?) -> ()) -> URLSessionDataTask? {
            return client.load(path: removeDreamGift_URLMethod, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(RemoveGiftModels?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                }catch{
                    completion(nil, error)
                }
            }
        }
    
    //RLPStatemnet ACT 3
    func rlpStatementAPI(parameters: JSON, completion: @escaping (RlpStatementModels?, Error?) -> ()) -> URLSessionDataTask? {
            return client.load(path: rlpStatemnet_URLMethodes, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(RlpStatementModels?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                }catch{
                    completion(nil, error)
                }
            }
        }
    //RLPStatemnet ACT 4
    func rplStatmentViewAPI(parameters: JSON, completion: @escaping (RPLStatementViewModels?, Error?) -> ()) -> URLSessionDataTask? {
            return client.load(path: rlpStatemnet_URLMethodes, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(RPLStatementViewModels?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                }catch{
                    completion(nil, error)
                }
            }
        }
    
    
    //REDEMPTION CATEGORY LISTING
    func redemptionCateogryListing(parameters: JSON, completion: @escaping (RedemptionCategoryModels?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: productCategory_URLMethod, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(RedemptionCategoryModels?.self, from: data as! Data)
                    completion(result1, nil)
                }
                print(data)
            }catch{
                completion(nil, error)
            }
        }
    }
        
    
    //MileStonesRedemptionListijng
    func milestonesRedemptionListAPI(parameters: JSON, completion: @escaping (MileStonesRedemptionListModels?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: GetCustomerMileStoneRedemption, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(MileStonesRedemptionListModels?.self, from: data as! Data)
                    completion(result1, nil)
                }
                print(data)
            }catch{
                completion(nil, error)
            }
        }
    }
    //redeemDataAPI
    func redeemDataAPI(parameters: JSON, completion: @escaping (MileStonesRedeemBTNModels?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: GetCustomerMileStoneRedemption, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(MileStonesRedeemBTNModels?.self, from: data as! Data)
                    completion(result1, nil)
                }
                print(data)
            }catch{
                completion(nil, error)
            }
        }
    }
    func registrationDataAPI(parameters: JSON, completion: @escaping (RegistrationModels?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: customerTicketRegister_URLMethodes, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(RegistrationModels?.self, from: data as! Data)
                    completion(result1, nil)
                }
                print(data)
            }catch{
                completion(nil, error)
            }
        }
    }
    
    
    // MARK : - DASHBOARDN BANNER IMAGES
    func dashboardBanner_API(parameters: JSON, completion: @escaping (DashboardBannerImageModels?, Error?) -> ()) -> URLSessionDataTask? {
        return client.load(path: bindLandingImageList_URLMethodes, method: .post, params: parameters) { data, error in
            do{
                if data != nil{
                    let result1 =  try JSONDecoder().decode(DashboardBannerImageModels?.self, from: data as! Data)
                    completion(result1, nil)
                }
             
            }catch{
                completion(nil, error)
            }
        }
    }
    
    //ImageSavingAPI
    func imageSavingAPI(parameters: JSON, completion: @escaping (SideMenuModelClass?, Error?) -> ()) -> URLSessionDataTask? {
            return client.load(path: UpdateCustomerProfileMobileApp, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(SideMenuModelClass?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                }catch{
                    completion(nil, error)
                }
            }
        }
    
    //PointsTrendGrqaph
    func pointsTrendGraphAPI(parameters: JSON, completion: @escaping (PointsTrendModels?, Error?) -> ()) -> URLSessionDataTask? {
            return client.load(path: getRetailerBondingDetails_URLMethode, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(PointsTrendModels?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                }catch{
                    completion(nil, error)
                }
            }
        }
    
    //RangeTrendGrqaph
    func rangeTrendGraphAPI(parameters: JSON, completion: @escaping (RangeTrendsGraphModels?, Error?) -> ()) -> URLSessionDataTask? {
            return client.load(path: getRetailerBondingDetails_URLMethode, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(RangeTrendsGraphModels?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                }catch{
                    completion(nil, error)
                }
            }
        }
    
    //BonusTrendGrqaph
    func bonusTrendGraphAPI(parameters: JSON, completion: @escaping (BonusTrandGraphModels?, Error?) -> ()) -> URLSessionDataTask? {
            return client.load(path: getRetailerBondingDetails_URLMethode, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(BonusTrandGraphModels?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                }catch{
                    completion(nil, error)
                }
            }
        }
    
    
    
    //BillingDetailsImp
    func BillingDetailsImpAPI(parameters: JSON, completion: @escaping (BillingDetialsDataModels?, Error?) -> ()) -> URLSessionDataTask? {
            return client.load(path: billling_URLMethode, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(BillingDetialsDataModels?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                }catch{
                    completion(nil, error)
                }
            }
        }
    
    
    //CounterGap
    func counterGapAPI(parameters: JSON, completion: @escaping (CounterGapModels?, Error?) -> ()) -> URLSessionDataTask? {
            return client.load(path: counterGap_URLMethode, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(CounterGapModels?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                }catch{
                    completion(nil, error)
                }
            }
        }
    
    
    //MarketGap
    func marketGapAPI(parameters: JSON, completion: @escaping (MarketGapModels?, Error?) -> ()) -> URLSessionDataTask? {
            return client.load(path: counterGap_URLMethode, method: .post, params: parameters) { data, error in
                do{
                    if data != nil{
                        let result1 =  try JSONDecoder().decode(MarketGapModels?.self, from: data as! Data)
                        completion(result1, nil)
                    }
                }catch{
                    completion(nil, error)
                }
            }
        }
    
    
    // NOTIFICATION LISTING
    
    func notificationList(parameters: JSON, completion: @escaping (NotificationModels?, Error?) -> ()) -> URLSessionDataTask? {
       return client.load(path: historyNotification, method: .post, params: parameters) { data, error in
           do{
               if data != nil{
                   let result1 =  try JSONDecoder().decode(NotificationModels?.self, from: data as! Data)
                   completion(result1, nil)
               }
           }catch{
               completion(nil, error)
           }
       }
    }
    
//    MARK: - REDEMPTION DETAILS API
    func redemptionDetailsApi(parameters: JSON, completion: @escaping (RedemptionDetailsModels?, Error?) -> ()) -> URLSessionDataTask? {
       return client.load(path: redemptionDetail_URLMethode, method: .post, params: parameters) { data, error in
           do{
               if data != nil{
                   let result1 =  try JSONDecoder().decode(RedemptionDetailsModels?.self, from: data as! Data)
                   completion(result1, nil)
               }
           }catch{
               completion(nil, error)
           }
       }
    }
    
    
//    MARK: - REDEMPTION DETAILS ORDER STATUS LIST
    func redemptionDetailsOrderStatusApi(parameters: JSON, completion: @escaping (RedemptionDetailsOrderStatusModel?, Error?) -> ()) -> URLSessionDataTask? {
       return client.load(path: redemptionDetailsOrderStatus_URLMethode, method: .post, params: parameters) { data, error in
           do{
               if data != nil{
                   let result1 =  try JSONDecoder().decode(RedemptionDetailsOrderStatusModel?.self, from: data as! Data)
                   completion(result1, nil)
               }
           }catch{
               completion(nil, error)
           }
       }
    }
}
