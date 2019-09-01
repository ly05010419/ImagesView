//
//  ContentView.swift
//  ImagesView
//
//  Created by LiYong on 01.09.19.
//  Copyright © 2019 Liyong. All rights reserved.
//

import SwiftUI

struct Pokemon: Identifiable {
    let id: Int
    let name: String
    let path: String
}

class DataSource{
    
    var images = [Pokemon]()
    
    init() {
        let fm = FileManager.default;
        guard let path = Bundle.main.resourcePath else{ return }
        guard let items = try? fm.contentsOfDirectory(atPath: path) else{ return }
        
        for i in 0..<items.count{
            let image = items[i]
            if image.starts(with: "nssl"){
                images.append(Pokemon(id:i ,name: "image \(i)", path: image))
            }
        }
    }
}

struct ContentView: View {
    
    var dataSource = DataSource()
    
    var body: some View {
        NavigationView{
            List(dataSource.images){pokemon in
                NavigationLink(destination: DetailView(pokemon: pokemon)) {
                    Text(pokemon.path)
                }.navigationBarTitle(Text(pokemon.name),displayMode: .inline)
            }.navigationBarTitle(Text("Hallo Swift")).navigationBarHidden(false)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


