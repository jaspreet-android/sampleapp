

import SwiftUI

struct CountryCodeSelection: View {
    
    @Binding var isPresented: Bool
    @Binding var country: String
    
    
    var body: some View {
        NavigationView {
            ZStack {
                
                ScrollView( showsIndicators: false) {
                    LazyVStack( alignment: .leading) {
                        ForEach( Array( AppConstants.countryCodeList.keys ).sorted(), id: \.self )  { key in
                            
                            Button {
                                self.country = key
                                self.isPresented.toggle()
                            } label: {
                                HStack {
                                    Text( key )
                                        .font(.custom("Avenir", size: 20))
                                        .foregroundColor(.black)
                                    
                                    Text( AppConstants.countryCodeList[key]!)
                                            .font(.custom("Avenir", size: 20))
                                            .foregroundColor(.black)
                                    
                                    Spacer()
                                }.padding(.horizontal)
                                .padding( .vertical, 8)
                            }
                            
                            Divider()
                        }
                    }
                }.padding( .top, 1 )
            }.navigationBarTitle( Text( NSLocalizedString("countryCodes", comment: "" ) ), displayMode: .inline)
            .navigationBarItems(trailing: Button {
                self.isPresented.toggle()
            } label: {
                Text( "Cancel" )
            })
        }
    }
}

struct CountryCodeSelection_Previews: PreviewProvider {
    static var previews: some View {
        CountryCodeSelection(isPresented: .constant( false ), country: .constant( "" ))
    }
}
