//
//  SignIn.swift
//  maggnet
//
//  Created by Deepak on 12/09/22.
//

import SwiftUI

struct SignUp: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var authVM = AuthViewModel()
    @State private var openCountryCodeList: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 20) {
                Text(NSLocalizedString("create account", comment: ""))
                    .foregroundColor(.black)
                    .font(.custom("Avenir", size: 24))
                    .fontWeight(.black)
                
                Image("uiProgress0")
                 
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(NSLocalizedString("mobile", comment: ""))
                    .font(.custom("Avenir", size: 14))

            
            }
            .padding(.top, 30)
            
            HStack {
                Button {
                    openCountryCodeList.toggle()
                } label: {
                    
                    HStack {
                        Text( AppConstants.countryCodeList[authVM.signUpCountryCode]! )
                            .font(.custom("times", size: 20))
                            .foregroundColor(.black)
                        
                        
                    }
                    .padding()
                }
                
                Divider()
                
                TextField(NSLocalizedString("mobile", comment: ""), text: $authVM.signUpPhoneNumber)
                    .font(.custom("Avenir", size: 16))
                    .foregroundColor(.black)
                    .keyboardType(.phonePad)
                    .textContentType(.telephoneNumber)
                    .padding()
            }

            .frame(height: 45)
            .background(AppColors.semiGray)
            .cornerRadius(10)

            
            HStack {
                
                Button {
                    authVM.agreement.toggle()

                } label: {
                    ZStack {
                        Rectangle()
                            .fill(authVM.agreement ? AppColors.semiBlue : AppColors.semiGray)
                            .frame(width: 16, height: 16, alignment: .center)
                            .cornerRadius(5)
                        
                        if authVM.agreement {
                            Image(systemName: "checkmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10, height: 10, alignment: .center)
                                .foregroundColor(.white)
                        }
                    }
                }
                Text(NSLocalizedString("I igree to", comment: ""))
                    .font(.custom("Avenir", size: 12))
                Link(NSLocalizedString("t&c", comment: ""), destination: URL(string: AppConstants.terms_of_use)!)
                    .foregroundColor(.blue)
                    .font(.custom("Avenir", size: 12))
                Text(NSLocalizedString("and", comment: ""))
                    .font(.custom("Avenir", size: 12))
                Link(NSLocalizedString("privacyPolicy", comment: ""), destination: URL(string: AppConstants.privacy_policy)!)
                    .font(.custom("Avenir", size: 12))

                
            }
            .padding(.top,10)
            
            VStack(alignment: .center, spacing: 16) {
                
                NavigationLink( destination: VerifyOTPView(mobileNumber:AppConstants.countryCodeList[authVM.signUpCountryCode]!+authVM.signUpPhoneNumber), label: {
                    Text(NSLocalizedString("signup", comment: ""))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding()
                        .frame(width: 250, height: 54, alignment: .center)
                        .background(Color.black)
                        .cornerRadius(8)
                })
                
                Text(NSLocalizedString("haveAccount", comment: ""))
                    .font(.custom("Avenir", size: 14))
                
                NavigationLink( destination: SignUp(), label: {
                    Text(NSLocalizedString("login", comment: ""))
                        .underline()
                        .foregroundColor(AppColors.semiBlue)
                })
            }
            .padding(.top,20)
            .frame(maxWidth: Double.infinity, alignment: .center)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle(Text(""), displayMode: .inline)
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.black)
        })
        .sheet(isPresented: $openCountryCodeList) {
            CountryCodeSelection(isPresented: $openCountryCodeList, country: $authVM.signUpCountryCode)
        }.gesture(DragGesture().onChanged({ _ in
        }))
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
