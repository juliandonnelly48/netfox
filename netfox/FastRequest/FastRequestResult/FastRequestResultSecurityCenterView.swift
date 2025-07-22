import Foundation
import SwiftUI
import Kingfisher
import ProgressHUD

struct FastRequestResultSecurityCenterView: View {
    @Binding var isSubscriptionActive: Bool
    @Binding var isRealTimeAntivirusOn: Bool
    @Binding var isSecurityOn: Bool
    @Binding var isBackgroundScanOn: Bool
    @Binding var isPasswordsOn: Bool
    
    @Binding var showStatistics: Bool
    
    let completion: ((EventsTitles?) -> Void)?
    let model: AuthorizationOfferModel?
    let tariffButtonTapped: ((Bool) -> Void)
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 5) {
                HStack {
                    ZStack {
                        Rectangle()
                            .fill(.white)
                            .cornerRadius(5)
                            .frame(width: 60, height: 60)
                        
                        KFImage(URL(string: model?.scn?.banner_icon ?? ""))
                            .setProcessor(SVGImgProcessor())
                            .resizable()
                            .frame(width: 46, height: 59)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(model?.scn?.banner_title ?? "")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.leading)
                        
                        Text(model?.scn?.banner_subtitle ?? "")
                            .font(.system(size: 12, weight: .medium, design: .default))
                            .foregroundStyle(Color(red: 156/255, green: 156/255, blue: 156/255))
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                    }
                    .padding(.leading, 7)
                    
                    Spacer()
                }
                .padding(.all, 5)
                .background(Color(red: 250/255, green: 250/255, blue: 250/255))
                .cornerRadius(10)
                
                VStack {
                    //                HStack(spacing: 5) {
                    FastRequestResultToggleView(title: model?.scn?.features?[0].name ?? "",
                                                activeTitle: model?.scn?.features?[0].g_status ?? "",
                                                disactiveTitle: model?.scn?.features?[0].b_status ?? "",
                                                backColor: .white,
                                                isToggleActive: $isRealTimeAntivirusOn)
//                    .toggleStyle(SymbolToggleStyle())
                    .disabled(!isSubscriptionActive)
                    .onTapGesture {
                        if !isSubscriptionActive {
                            completion?(.specialOffer5T0)
                            tariffButtonTapped(true)
                        }
                    }
                    
                    FastRequestResultToggleView(title: model?.scn?.features?[1].name ?? "",
                                                activeTitle: model?.scn?.features?[1].g_status ?? "",
                                                disactiveTitle: model?.scn?.features?[1].b_status ?? "",
                                                backColor: .white,
                                                isToggleActive: $isSecurityOn)
                    .disabled(!isSubscriptionActive)
                    .onTapGesture {
                        if !isSubscriptionActive {
                            tariffButtonTapped(true)
                        }
                    }
                    .onChange(of: isRealTimeAntivirusOn) { value in
                        completion?(.specialOffer5T1)
                        
                        if isSubscriptionActive, value {
                            let generator = UINotificationFeedbackGenerator()
                            
                            generator.notificationOccurred(.success)
                        } else {
//                            isSheetAnti = false
                        }
                    }
                    //                }
                    
                    //                HStack(spacing: 5) {
                    FastRequestResultToggleView(title: model?.scn?.features?[2].name ?? "",
                                                activeTitle: model?.scn?.features?[2].g_status ?? "",
                                                disactiveTitle: model?.scn?.features?[2].b_status ?? "",
                                                backColor: .white,
                                                isToggleActive: $isBackgroundScanOn)
                    .disabled(!isSubscriptionActive)
                    .onTapGesture {
                        if !isSubscriptionActive {
                            tariffButtonTapped(true)
                        }
                    }
                    .onChange(of: isBackgroundScanOn) { value in
                        completion?(.specialOffer5T2)
                        
                        if isSubscriptionActive, value {
                            let generator = UINotificationFeedbackGenerator()
                            
                            generator.notificationOccurred(.success)
                        }
                    }
                    
                    FastRequestResultToggleView(title: model?.scn?.features?[3].name ?? "",
                                                activeTitle: model?.scn?.features?[3].g_status ?? "",
                                                disactiveTitle: model?.scn?.features?[3].b_status ?? "",
                                                backColor: .white,
                                                isToggleActive: $isPasswordsOn)
                    .disabled(!isSubscriptionActive)
                    .onTapGesture {
                        if !isSubscriptionActive {
                            tariffButtonTapped(true)
                        }
                    }
                    .onChange(of: isSecurityOn) { value in
                        completion?(.specialOffer5T3)
                        
                        if isSubscriptionActive, value {
                            let generator = UINotificationFeedbackGenerator()
                            
                            generator.notificationOccurred(.success)
                        }
                    }
                    //                }
                    
                    //                HStack(spacing: 5) {
//                    FastRequestResultToggleView(title: model?.scn?.features?[4].name ?? "",
//                                                activeTitle: model?.scn?.features?[4].g_status ?? "",
//                                                disactiveTitle: model?.scn?.features?[4].b_status ?? "",
//                                                backColor: .white,
//                                                isToggleActive: $isPasswordsOn)
//                    .disabled(!isSubscriptionActive)
//                    .onTapGesture {
//                        if !isSubscriptionActive {
//                            tariffButtonTapped(true)
//                        }
//                    }
//                    .onChange(of: isPasswordsOn) { value in
//                        completion?(.specialOffer5T4)
//                        
//                        if isSubscriptionActive, value {
//                            let generator = UINotificationFeedbackGenerator()
//                            
//                            generator.notificationOccurred(.success)
//                        }
//                    }
//                    
//                    FastRequestResultToggleView(title: model?.scn?.features?[5].name ?? "",
//                                                activeTitle: model?.scn?.features?[5].g_status ?? "",
//                                                disactiveTitle: model?.scn?.features?[5].b_status ?? "",
//                                                backColor: .white,
//                                                isToggleActive: $isCacheOn)
//                    .disabled(!isSubscriptionActive)
//                    .onTapGesture {
//                        if !isSubscriptionActive {
//                            tariffButtonTapped(true)
//                        }
//                    }
//                    .onChange(of: isCacheOn) { value in
//                        completion?(.specialOffer5T5)
//                        
//                        if isSubscriptionActive, value {
//                            let generator = UINotificationFeedbackGenerator()
//                            
//                            generator.notificationOccurred(.success)
////                            showProgressAction()
////                            
////                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
////                                self.showSuccessAction()
////                            }
//                        }
//                    }
                    //                }
                }
            }
            .padding(.all, 5)
            .background(Color(red: 239/255, green: 239/255, blue: 239/255))
            .cornerRadius(15)
            
            FastRequestResultBoxStatsView(title: model?.scn?.stats?.statBtnTitle ?? "",
                                          subttitle: model?.scn?.stats?.statBtnSubtitle ?? "",
                                          imageUrl: model?.scn?.banner_icon ?? "", //!
                                          backColor: Color(red: 239/255, green: 239/255, blue: 239/255))
            .onTapGesture {
                showStatistics = true
            }
        }
    }
    
    private func showProgressAction() {
        ProgressHUD.animate(interaction: false)
    }
    
    private func showSuccessAction() {
        ProgressHUD.success(interaction: false)
    }
}
