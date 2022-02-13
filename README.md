# Web Application for 'Mexiquito' Mexican Restaurant

- [Web Application for 'Mexiquito' Mexican Restaurant](#web-application-for-mexiquito-mexican-restaurant)
  - [Introduction](#introduction)
  - [Links](#links)
  - [Getting started with this web app](#getting-started-with-this-web-app)
  - [Installation](#installation)
  - [Database initialisation](#database-initialisation)
  - [Running the app](#running-the-app)
  - [Testing](#testing)
  - [Updated Project Details](#updated-project-details)
    - [Menu Filtering](#menu-filtering)
    - [User management](#user-management)
  - [Tech Stack](#tech-stack)
    - [Front-end](#front-end)
      - [React](#react)
        - [Key React Dependencies](#key-react-dependencies)
    - [Back-end](#back-end)
      - [Ruby on Rails](#ruby-on-rails)
        - [Key Rails Dependencies](#key-rails-dependencies)
  - [User Testing](#user-testing)
    - [Development](#development)
    - [Production](#production)
  - [Project Managment and Task Delegation Methodologies](#project-managment-and-task-delegation-methodologies)

## Introduction

This repository holds the back end resources for a web application for a fictional Mexican restaurant called 'Mexiquito'.  This website is hosted at [https://mexiqui.to](https://mexiqui.to), on Netlify infrastructure.

This web application was developed as part of a project for a web development course.  The front end is developed in React and is hosted at a [different repository here](https://github.com/korayleigh/t3a2-b-frontend), the backend is developed with Ruby on Rails, and is hosted at Heroku.

The planning documentation for this project is available [at this respository](https://github.com/korayleigh/t3a2-a).


## Links

- [Deployed website](https://mexiqui.to)
- [Trello Board](https://trello.com/b/CoWRRx5z/full-stack-app)
  containing all of the project management and task allocation information.
- [Original Planning Documentation Repository](https://github.com/korayleigh/t3a2-a)
  containing the documentation as submitted for Part A.
- [This frontend repository](https://github.com/korayleigh/t3a2-b-frontend)
  containing the frontend React application.
- [The backend repository](https://github.com/korayleigh/t3a2-b-backend/)
  containing the backend ruby on rails application
- [Supplementary Part B Documentation repository](https://github.com/korayleigh/t3a2-b-docs)
  containing continued meetings minutes, trello screenshots, entity relationship diagram, site-map, and generally other things that didn't fit in either of the application repositories like shared git hooks.
- [User testing spreadsheets](https://docs.google.com/spreadsheets/d/1s3-LPndBm64y04VEfctXHCvG2uDPyusrkV6-mnXbwiQ/edit?usp=sharing)
- containing records of user testing of development and production sites

## Getting started with this web app

This project is a ruby on rails application. It was created using ruby version 2.7.4.  For best results it is recommended to install this same version of ruby.  This repository contains the backend code to run the 'Mexiquito' mexican restaurant web app.  The frontend code is available [here at the frontend repository](https://github.com/korayleigh/t3a2-b-frontend).


## Installation

To install and view this web application, first clone the repository:
```sh
git@github.com:korayleigh/t3a2-b-backend.git
```
then change into the resulting new directory:
```sh
cd t3a2-b-backend
```

This rails application is setup to use a postgreSQL database. You will need to have postgreSQL installed on your system.  Consult your own system documentation for instructions to install it.

Assuming you have ruby installed (we used 2.7.4), you can use the `gem` utility to install `bundler` which you can then use to take care of the rest of the dependency management.

```sh
gem install bundler
```

Install all required dependencies:
```sh
bundle install
```

## Database initialisation

To create the database:
```sh
bundle exec rails db:create
```

Then load the database schema:
```sh
bundle exec rials db:schema:load
```

And finally if you wish, seed the database with included example data:
```sh
bundle exec rails db:seed
```

## Running the app

To run the rails server locally in development mode:
```sh
bundle exec rails s
```

## Testing

Some request helpers for various controllers are included. The following commands will run the tests:

```sh
bundle exec rspec --parallel
```

## Updated Project Details

Best laid plans and all that...

Time pressures have caused use to slightly prune some of the features of the original MVP.  Most features are implemented, although some in a slightly simplified design than the original plan detailed in the Part A documentation.

### Menu Filtering

The sophistication of the menu filtering/searching functions is less than originally planned for MVP.  As a team we decided to delay development of more advanced filtering, based on ingredients, or menu item attributes, until the next version of the app.  Currently the user has the ability to filter by category, and also by a free text search which includes the name and description of the menu item.
### User management

Due to time pressure, our team decided to simplify the user setup for the first release.  Instead of multiple roles, we have one 'Admin' role who can perform functions that are destructive, and view information that is privacy sensitive.

Originally, the 'kitchen', 'waiter' and 'manager' users were intended to have their own logins with access only to the information and functions required to perform their duties.  However without these logins, these users can still use the admin login for access, although they will have too much permission for overall management of the app.

A future update to the app is intended to introduce the fine scale permissions and authorisations that were originally intended.

## Tech Stack

The project contains some extra dependencies than originally planned, and some slight changes to versions of dependencies.

### Front-end

#### React

- **React version:** 17.0.2

##### Key React Dependencies

|Dependency|Version|
|---|---|
|react-scripts|5.0.0|
|react-router|6.2.1|
|styled-components|0.1.0|
|axios|0.25.0|
|bootstrap|5.1.3|
|react-bootstrap|2.1.2
|change-case|4.1.2|
|react-table|7.7.0|

### Back-end

#### Ruby on Rails

- **Rails version:** 6.1.4.4
- **Ruby version:** 2.7.4

##### Key Rails Dependencies
|Dependency|Version|
|---|---|
|devise|4.8.1|
|devise-jwt|0.9.0|
|aws-sdk-s3|1.111.3|
|rack-cors|1.1|
|brakeman|5.2|
|bundle-audit|0.1.0|
|database_cleaner|2.0|
|factory_bot|6.2|
|faker|2.19|
|rspec|5.1|
|rubocop|1.25|
|active_model_serializers||
|cancancan|3.3|


## User Testing

User testing is documented in the [User Testing Spreadsheet](https://docs.google.com/spreadsheets/d/1s3-LPndBm64y04VEfctXHCvG2uDPyusrkV6-mnXbwiQ/edit?usp=sharing)

### Development

At various stages of development, subsections of functionality were able to be tested by family and friends with access to locally hosted apps running in development mode.

### Production

After the bulk of work was done and the site was deployed to production with only minor changes envisaged, family and friends were asked to conduct some user acceptance testing.  A few bugs were actually found in these stages and were able to be caught and fixed.

## Project Managment and Task Delegation Methodologies

For our planning methodology, we have adopted an agile approach, with task management achieved through Kanban, implemented on the Trello platform.

As we are a team of two, we are able to emphasise flexibility as a smaller team is easier to manage. The two of us are in constant communication, and continually review and revise every aspect of the project, both on a macro level (features, design, vision), and also on a micro level (implementation details).

We have daily meetings that at the very least review our progress for the day, any blockers, and what we plan to do next. These meetings cover the status of each ongoing task, and usually include more general planning and discussion elements as well.

Every task that comes to mind that might need doing goes into the ‘Backlog’ column of our Kanban board on Trello. At the Backlog stage, additional details surrounding due dates, team member allocation and complexity are (unless obvious) not included. This stage is simply to ensure that a given task is not neglected down the track. It is important to note that a given task may or may not actually get done - wishlist features for example also go into the Backlog column.

From the Backlog column, we move any tasks that need doing as a priority to the ‘To Do’ column. It is at this stage that supplementary details are added including those mentioned above, and checklists. The task's complexity is assigned to be one of the Fibonacci numbers to facilitate easier estimation (frequently used in Agile - see <https://www.lucidchart.com/blog/fibonacci-scale-for-agile-estimation> for more detail). If a task’s complexity estimate is deemed to be ‘too large’ (this is a flexible definition depending on many factors, but usually not above a 5 or an 8) then this card is broken down into smaller tasks.

Once we are working on a task, it moves to the ‘Doing’ column. Each person only has 1-2 tasks in progress at a time - in line with general Kanban principles - which aims to increase the rate of ‘flow’ (the speed with which tasks get done). Having a set task limit helps because in addition to our individual tasks, we need to review the other team member’s work.

In using this however, we found that on occasion, a task was not able to progress through to completion because of some other prerequisite that needed doing. Because of this, we later added a 'Blocked' column, to hold any tasks that have been started, need further work, and cannot be worked on right now. This had the added benefit of really being able to limit our 'Doing' tasks to 1 per person most of the time.

Items are moved to the ‘Code Review’ column, when they are completed by the assignee, and need to be reviewed and approved by the team member (i.e. when the pull request has been made). If significant reworks are required, another card may be added at this stage with details of the changes. For minor amendments, these are made immediately, and only then do the cards move on to the next phase.

The ‘Test’ column is for code that has been written and reviewed, but needs to have testing implemented.

Once reviewed (and if relevant, tested), cards are moved to the ‘Complete’ column.

We have decided to use branching rather than forking to manage our repositories collaboratively. We considered using forking, however this was discounted as for a team of two working closely, and in constant communication it was deemed to not provide any additional features that are useful to us in this context. The main benefit of forking as we see it is that the main repository has a single person/administrator having final say / control over what code is included/merged in. For us this is clearly unnecessary as the people contributing to the project is necessarily limited to just us 2, and so we do not need to further control who can submit PRs and merge. In addition, forking would mean managing 2 copies of each repository which is more work, and would require branches to develop features anyway, so also does not save time in any aspect either.

We also are required by the assignment specifications to keep branch history intact (i.e. we cannot delete branches). Therefore, we have decided to make a new branch for each edit (even if it is related to the same task/feature), e.g. wireframes/edit_1, wireframes/edit_2 etc. so as to avoid merge conflicts.

Our end to end process therefore, is as follows:

- Create a new, uniquely named branch to work on a new feature, or even a new edit of an existing branch (e.g. each time we edit the readme is a new, distinct branch 'readme/edit_1', 'readme/edit_2' etc.)
- Work, commit, push
- Pull request to merge into main
- Other team member checks the work, and if approved, merges the pull request into main
- Repeat
