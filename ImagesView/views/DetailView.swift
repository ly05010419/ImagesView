//
//  DetailView.swift
//  ImagesView
//
//  Created by LiYong on 01.09.19.
//  Copyright © 2019 Liyong. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @State private var hideBar = false
    
    let pokemon: Pokemon
    
    var body: some View {
        
        let image = UIImage(named: pokemon.path)!
        
        return Image(uiImage:image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .navigationBarHidden(hideBar)
            .onTapGesture {
                self.hideBar.toggle()
                print("tap")
        }
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pokemon: Pokemon(id: 0, name: "image 0", path: "nssl0049.jpg"))
    }
}
