# Social Media Replica  

A modern, lightweight social media app inspired by Instagram Threads — but it’s grown into something uniquely its own. Share your thoughts, upload photos, and connect with others in a fresh, user-friendly space.  

---

## 🚀 Features  

- **Create Posts:** Share your ideas, moments, or photos with ease.  
- **Upload Images:** Bring your feed to life with pictures.  
- **Like & Engage:** Show appreciation for your favorite content.  
- **Profile Page:** Showcase your bio, posts, and more.  
- **Comment Threads:** Dive into a post’s comments for deeper conversations.  

---

## 📱 App Screenshots  

<p align="center">
    <img src="https://github.com/sharktankful/SocialThread/blob/main/SocialThread/Assets.xcassets/App%20Images/image_1.imageset/image_1.png" width="280" />
    <img src="https://github.com/sharktankful/SocialThread/blob/main/SocialThread/Assets.xcassets/App%20Images/image_2.imageset/image_2.png" width="280" />
    <img src="https://github.com/sharktankful/SocialThread/blob/main/SocialThread/Assets.xcassets/App%20Images/image_3.imageset/image_2.png" width="280" />
</p>

---

## 🛠 Architecture — MVVM  

This app follows the **Model-View-ViewModel (MVVM)** architecture to ensure a clean separation of concerns:  

- **Model:** Manages the data (posts, users, comments, images, etc).  
- **View:** Displays the UI — focused purely on layout and appearance.  
- **ViewModel:** Acts as the bridge between the View and Model, processing data and keeping the UI reactive.  

I chose this architecture to **keep data logic separate from the views**, making the app easier to scale, maintain, and expand over time.  

---

## ✅ Unit Testing

This project includes unit tests using XCTest to ensure core features work as expected. Key components like post-creation, data handling, and view models are tested for reliability and correctness.

---

## 👨‍💻 Authors  

- [@AlecSmith](https://github.com/sharktankful)  
