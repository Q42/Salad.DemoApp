//
//  DetailView.swift
//  SaladSampleApp
//
//  Created by Mathijs Bernson on 24/01/2025.
//  Copyright © 2025 Q42. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let item: TodoItem

    var body: some View {
        VStack {
            Text(item.title)
                .accessibilityIdentifier("titleLabel")
            Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                .accessibilityIdentifier("timestampLabel")
        }
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("TodoDetailView")
    }
}

#Preview {
    DetailView(item: TodoItem(title: "Hello world", timestamp: Date.now))
}
