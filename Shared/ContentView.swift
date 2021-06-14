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
    
    @State var index: String = "Home"
    @State var menu: Bool = false
    var device = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                NavBar(index: $index, menu: $menu)
                
                Spacer()
            }
            
            // iPhone menu
            if menu {
                
                VStack {
                    
                    Spacer()
                    
                    LazyVStack(alignment: .leading, spacing: 25) {
                        
                        NavButton(index: $index, title: "Home")
                        
                        NavButton(index: $index, title: "SwiftUI")
                        
                        NavButton(index: $index, title: "SwiftUI 2.0")
                        
                        NavButton(index: $index, title: "Contact")
                    }
                    .frame(width: UIScreen.main.bounds.width - 50)
                    .padding(.vertical, 20)
                    .background(Color.black)
                    .cornerRadius(25)
                    
                    Spacer()
                }
                // dim background
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Color.black.opacity(0.35).edgesIgnoringSafeArea(.all)
                    // closing menu when user clicks outside
                        .onTapGesture {
                            
                            withAnimation {
                                
                                menu.toggle()
                            }
                        }
                )
            }
        }
    }
}


struct NavBar: View {
    
    @Binding var index: String
    @Binding var menu: Bool

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
            
            else {
                
                Button(action: {
                    
                    withAnimation {
                        
                        menu.toggle()
                    }
                }) {
                    
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: 26))
                        .foregroundColor(.white)
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
