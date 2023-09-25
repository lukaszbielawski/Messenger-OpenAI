//
//  TextResponsePlaceholderView.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 25/09/2023.
//

import SwiftUI

enum Phase {
    case none
    case first
    case second
    case third
}

struct ThreeDotsView: View {
    @State var phase: Phase = .first

    var body: some View {
        HStack {
            Group {
                Image(systemName: "circle.fill")
                    .offset(x: 0, y: phase == .first ? -12 : 0)
                    .opacity(phase == .first ? 1 : 0.7)
                Image(systemName: "circle.fill")
                    .offset(x: 0, y: phase == .second ? -12 : 0)
                    .opacity(phase == .second ? 1 : 0.7)
                Image(systemName: "circle.fill")
                    .offset(x: 0, y: phase == .third ? -12 : 0)
                    .opacity(phase == .third ? 1 : 0.7)
            }
            .foregroundStyle(Color.secondaryColor)

            .font(.caption2)
        }.task {
            while true {
                withAnimation {
                    phase = .first
                }
                try? await Task.sleep(nanoseconds: 500_000_000)
                withAnimation {
                    phase = .second
                }

                try? await Task.sleep(nanoseconds: 500_000_000)
                withAnimation {
                    phase = .third
                }
                try? await Task.sleep(nanoseconds: 500_000_000)
                withAnimation {
                    phase = .none
                }
                try? await Task.sleep(nanoseconds: 1_000_000_000)
            }
        }
    }
}

struct TextResponsePlaceholderView: View {
    let author: Author

    var body: some View {
        HStack(alignment: .bottom) {
            author.profileImage.getImage
                .resizable()
                .scaledToFill()
                .circleViewModifier(frameWidth: UIScreen.main.bounds.size.width * 0.065)
                .padding(.vertical, 8)

            ThreeDotsView()
                .padding()
                .background(RoundedRectangle(cornerRadius: 16.0))
                .foregroundStyle(Color.primaryColor)
        }
        .padding(.horizontal)
        .containerRelativeFrame(.horizontal, alignment: .leading)
    }
}

#Preview {
    TextResponsePlaceholderView(author: Author.dummyData.first!)
}
