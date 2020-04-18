# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
    Installed ActiveRecord and use it's methods to store data
- [x] Include more than one model class (e.g. User, Post, Category)
    Have a User class and Run class
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    Users have many Runs
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    Runs belong to a User
- [x] Include user accounts with unique login attribute (username or email)
    Users must have unique username and password
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    Pages for adding, viewing, editing, and deleting Runs
- [x] Ensure that users can't modify content created by other users
    Check is performed in the run/:id/edit route to verify that it cannot be accessed by a user other than its creator.
- [x] Include user input validations
    Data is checked for presence 
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    Working on this now, hopefully will be done before project review
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message