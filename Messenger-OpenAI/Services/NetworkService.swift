//
//  NetworkService.swift
//  Messenger-OpenAI
//
//  Created by Łukasz Bielawski on 25/09/2023.
//

import Foundation

@Observable
final class NetworkService {
    let model = "gpt-3.5-turbo"
    
    var configuredPostRequest = {
        let apiKey = "YOUR_API_KEY"
        let url = URL(string: "https://api.openai.com/v1/chat/completions")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        return request
    }()
    
    func postMessages(conversation: Conversation) async throws -> APIMessage {
        let systemAPIMessage = APIMessage(role: RoleType.system.rawValue, content: conversation.author.profession.systemMessage)
        
        var apiMessages: [APIMessage] = [systemAPIMessage]
        
        apiMessages += conversation.messages.compactMap { $0?.toAPIMessage }
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let postModel = PostModel(model: model, messages: apiMessages)
        
        let jsonData = try? encoder.encode(postModel)
        
        guard let jsonData else { throw PostError.encodingError }
        
        var request = configuredPostRequest
        request.setValue("\(String(describing: jsonData.count))", forHTTPHeaderField: "Content-Length")
        request.httpBody = jsonData
        
        let (data, httpResponse) = try await URLSession.shared.data(for: request)

        guard let httpResponse = httpResponse as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw PostError.statusCodeError }
        
        let apiModel = try? JSONDecoder().decode(APIModel.self, from: data)
        
        guard let apiModel else { throw PostError.decodingError }
        
        let choices = apiModel.choices
        let apiMessage = choices.last!.message
        return apiMessage
    }
}
