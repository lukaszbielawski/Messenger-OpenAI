//
//  ImagePickerView.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 24/09/2023.
//

import SwiftUI

struct ImagePickerView: View {
    @Binding var pickerSelection: ImageType

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(ImageType.allCases, id: \.self) { imageType in
                        imageType.getImage
                            .resizable()
                            .scaledToFill()

                            .overlay(
                                Color.primaryColor
                                    .opacity(0.5)
                                    .overlay(
                                        Image(systemName: "checkmark")
                                            .resizable()
                                            .foregroundStyle(Color.accentColor)
                                            .scaledToFit()
                                            .padding(50)
                                            .opacity(0.8)
                                    )
                                    .opacity(pickerSelection == imageType ? 1.0 : 0.0)
                                    .animation(.linear, value: pickerSelection)
                            )
                            .circleViewModifier(frameWidth: 150)
                            .tag(imageType)
                            .id(imageType)
                            .gesture(TapGesture().onEnded {
                                withAnimation(.easeInOut(duration: 2.0)) {
                                    proxy.scrollTo(imageType, anchor: .center)
                                }
                                self.pickerSelection = imageType
                            })
                    }
                }
            }.onAppear {
                proxy.scrollTo(pickerSelection, anchor: .center)
            }
        }
    }
}

#Preview {
    let pickerSelection: Binding<ImageType> = .constant(.cheese)
    return ImagePickerView(pickerSelection: pickerSelection)
}
