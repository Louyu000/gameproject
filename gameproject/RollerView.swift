//
//  test.swift
//  gameproject
//
//  Created by Lou on 2023/3/13.
//

import SwiftUI

struct RollerView: View {
    @State private var rotateDegree: Double = 0
    @State private var ballrotateDegree: Double = 0
    @State private var rndnum: Int = 0
    @Binding var showSecondView: Bool
    @State var showThirdView = false
    var trans = [23,35,14,2,0,28,9,26,30,11,7,20,32,17,5,22,34,15,3,24,36,13,1,37,27,10,25,29,12,8,19,31,18,6,21,33,16,4]
    var prize = [[0],[1,37,40,73,74,109,131,134,138,136],[2,38,41,73,74,75,109,110,131,134,135,137],[3,39,42,73,75,110,131,134,138,136],[4,37,40,43,76,77,109,111,131,134,135,137],[5,38,41,44,76,77,78,109,110,111,112,131,134,138,136],[6,39,42,45,76,78,110,112,131,134,135,137],[7,37,43,46,79,80,111,113,131,134,138,136],[8,38,44,47,79,80,81,111,112,113,114,131,134,135,137],[9,39,45,48,79,81,112,114,131,134,138,136],[10,37,46,49,82,83,113,115,131,134,135,137],[11,38,47,50,82,83,84,113,114,115,116,131,134,138,137],[12,39,48,51,82,84,114,116,131,134,135,136],[13,37,49,52,85,86,115,117,132,134,138,137],[14,38,50,53,85,86,87,115,116,117,118,132,134,135,136],[15,39,51,54,85,87,116,118,132,134,138,137],[16,37,52,55,88,89,117,119,132,134,135,136],[17,38,53,56,88,89,90,117,118,119,120,132,134,138,137],[18,39,54,57,88,90,118,120,132,134,135,136],[19,37,55,58,91,92,119,121,132,139,138,136],[20,38,56,59,91,92,93,119,120,121,122,132,139,135,137],[21,39,57,60,91,93,120,122,132,139,138,136],[22,37,58,61,94,95,121,123,132,139,135,137],[23,38,59,62,94,95,96,121,122,123,124,132,139,138,136],[24,39,60,63,94,96,122,124,132,139,135,137],[25,37,61,64,97,98,123,125,133,139,138,136],[26,38,62,65,97,98,99,123,124,125,126,133,139,135,137],[27,39,63,66,97,99,124,126,133,139,138,136],[28,37,64,67,100,101,125,127,133,139,135,137],[29,38,65,68,100,101,102,125,126,127,128,133,139,138,137],[30,39,66,69,100,102,126,128,133,139,135,136],[31,37,67,70,103,104,127,129,133,139,138,137],[32,38,68,71,103,104,105,127,128,129,130,133,139,135,136],[33,39,69,72,103,105,128,130,133,139,138,137],[34,37,70,106,107,129,133,139,135,136],[35,38,71,106,107,108,129,130,133,139,138,137],[36,39,72,106,108,130,133,139,135,136],[140]]
    @Binding var money : Int
    @Binding var onbet: Array<Int>
    @State var winningslot:Array<Int> = []
    @State var message = ""
    var body: some View {
        ZStack{
            Image("desk")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0,
                       maxWidth: .infinity, minHeight: 0,
                       maxHeight: .infinity)
                .ignoresSafeArea()
            HStack{
                ZStack{
                    Image("roller")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 370,maxHeight:370)
                    Image("inroll")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 280,maxHeight:280).offset(x: 3)
                        .overlay(Image("ball")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 15,maxHeight:15)
                            .offset(x:105)
                            .rotationEffect(.degrees(ballrotateDegree))
                            .animation(
                                .easeOut(duration: 7)
                            ))
                        .rotationEffect(.degrees(rotateDegree))
                        .animation(
                            .easeOut(duration: 5)
                        )
                    
                }
                /*Image("spin")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 90,maxHeight: 90)
                    .onTapGesture{
                        rndnum=Int.random(in: 0...37)
                        rotateDegree += 720+Double(rndnum)/38*360
                        ballrotateDegree += 720+Double(rndnum)/38*360
                        winningslot=checkwin(num:rndnum)
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                            
                            showSecondView = false
                        }
                    }*/
                ZStack{
                    Image("numBG")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 200,maxHeight: 200)
                    VStack{
                        Text("轉到的數字是")
                            .fontWeight(.black)
                            .frame(maxWidth: 120,maxHeight: 10)
                        Text("\(message)")
                            .font(.title)
                            .fontWeight(.black)
                            .frame(maxWidth: 100,maxHeight: 70)
                        
                    }.offset(y:30)
                    
                }
                
            }
        }.onAppear{
            rndnum=Int.random(in: 0...37)
            rotateDegree += 720+Double(rndnum)/38*360
            ballrotateDegree += 720+Double(rndnum)/38*360
            winningslot=checkwin(num:rndnum)
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                if trans[rndnum] > 0 {
                    if trans[rndnum] == 140{
                        message = "00"
                    }
                    else{
                        message = "\(trans[rndnum])"
                    }
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                for index in 0..<winningslot.count { addmoney(number:winningslot[index])
                }
                if money==0{
                        showThirdView=true
                }
                else{
                    showSecondView = false
                    
                }
            }
        }.fullScreenCover(isPresented: $showThirdView){
            LosePage(showSecondView: $showSecondView,showThirdView: $showThirdView, money: $money)
        }
    }
    func checkwin(num:Int)->(Array<Int>){
        return prize[trans[num]]
        
    }
    func addmoney(number:Int){
        if (number<=36){
            money+=onbet[number]*36
        }
        else if (number<=39){
            money+=onbet[number]*3
        }
        else if (number==73||number==76||number==79||number==82||number==85||number==88||number==91||number==94||number==97||number==100||number==103||number==106){
            money+=onbet[number]*12
        }
        else if (number<=108){
            money+=onbet[number]*18
        }
        else if (number<=130){
            money+=onbet[number]*9
        }
        else if (number<=133){
            money+=onbet[number]*3
        }
        else if (number<=139){
            money+=onbet[number]*2
        }
        else if (number==140){
            money+=onbet[number]*36
        }
    }
}

struct RollerView_Previews: PreviewProvider {
    static var previews: some View {
        RollerView(showSecondView:.constant(true),money:.constant(0),onbet:.constant([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]) ).previewInterfaceOrientation(.landscapeLeft)
    }
}
