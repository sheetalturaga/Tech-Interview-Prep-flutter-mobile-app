[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-c66648af7eb3fe8bc4f294546bfd86ef473780cde1dea487d3c4ff354943c9ae.svg)](https://classroom.github.com/online_ide?assignment_repo_id=9981754&assignment_repo_type=AssignmentRepo)
# Final Project: BLINDSPOT APP - LEARNING THE GAP

 ![BLINDSPOT-Brain](https://user-images.githubusercontent.com/46464544/227097873-20c15afa-33fb-4d8f-bc26-085f562cd145.gif)

## Purpose

The purpose of our Technical Interview Prep App is to provide a comprehensive and engaging platform for students preparing for technical interviews. Our app is designed to focus on concept-based learning including but not limited to, behavioral questions to help users gain an authentic understanding of the concept and allow them to focus on the non-coding-based questions rather than hardcore coding exercises. With our app, users can access a wealth of high-quality prep materials, including our extensive database of technical questions, and can add their own questions to the mix. Our goal is to help users build their confidence and prepare effectively for their upcoming technical interviews (leaving no blind spots), making it easier for them to succeed in their careers. 


## Overall Description

### User Characteristics: 

- Undergrad / Grad student preparing for technical interview. 
- Must some basic level understanding of programming languages, paradigms. 
- In the future, it can also be used as learning tool for K-12 students aspiring to get into Computer science. 

### User Stories: 

_Sign-in/Log-in Page:_ 

- As a user, I want to be able to create and log in to my profile so I can keep track of my progress. 
- As a user, I want to be able to access the settings and logout with the help of an icon, so that I can easily navigate to profile or logout of the app. 

_Quiz Page:_

- As a user, I want a button for each topic so that I can easily choose which topic I want to play quiz on.
- As a user, I want the questions to be unique for each session of quiz for all the different topics so that I’m never asked the same questions again. 
- As a user, I want to have a report button so that I can report a problem if I find the question is not correct. 
- As a user, I want to have an explanation, either right or wrong, after each question. 
- As a user, I want to have one question being displayed at a time during a session with a next button, so that it reduces clutter and helps with the flow of the quiz. 
- As a user, I would like to have a star mark that I can use to store that specific question to my study center so I can track the questions I was not sure about or need to follow up on. 

_User Progress:_

- As a user, I want a button that can take me to my personal scoreboard so that I can see the progress I have made so far. 

_Notebook Page:_

- As a user, I want the app to have a collection of all the questions/problems I got wrong or wasn’t sure of, so that I can revisit and review those concepts thoroughly.

_General:_  

- As a user, I want the color scheme to be bright and pleasant so that the app is inviting. 

_Additional Features:_

- Everyday challenge: function hold for now. 
- Calendar feature: As a user, I would like to have a calendar feature, so I can mark how often I am able to practice and visualize my streak.
- Customizable profile picture/edit profile: As a user, I would like to personalize my profile by being able to customize my profile page /picture so that it keeps my profile unique.
- User Collaboration: As a user I would like to be able to create a study group so I could invite other users to my network and do competitive time-based group quiz session. This could be a way to make studying fun and ensures we stick to the study plan.

_App Workflow:_

![BlindSpot_Appworkflow](https://user-images.githubusercontent.com/46464544/227097683-49ecfc96-6e55-498d-872d-4a62437d6272.jpeg)


## Requirement

### Functional: 

- The app should allow users to register an account and securely authenticate their identity. Authentication System to be implemented such that the user is automatically logged in once they have signed up. 
- The app allows users to edit their Account settings including change password function, edit profile, add profile picture, etc. 
- The app can allow users who are not logged in to play a quiz and answer questions, but their progress will not be saved.  
- The app should provide a database of unique MCQ types of questions with options, answers, and explanation for the questions for different topics with the functionality that allows users to test their knowledge and track their progress. 
- The app should provide personalized learning through the study center for users to save and review specific questions and topics to further study. 
- Each trivia session can consist of 10 questions for the selection topic 
- The app should allow users to search filter the search by topic for this time, and include other filters like difficulty level, questions, and other criteria in the future. 
- The background color for the app windows should be in pleasant in presentation and pleasing to the eye 
- The system must store the count of how many questions the user got right and wrong for the personal scoreboard. 
- In the future, the app should allow users to share their progress and achievements, being able to create study groups to compete with friends in the leaderboards and challenges.

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


## Gantt Diagram
![SailorSenshi_BlindSpot_Ganttchart](https://user-images.githubusercontent.com/46464544/224565780-fe4b81a7-95c7-4ee0-8130-8b70bc636259.png)

## Traceability Matrix

| Requirements | Design of Pages |      Code     |     Test      |
|--------------|-----------------|---------------|---------------|
| Welcome page |                 |               |               |
| Register page|                 |               |               |
| Quiz Page    |                 |               |               |
| Question Page|                 |               |               |
| Result page  |                 |               |               |
| Notebook page|                 |               |               |
| Progress page|                 |               |               |
| Profile page |                 |               |               |





