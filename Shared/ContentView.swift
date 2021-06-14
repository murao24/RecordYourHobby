//
//  ContentView.swift
//  Shared
//
//  Created by 村尾慶伸 on 2021/06/14.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        Home()
            .preferredColorScheme(.dark)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home: View {
    
    @State var index = "Home"
    var device = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        
        VStack {
            
            NavBar(index: $index)
            
            Spacer()
        }
    }
}


struct NavBar: View {
    
    @Binding var index: String

    var device = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        
        HStack {
            
            Text("RecordYourHobby")
                .fontWeight(.bold)
                .font(.system(size: device == .phone ? 25 : 35))
            
            Spacer(minLength: 0)
            
            if device == .pad || device == .mac {
                
                HStack {
                    
                    NavButton(index: $index, title: "Home")
                    
                    NavButton(index: $index, title: "SwiftUI")
                    
                    NavButton(index: $index, title: "SwiftUI 2.0")
                    
                    NavButton(index: $index, title: "Contact")
                }
            }
        }
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        .padding()
        .background(Color.black)
        .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y:5)
    }
}


struct NavButton: View {
    
    @Binding var index: String
    var title: String
    
    var body: some View {
        
        Button(action: {
            
            withAnimation {
                
                index = title
            }
        }) {
            
            Text(title)
                .fontWeight(index == title ? .bold : .none)
                .foregroundColor(index == title ? .white: Color.white.opacity(0.7))
        }
    }
}
