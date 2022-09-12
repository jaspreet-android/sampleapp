//
//  Welcome.swift
//  maggnet
//
//  Created by Deepak on 12/09/22.
//

import SwiftUI

struct Welcome: View {
    
    @State private var englishSelected: Bool = true

    var body: some View {
        NavigationView{
            VStack{
                VStack(alignment: .center,spacing: 10){
                    
                    Text(NSLocalizedString("welcome", comment: ""))
                        .foregroundColor(.black)
                        .font(.custom("Avenir", size: 26))

                    Text(NSLocalizedString("choose language", comment: ""))
                        .foregroundColor(.gray)
                        .font(.custom("Avenir", size: 21))

                }
                
                VStack(alignment: .center,spacing: 15){
                    
                    Button {
                        englishSelected = true
                    } label: {
                        HStack{
                            Text("English")
                                .foregroundColor(englishSelected ? .white : .black)
                                .font(.custom("Avenir", size: 16))
                            Spacer()
                            Image(englishSelected ? "infoCheck" : "emptyCircle")
                            
                        }
                        .padding()
                        .frame(width: 260, height: 54, alignment: .center)
                        
                        .background(englishSelected ? AppColors.semiBlue : AppColors.semiGray)
                        .cornerRadius(8)
                    }
                    
                    Button {
                        englishSelected = false

                    } label: {
                        HStack{
                            Text("عربي")
                                .foregroundColor(englishSelected ? .black : .white)                                .font(.custom("Avenir", size: 16))
                            Spacer()
                            Image(englishSelected ? "emptyCircle" : "infoCheck")
                        }
                        .padding()
                        .frame(width: 260, height: 54, alignment: .center)
                        .background(englishSelected ? AppColors.semiGray : AppColors.semiBlue)
                        .cornerRadius(8)
                    }
                    
                }
                .padding(.top,60)
                
                Spacer()
                
                VStack(alignment: .center,spacing: 40){
                    
                    Text(NSLocalizedString("language pref", comment: ""))
                        .foregroundColor(.gray)
                        .font(.custom("Avenir", size: 18))

                        .multilineTextAlignment(.center)
                        .frame(width: 250)
                    
                    
                    NavigationLink( destination: SignUp(), label: {
                        Text(NSLocalizedString("continue", comment: ""))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: 250, height: 54, alignment: .center)
                            .background(Color.black)
                            .cornerRadius(8)
                    })
                    
                }
            }
        }
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
