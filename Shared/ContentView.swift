//
//  ContentView.swift
//  Shared
//
//  Created by hackergens on 25/07/2021.
//

import SwiftUI

struct ContentView: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack{
            VStack{
                CustomTextField(placeHolder: "Email", text: $email)
            }.padding(.bottom)
            VStack{
                CustomTextField(placeHolder: "Password", text: $password)
            }.padding(.top)
            
        }.frame(width:350,height:60)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
