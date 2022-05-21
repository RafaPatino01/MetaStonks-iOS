//
//  ContentView.swift
//  MetaStonks
//
//  Created by Rafael Patino on 17/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        StartView()
    }
}

struct StartView: View {
    @State private var ingreso = false
    var body: some View {
        
        if(ingreso == true){
            LoginView()
        }
        else{
            ZStack {
                Color(red: 0.1, green: 0.1, blue: 0.1)
                .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("MetaStonks 🚀")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                    Text("Información condensada sobre el mundo del web 3.0")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .padding()
                    .multilineTextAlignment(.center)
                
                    Button("\(Image(systemName: "person.fill")) Ingresar") {
                        ingreso = true
                    }
                    .foregroundColor(.black)
                    .frame(width: 150, height: 30)
                    .background(.white)
                    .font(.system(size: 13))
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    
                }
                .padding(.top, -100.0)
            }
        }
    }
}

struct HomeView: View {
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.1, blue: 0.1)
            ScrollView{
                VStack{
                    Text("MetaStonks")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.top, 30.0)
                    Text("Información condensada sobre el mundo del web 3.0")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                        .padding(.bottom, 15.0)
                    Divider()
                     .frame(height: 1)
                     .padding(.horizontal, 30)
                     .background(Color.white)
                }
                .padding(.bottom, 20)
                
                
                VStack{
                    Text("₵rypto")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("$BTC $ETH $USDT $BNB $USDC $XRP $SOL $LUNA $ADA $UST $BUSD $DOGE $DOT $AVAX $SHIB $STETH $WBTC $DAI $NEAR $MATIC $TRX")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                        .padding(.bottom, 15.0)
                    Divider()
                     .frame(height: 1)
                     .padding(.horizontal, 30)
                     .background(Color.white)
                }
                .padding(.bottom, 20)
                
                
                VStack{
                    Text("💯 WebScraper")
                        .font(.title)
                        .foregroundColor(.white)
                    //Image("Coingecko")
                    Text("Recopilamos información de coingecko para encontrar los TOKENS más relvantes")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 15.0)
                    Divider()
                     .frame(height: 1)
                     .padding(.horizontal, 30)
                     .background(Color.white)
                }
                .padding(.bottom, 20)
                
                
                VStack{
                    Text("📚 MetaScore")
                        .font(.title)
                        .foregroundColor(.white)
                    Image("")
                    Text("Usamos el API de Reddit pata darte insights de los siguientes foros:")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 15.0)
                    //Image("Reddit")
                    Text("-r/CryptoCurreny")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                    Text("-r/Crypto_com")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                    Text("-r/cryptocurrencymemes")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                    Text("-r/SatoshiStreetsBets")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                    Text("-r/CryptoMarkets")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                    
                    Divider()
                     .frame(height: 1)
                     .padding(.horizontal, 30)
                     .background(Color.white)
                }
                .padding(.bottom, 20)
                
                VStack {
                    Text("¿Cómo ponderamos nuestros resultados?")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                    }
                    Image("graph")
                        .resizable()
                        .frame(height: 250)
                }
                
        }
        
    }
         
}

struct MainView: View {
    init() {

        UITabBar.appearance().backgroundColor = UIColor.darkGray

   }
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }
            CryptoView()
                .tabItem {
                    Image(systemName: "paperplane.fill")
                    Text("Crypto")
                }
            NftAddressView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("NFTs")
                }
        }
        .preferredColorScheme(.dark)
    }
}


