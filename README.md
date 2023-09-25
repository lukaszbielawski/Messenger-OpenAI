# Messenger-OpenAI

The OpenAI Chatbot Messenger app is a versatile communication tool built using SwiftUI, SwiftData, and Swift Concurrency. It enables users to create conversations with AI-powered chatbots via a menu-driven interface. Users can customize bot names, select from a list of given professions, and choose one from avaliable profile images for their chatbots. The app communicates the chosen profession to the AI backend, ensuring that conversations remain occupation-related. Furthermore, all conversations are stored on the device's hard drive.

<h2>Features</h2>

* Create Conversations: Initiate conversations with AI-powered chatbots via a menu-driven interface.
* Bot Customization: Choose a unique name, profession, and profile image for your chatbot.
* Profession-based Chat: The app communicates the selected profession to the AI backend, allowing the chatbot to respond contextually.
* Local Storage: Securely store all conversations on the device's hard drive for future reference.
  
<h2>Presentation</h2>

https://github.com/lukaszbielawski/Messenger-OpenAI/assets/44624897/0e8d023e-831b-49af-aa22-4053cf190ea8

<h2>Requirements</h2>

* Xcode 15.0+
* Swift 5.9+
* iOS 17.0+

<h2>Installation</h2>

1. Clone the repository:

```bash
git clone https://github.com/lukaszbielawski/Messenger-OpenAI
```

2. Open the project in Xcode.
3. Change the <i>apiKey</i> field in <i>NetworkService.swift</i> file to your own.
4. Build and run the app on a simulator or a physical device running iOS 17.0 or later.

<h2>Usage</h2>

<h3>Conversation Creation</h3>

1. Launch the app on your iOS device.
2. Use the menu-driven interface by clicking plus button to create a new conversation with a chatbot.
3. Customize your chatbot by choosing a name, profession, and profile image.

<h3>Profession-based Chat</h3>

1. After creation of conversation, you may go to conversation view by selecting one of conversations from menu list.
2. To communicate with chatbot, you should tap text field at the bottom of a screen and create your message.
3. Don't forgot to send your message by clicking paper plane button.
4. The chatbot responds contextually, ensuring that the conversation remains occupation-related.
5. If you accidentaly created this conversation you may remove it by tapping trash bin icon in conversation view.

<h2>API Integration</h2>

The app communicates with the OpenAI API to power the chatbot's responses based on the chosen profession. Ensure that you have appropriate API credentials.

<h2>License</h2>

<a href="https://www.mit.edu/~amini/LICENSE.md">MIT License</a>
