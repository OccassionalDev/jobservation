# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
        Required the sinatra and sinatra-activerecord gem and setup controllers and a config.ru file alongside needed files for the app (i.e. views and model folder) in a MVC file structure.

- [X] Use ActiveRecord for storing information in a database
        ActiveRecord was used for storing a user information to allow for logins and stores information on a job application or interview in to the database.

- [X] Include more than one model class (e.g. User, Post, Category)
        Models folder contains a User, Interview, and Application model.

- [X] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
        A User has_many applications and interviews written in to the model.

- [X] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
        Interviews and Applications follow a belongs_to relationship with the User model.

- [X] Include user accounts with unique login attribute (username or email)
        User model contains a ActiveRecord validator for the emails in the Users model to ensure that one email does not get used more than once.

- [X] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
        Users have the ability to Create, Read, Update, and Destroy applications and interviews. Interviews can be viewed fully upon clicking the view link next to their information on the table and then can be deleted or edited upon by clicking on the right link/button on the view page. Applications can be fully viewed on the organizer page, as all information on them can fit in the table, by clicking on the Edit/Remove link the user is then brought to a page which allows them to select a application to edit or remove by clicking the correct link/button to the left of their information on the table.

- [X] Ensure that users can't modify content created by other users
        Users can only view applications and interviews created by them and are only given the option to delete, and modify the content created by them on their user home/organizer.

- [X] Include user input validations
        Forms for interviews and applications are able to validate time, date, and email addresses correctly.

- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
        README.md contains a description, installation section, contributors section, and a license section with a link to the MIT license attached.

Confirm
- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message
