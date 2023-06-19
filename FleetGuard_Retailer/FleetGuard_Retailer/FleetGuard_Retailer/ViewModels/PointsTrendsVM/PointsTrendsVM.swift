//
//  PointsTrendsVM.swift
//  Fleet_Guard(Samriddhi)
//
//  Created by Arokia-M3 on 06/03/23.
//

import UIKit

class PointsTrendsVM {
    
    weak var VC: FG_PointsTrendGraphVC?
    var requestAPIs = RestAPI_Requests()
    var myPointsTrendGraphArray = [LstRetailerBonding3]()
    var loyaltyId = UserDefaults.standard.string(forKey: "LoyaltyId") ?? ""
    var myPointsDataArray = [LstRetailerBonding3]()
    var myPointsArrayOfData = [pointsTradegraph]()
    
//    func pointsTrendsAPI(parameters:JSON){
//        DispatchQueue.main.async {
//            self.VC?.startLoading()
//        }
//        self.requestAPIs.pointsTrendGraphAPI(parameters: parameters) { (result, error) in
//            if error == nil{
//                if result != nil{
//                    DispatchQueue.main.async {
//                        self.VC?.stopLoading()
//                        self.myPointsTrendGraphArray = result?.lstRetailerBonding ?? []
//                        print(self.myPointsTrendGraphArray.count, "myBillingsListingArrayCount")
//                        self.VC?.myPointsArrayOfD.removeAll()
//                        self.VC?.firstGraphData.removeAll()
//                        if self.myPointsTrendGraphArray.count != 0 {
//                            for data in self.myPointsTrendGraphArray{
//                                let previousYearPoint = data.previousYearPoint
//                                let currentYear = data.currentYearPoint
//
//                                self.VC?.myPointsArrayOfD.append(pointsTradegraph(monthName: data.monthName, previousYearPoint: "\(Int(data.previousYearPoint ?? 0))", currentYearPoint: "\(data.currentYearPoint ?? 0)"))
//
//                                self.VC?.firstGraphData.append(data.currentYearPoint!)
//                                self.VC?.secondGraphData.append(data.previousYearPoint!)
//                                self.VC?.monthsData.append(data.monthName!)
//
//
//                                let saveData = GraphData(context: persistanceservice.context)
//                                saveData.monthName = data.monthName
//                                saveData.previousYearPoint = "\(data.previousYearPoint ?? 0)"
//                                saveData.currentYearPoint = "\(data.currentYearPoint ?? 0)"
//                                print(self.VC?.firstGraphData,"skduhd")
//                                print(saveData.previousYearPoint)
//                                print(saveData.currentYearPoint)
//                                persistanceservice.saveContext()
//                                self.VC?.fetchGraphDetails()
//
//
//                                //self.VC?.setDataCount(monthName: ["\(data.monthName ?? "")"], count: Int(data.currentYearPoint ?? 0), range:UInt32(data.previousYearPoint ?? 0))
//                            }
//                        }
//                    }
//                }else{
//                    DispatchQueue.main.async {
//                        self.VC?.stopLoading()
//                        print("\(error)")
//                    }
//                }
//            }else{
//                DispatchQueue.main.async {
//                    self.VC?.stopLoading()
//                    print("\(error)")
//                }
//            }
//        }
//    }
    
    func pointsTrendsAPI(parameters: JSON, completion: @escaping (PointsTrendModels?) -> ()) {
        DispatchQueue.main.async {
            self.VC?.startLoading()
        }
        self.requestAPIs.pointsTrendGraphAPI(parameters: parameters) { (result, error) in
            if error == nil {
                if result != nil {
                    DispatchQueue.main.async {
                        completion(result)
                        self.VC?.stopLoading()
                    }
                } else {
                    print("No Response")
                    DispatchQueue.main.async {
                        self.VC?.stopLoading()
                    }
                }
            }else{
                print("ERROR_Login \(error)")
                DispatchQueue.main.async {
                    self.VC?.stopLoading()
                }
                
            }
            
        }
    }
    
}
