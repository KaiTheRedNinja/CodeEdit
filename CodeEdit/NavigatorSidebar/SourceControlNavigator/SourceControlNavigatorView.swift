//
//  SourceControlNavigatorView.swift
//  CodeEdit
//
//  Created by Nanashi Li on 2022/05/20.
//

import SwiftUI
import CodeEditUI

struct SourceControlNavigatorView: View {

    @ObservedObject
    private var workspace: WorkspaceDocument

    @ObservedObject
    var model: SourceControlModel

    @State
    private var selectedSection: Int = 0

    init(workspace: WorkspaceDocument, model: SourceControlModel) {
        self.workspace = workspace
        self.model = model
    }

    var body: some View {
        VStack {
            SegmentedControl($selectedSection,
                             options: ["Changes", "Repositories"],
                             prominent: true)
            .frame(maxWidth: .infinity)
            .frame(height: 27)
            .padding(.horizontal, 8)
            .padding(.bottom, 2)
            .overlay(alignment: .bottom) {
                Divider()
            }

            if selectedSection == 0 {
                ChangesView(model: self.model)
            }

            if selectedSection == 1 {
                RepositoriesView()
            }
        }
    }
}
