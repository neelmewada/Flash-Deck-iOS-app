# Flash Deck iOS App

A simple flash cards iOS app made in SwiftUI. Flash cards are really versatile study tool that can help you remember things quickly. Flash cards have two faces. Front face contains the prompt (question), and the answer/solution is on the back face.

Check out the video demo here: [Video Demo](https://youtu.be/Cqoqwse8bgw)

## Screenshots

<div style="text-align: center;">
<img src="https://i.ibb.co/myTG0Th/App-Screenshot.png">
</div>



## Overview

- Made with the latest SwiftUI Framework using Xcode 12.
- Integration with **Google Firebase**. Any modifications or additions made to the card packs in Firebase will be reflected in the app in Real-Time.
- Modern UI/UX design
- Smooth card animations
- Flash Cards are divided into card packs based on their category.

## Design/Prototyping Process

I used Adobe XD for design and prototyping of this app. Below is the screenshot of my XD design.

![](https://i.ibb.co/gvM1JBD/Screenshot-2021-03-23-at-6-15-02-PM.png)


## Build Process

If you want to build this app yourself, then here are the requirements for the build:
- **Xcode 12**
- **Firebase**: Firebase Cloudstore is used to store and get Flash Cards in real time. And download the GoogleService-Info.plist file from Firebase console to your xcode project.
- **CocoaPods**: CocoaPods is a dependency manager for Swift and Objective-C projects. You can install it by using ```brew install cocoapods``` in macOS terminal.
- **macOS Big Sur Recommended**


## Project Structure

The file and folder structure of the project:

```bash
├── Flash Deck
│   ├── Flash_DeckApp.swift      # Entry point of iOS app
│   ├── Model						   # Data structures (MVVM architecture)
│   │   ├── FlashCard.swift		 # Data structure for Flash Cards
│   │   ├── ModelData.swift     # Run-time data structure
│   ├── Views
│   │   ├── ContentView.swift     # The base View for the app
│   │   ├── UserCardPacksView.swift   # Home page view showing list of card packs
│   │   ├── CardPackItemView.swift
│   │   ├── BurgerMenuView.swift
│   │   └──FlashCard          # Folder of views related to flash cards
│   │   │   ├── FlashCardList.swift
│   │   │   ├── FlashCardMainView.swift
│   │   │   ├── FlashCardView.swift
│   │   │   └── CardCounter.swift
│   └── Helpers					# Folder containing Helper code
│   │   ├── Extensions.swift
│   │   └── ScrollingStackModifier.swift
```

<br>



