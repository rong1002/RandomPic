//
//  ContentView.swift
//  RandomPic
//
//  Created by Lin Bo Rong on 2020/12/16.
//

import SwiftUI
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    @ObservedObject var imagePicker: ImagePicker
    @State var image:UIImage = UIImage()
    
    init() {
        imagePicker = ImagePicker(urlString: "https://picsum.photos/200/300")
    }
    var body: some View {
        
        VStack{
            Image(uiImage: imagePicker.data != nil ? UIImage(data: imagePicker.data!)!: UIImage())
                .resizable()
                .scaledToFit()
            Button(action:{
                imagePicker.Change()
            }){
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
}

class ImagePicker: ObservableObject {
    @Published var data:Data?
    
    var urlString: String = "https://picsum.photos/200/300"
    @State var change:Int?
    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
    
    func Change()
    {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async{
                self.data = data
                
            }
        }
        task.resume()
    }
    
}
