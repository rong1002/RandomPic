//
//  ContentView.swift
//  RandomPic
//
//  Created by Lin Bo Rong on 2020/12/16.
//

import SwiftUI

struct ContentView: View {
    
    var urlString: String
    @State private var Pic = Image(systemName: "photo")
    @State private var ChangePic = false
    func Change(){
        if let url = URL(string: urlString),
           let data = try? Data(contentsOf: url),
           let uiImage = UIImage(data: data){
            Pic = Image(uiImage: uiImage)
            ChangePic = true
        }
    }
    var body: some View{
        Pic.resizable()
            .onAppear{
                if ChangePic == false {
                    Change()
                }
            }
        Button(action: {
            Change()
        }) {
            HStack {
                Image(systemName: "magnifyingglass.circle.fill")
                Text("Change Picture")
                Image(systemName: "magnifyingglass.circle.fill")
            }
            .font(.system(size: 20))
            .foregroundColor(.black)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 120/255, green: 113/255, blue: 204/255), Color.init(red: 218/255, green: 217/255, blue: 255/255)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 5))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(urlString: "https://picsum.photos/200/300")
    }
}
