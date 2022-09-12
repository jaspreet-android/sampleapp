//
//  VerifyOTPView.swift
//  maggnet
//
//  Created by faishal on 12/09/22.
//

import SwiftUI

struct VerifyOTPView: View {
    
    var mobileNumber = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var authVM = AuthViewModel()
    @StateObject var viewModel = OTPViewModel()
    @State var isFocused = false
    let textBoxWidth = UIScreen.main.bounds.width / 8
    let textBoxHeight = UIScreen.main.bounds.width / 8
    let spaceBetweenBoxes: CGFloat = 10
    let paddingOfBox: CGFloat = 1
    var textFieldOriginalWidth: CGFloat {
        (textBoxWidth*6)+(spaceBetweenBoxes*3)+((paddingOfBox*2)*3)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Create your account")
                    .font(.custom("Avenir", size: 24))
                    .fontWeight(.black)
                
                Image("uiProgress1")
                   
            }
            .padding(.top,10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("We send the code to your mobile number")
                    .font(.custom("Avenir", size: 18))
                
                Text(mobileNumber)
                    .font(.headline)
                    .font(.custom("Avenir", size: 21))
                    .fontWeight(.black)
                
                HStack {
                    Text("Not your mobile number?")
                        .foregroundColor(.gray)
                        .font(.custom("Avenir", size: 15))
                    
                    Button {
                        
                    } label: {
                        Text("Click Here")
                            .foregroundColor(Color.blue)
                            .font(.custom("Avenir", size: 15))
                            .fontWeight(.black)
                            .underline()
                    }
                }
            }
            .padding(.top, 30)
            
            ZStack {
                HStack (spacing: spaceBetweenBoxes){
                    otpText(text: viewModel.otp1)
                    otpText(text: viewModel.otp2)
                    otpText(text: viewModel.otp3)
                    otpText(text: viewModel.otp4)
                    otpText(text: viewModel.otp5)
                    otpText(text: viewModel.otp6)
                }
                
                TextField("", text: $viewModel.otpField)
                    .frame(width: isFocused ? 0 : textFieldOriginalWidth, height: textBoxHeight)
                    .disabled(viewModel.isTextFieldDisabled)
                    .textContentType(.oneTimeCode)
                    .foregroundColor(.clear)
                    .accentColor(.clear)
                    .background(Color.clear)
                    .keyboardType(.numberPad)
            }.padding(.top, 40)
            
            VStack(spacing: 20) {
                Button("VERIFY") {
                }
                .frame(maxWidth: Double.infinity, minHeight: 54.0)
                .foregroundColor(.white)
                .font(.body.bold())
                .font(.custom("Avenir", size: 15))
                .background(Color.black)
                .cornerRadius(10)
                
                HStack {
                    Button {
                        
                    } label: {
                        Image("repeat")
                        Text("Report Issue")
                            .foregroundColor(.black)
                            .font(.custom("Avenir", size: 15))
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Report Issue")
                            .foregroundColor(.black)
                            .font(.custom("Avenir", size: 15))
                    }
                }
            }
            .padding(.top, 20)
            
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
        .navigationBarItems(trailing: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("Cancel")
                .foregroundColor(.black)
                .font(.custom("Avenir", size: 15))
        })
    }
    
    private func otpText(text: String) -> some View {
        
        return Text(text)
            .font(.title)
            .frame(width: textBoxWidth, height: textBoxHeight)
            .background(AppColors.semiGray)
            .cornerRadius(10.0)
            .padding(paddingOfBox)
    }
}

struct VerifyOTPView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyOTPView()
    }
}
