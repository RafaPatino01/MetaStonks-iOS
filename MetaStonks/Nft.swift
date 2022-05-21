//
//  Nft.swift
//  MetaStonks
//
//  Created by Rafael Patino on 20/05/22.
//

import Foundation
import SwiftUI

struct NftAddressView: View {
    @State private var address: String = ""
    @State private var rarity: Float = 0
    @State private var url: String = ""
    @State private var show_res: Bool = false
    var body: some View {
        
        //Display NFT rarity
        if(show_res){
            ZStack {
                Color(red: 0.1, green: 0.1, blue: 0.1)
                .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack (){
                        Text("NFTs")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding()
                    VStack {
                        Text("Información condensada sobre el mundo del web 3.0")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                    }
                    .padding(.top, -13.0)
                    .padding(.bottom, 35.0)
                    VStack (){
                        AsyncImage(url: URL(string: url)) { image in
                            image.resizable()
                        } placeholder: {
                            Color.red
                        }
                        .frame(width: 128, height: 128)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    }
                    VStack(){
                        Text("Rarity")
                            .foregroundColor(.white)
                    }
                    VStack(){
                        Text(String(rarity))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 45.0)
                    VStack {
                        Button("Volver a buscar") {
                            show_res = false
                        }
                        .foregroundColor(.black)
                        .frame(width: 350, height: 45)
                        .background(.blue)
                        .font(.system(size: 18))
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.top, 28.0)
                    .padding(.horizontal, 45.0)
                    
                }
            }
        }
        // Search NFT
        else {
            ZStack {
                Color(red: 0.1, green: 0.1, blue: 0.1)
                .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        Text("NFTs")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding()
                    VStack {
                        Text("Información condensada sobre el mundo del web 3.0")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                    }
                    .padding(.top, -13.0)
                    .padding(.bottom, 35.0)
                    VStack (alignment: .leading){
                        ZStack(alignment: .leading){
                            if address.isEmpty{
                                Text("Token address")
                                    .foregroundColor(.white.opacity(0.3))
                            }
                            TextField("",text: $address)
                        }
                        .padding(.leading, 20.0)
                        .frame(width: nil, height: 50)
                        .border(Color.white, width: 2)
                        .cornerRadius(4)
                        .foregroundColor(.white)
                    }
                    .padding(.horizontal, 45.0)
                    VStack {
                        Button("Buscar") {
                            print(address)
                            Api().searchNFT(pAddress: address, completion: { (res) in
                                print(res[0].rarity)
                                rarity = res[0].rarity
                                url = res[0].url
                                show_res = true
                            })
                        }
                        .foregroundColor(.black)
                        .frame(width: 350, height: 45)
                        .background(.blue)
                        .font(.system(size: 18))
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.top, 28.0)
                    .padding(.horizontal, 45.0)
                    
                }
            }
        }
    }
}

