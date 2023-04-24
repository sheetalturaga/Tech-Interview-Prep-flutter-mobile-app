[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-c66648af7eb3fe8bc4f294546bfd86ef473780cde1dea487d3c4ff354943c9ae.svg)](https://classroom.github.com/online_ide?assignment_repo_id=9981754&assignment_repo_type=AssignmentRepo)
# Final Project: BLINDSPOT APP - LEARNING THE GAP

 ![BLINDSPOT-Brain](https://user-images.githubusercontent.com/46464544/227097873-20c15afa-33fb-4d8f-bc26-085f562cd145.gif)

## Purpose

The purpose of our Technical Interview Prep App is to provide a comprehensive and engaging platform for students preparing for technical interviews. Our app is designed to focus on concept-based learning including but not limited to, behavioral questions to help users gain an authentic understanding of the concept and allow them to focus on the non-coding-based questions rather than hardcore coding exercises. With our app, users can access a wealth of high-quality prep materials, including our extensive database of technical questions, and can add their own questions to the mix. Our goal is to help users build their confidence and prepare effectively for their upcoming technical interviews (leaving no blind spots), making it easier for them to succeed in their careers. 


## Overall Description

### Development Process:

The development process involved the use of Model-View-Controller architecture. It was implemented by using the Getx microframework that combines state management, route management and dependency injection. The use of this framework helped us in decoupling the business logic from the view and the presentation code.

For database storage, we chose to go with Firebase Firestore for store and retrieving data for the questions collection, the collection of question in a specific user's notebook and also the users data. Since we also used third party authentication for the login process, we also used Firebase Auth feature to implement our authentication process for the app. 

### Features and Functionality: 

- The mobile app is designed to cater to two types of users - undergraduate/graduate students preparing for technical interviews and K-12 students aspiring to get into computer science. The app has several features that cater to the needs of the users.

_Welcome + Landing Page:_ 

- The Welcome + Landing page is the first page the user encounters. The landing page is the entry point into the app that gives the user access to the login page and an about page. 

_Login Page_:

As users, they are able to log in to the app so that they can access the quiz and also keep track of their progress. The user is able to log in with their existing google and facebook accounts with the help of third-party authentications services. The user can also access the settings and logout with the help of an icon on the bottom navbar that enables them to easily navigate to their profile or logout of the app.

_Home Page:_

The Home page is where the user is able to see the various topics that they have access to. As a user, they have a button for each topic so that they can easily choose a topic to take the quiz on. 

_Question Display Pages_:

One question is displayed at a time during a quiz with a next button, so that it reduces clutter and helps with the flow of the quiz. The color of the selected option for questions turns red or green based on the answer provided to show the user if they chose the right or wrong answer. The app automatically saves incorrectly answered questions, irrespective of the topic, to the user's notebook for convenient tracking of areas that require further attention.

_User Progress:_

The User Progress feature allows the user to track their progress. As a user, they have a button that takes them to their personal scoreboard so that they track their progress. This feature allows the user to see the percentage of how many questions they've got correct in a given topic and the percentage of how many questions they've answered overall.

_Notebook Page:_

The Notebook page allows the user to keep track of the questions they answered incorrectly. As a user, the app has a collection of all the questions they answered incorrectly, irrespective of the topic, so that they can revisit and review those concepts thoroughly.

_Explanation Page:_

The explanation page was initially planned for the app but later deprioritized. The prioritization of the notebook page over the explanation page was a strategic decision made to enhance the user experience. The quiz display pages already provide the user with instant feedback on whether their answers are correct or incorrect, making the addition of another button for accessing the explanation page unnecessary.

_General:_  

The mobile app has a bright and pleasant color scheme that is user-friendly and easy on the eyes.

_Backlog:_

- Comprehensive testing of most of the widgets and functions in the app is yet to be completed.
- Although the option to select specific questions for the notebook is still pending, the app currently adds all incorrectly answered questions automatically.
- The randomization of questions presented to the user is yet to be implemented. To ensure optimal performance, the database has been kept small, with users receiving only ten questions per quiz & topic.
- Due to several setup issues encountered during development, Facebook and Apple login were deprioritized.
- During the implementation phase, the proposed explanation page was withdrawn in favor of giving the notebook feature greater prominence.
- The app allows users to edit only their Username within the app at this time. Allowing edits to their Account settings including change password function, edit profile, change color themes, add profile picture, etc is yet to be implemented
- The app can allow users to share their progress and achievements, being able to create study groups to compete with friends in the leaderboards and challenges.
- The app can allow users to search filter the search by topic, difficulty level, questions, and other criteria in the future.

_Additional Features:_

- Everyday challenge: function hold for now. 
- Calendar feature: As a user, I would like to have a calendar feature, so I can mark how often I am able to practice and visualize my streak.
- Customizable profile picture/edit profile: As a user, I would like to personalize my profile by being able to customize my profile page /picture so that it keeps my profile unique.
- User Collaboration: As a user I would like to be able to create a study group so I could invite other users to my network and do competitive time-based group quiz session. This could be a way to make studying fun and ensures we stick to the study plan.
- The questions are unique for each session of the quiz for all the different topics so that the user is never asked the same questions again. The user can report a problem if the question is not correct. The app provides an explanation, either right or wrong, after each question.


### App Workflow: 

![BlindSpot_Appworkflow](https://user-images.githubusercontent.com/46464544/227097683-49ecfc96-6e55-498d-872d-4a62437d6272.jpeg)


## Requirement

### Functional: 

- The app should allow users to register an account and securely authenticate their identity. Authentication System to be implemented such that the user is automatically logged in once they have signed up. 
- The app cannot allow users who are not logged in to play a quiz and answer questions.
- The app should provide a database of unique MCQ types of questions with options, answers, and explanation for the questions for different topics with the functionality that allows users to test their knowledge and track their progress. 
- The app should provide personalized learning through the notebook for users to save and review specific questions and topics to further study. 
- Each quiz topic can consist of 10 questions for the selection topic 
- The background color for the app windows should be in pleasant in presentation and pleasing to the eye 
- The system must store the count of how many questions the user got right and wrong for the personal scoreboard. 

### Non-functional：

- The user won't be able to change the button position. 
- The app should respond promptly to user inputs, load quickly and supports a decent volume of concurrent users without experience slowdowns or crashes in the future 
- The app should be easy to use and intuitive with a simple and uncomplicated user interface. 
- The app should protect user information and log-in data and prevent unauthorized access to sensitive information. 
- The app should be compatible with android and iOS and should be available 24/7 with minimal downtime for maintenance and updates. 
- The app should support English language at this time and must have the potential for other languages in the future. 
- The app should be designed to be accessible to users with disabilities like carousels for questions and keyboard navigation. 
- The app should be designed to allow for future updates and improvements to meet evolving needs of users and technical interview landscapes.	 

## Wireframes

Please refer to this link to findout the details of our wireframes.
https://cdn-uploads.piazza.com/paste/kes5if5dl0j55h/4390b76e58986960c92d7bfa6177839b84150cca90997fa2a29310f6dd31e31d/Sailor_Senshi.pdf

## Team UML calss diagram
<img width="1063" alt="Screenshot 2023-03-16 at 2 14 06 PM" src="https://user-images.githubusercontent.com/98671143/225754244-68fae70a-f3f1-425b-b383-09d35d084b7a.png">

![BlindSpot_ClassDiagram - UML Class](https://user-images.githubusercontent.com/46464544/233766139-64110428-5f3a-4709-9e24-2177fc9fc30c.png)


## Gantt Diagram
![SailorSenshi_BlindSpot_Ganttchart](https://user-images.githubusercontent.com/46464544/224565780-fe4b81a7-95c7-4ee0-8130-8b70bc636259.png)

## Traceability Matrix

| Requirements                                               | Design of Pages    | Business Logic | Code       | Test         |
| ---------------------------------------------------------- | ------------------ | -------------- | ---------- | ------------ |
| Logo Design                                                | Sheetal            |                |            |              |
| Welcome Page                                               | Xiaoxiao           | Xiaoxiao       | PR # 12    | Jing         |
| Landing Page                                               | Xiaoxiao           | Xiaoxiao / Chu | PR # 12    | Jing         |
| About Page                                                 | Xiaoxiao           |                | PR # 12    |              |
| Home Page                                                  | Sheetal/Jing       | Sheetal        | PR # 12    | Jing         |
| Quiz Display Page                                          | Sheetal/Jing       | Sheetal        | PR # 25    | Jing         |
| Result page                                                | Sheetal            | Sheetal        | PR # 34    | Jing         |
| Notebook Page                                              | Xiaoxiao / Chu     | Chu            | PR # 23    | Jing         |
| Explanation Page                                           | Sheetal            | Sheetal        | Deprecated |              |
| Progress page                                              | Jing               | Jing           | PR # 20    |              |
| Settings Page                                              | Xiaoxiao / Sheetal | Xiaoxiao       |            | Jing         |
| Profile Page                                               | Xiaoxiao           |                | PR # 30    |              |
| Firestore DB setup and data models setup up                | Sheetal / Chu      | Sheetal / Chu  | PR # 18    | Sheetal/Jing |
| Firestore DB connections to Questions Collection           | Sheetal            | Sheetal        | PR # 18    | Sheetal/Jing |
| Firestore DB connections to Notebook Collection            | Chu                | Chu            | PR # 21    |              |
| Firestore DB connections to User Collection                | Chu                | Chu            | PR # 27    |              |
| UI Updates to all pages                                    | Sheetal            |                | PR # 38    |              |
| Updates workflow                                           | Chu                |                | PR # 35    |              |



