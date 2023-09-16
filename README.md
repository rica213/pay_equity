<a name="readme-top"></a>

<div align="center">
  <h1><b> 💸 PAY EQUITY 💸 </b></h1>
</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [💰 PAY EQUITY ](#-pay-equity-)
- [🛠 Built With ](#-built-with-)
  - [📌 Tech Stack ](#-tech-stack-)
- [🗝 Key Features ](#-key-features-)
- [💻 Getting Started ](#-getting-started-)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Usage](#usage)
  - [Run tests](#run-tests)
- [🔭 Future Features ](#-future-features-)
- [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 💰 PAY EQUITY <a name="pay-equity"></a>

### _Project for International Equal Pay Day-themed hackathon organized by [TechTogether](https://techtogether-online-19093.devpost.com/)_

**PAY EQUITY** is a web application that empowers individuals to track and compare their salaries and benefits with others in their industry, location, and experience level **anonymously**. <br>
This tool will help marginalized genders assess whether they are being paid fairly, and if not, provide resources and support to address pay disparities. <br> 


# 🛠 Built With <a name="built-with"></a>

## 📌 Tech Stack <a name="tech-stack"></a>

| Domain | Tech Stack |
|--------|--------|
| Server | <a href="https://rubyonrails.org/">Ruby on Rails</a> |
| Database | <a href="https://www.postgresql.org/">PostgreSQL</a> |
| Testing Framework | <a href="https://github.com/rspec/rspec-rails">RSpec Rails</a> |
| Authentification | <a href="https://github.com/heartcombo/devise#getting-started">Devise, JWT</a> |

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<!-- Features -->

# 🗝 Key Features <a name="key-features"></a>

- Create a new salary record associated with the current user
- Allow a user to retrieve their own salary data
- Allow a user to update their salary and benefits data for a specific salary
- Allow a user to delete a specific salary entry
- Allow users to search for salary data based on different criteria
- Allow users to compare their salary data with aggregated data for specific criteria

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<!-- GETTING STARTED -->

# 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

## Prerequisites

In order to run this project you need:

- **Ruby 3.2.2** installed

- **Rails** installed

-  **PostgreSQL**

Run this command to install **Rails**

```sh
 gem install rails
```
## Setup

Clone this repository to your desired folder:

```sh
  cd my-folder
  git clone git@github.com:rica213/pay_equity.git
```

To install dependencies, run:

```sh
bundle install
```

A **secret_key_base** is required to run the Devise

Run this command in the bash terminal to generate it:

```sh
EDITOR="mate --wait" bin/rails credentials:edit
```

**Set up the database** <br>

A _database.yml_ file is required to use database

Here are the steps to be followed to create one

1- Copy the file **database_sample.yml** located in the directory **_pay-equity/config_** <br>
2- Rename your copy of **database_sample.yml** into **database.yml** <br>
3- Make necessary configuration following the instructions provided in the file according to your database configuration

To create the database, run:

```sh
rails db:create
```
To create the schema, run:

```sh
rails db:migrate
```

## Usage

To run the project, execute the following command:

Example command:

```sh
  rails server
```

## Run tests

To run tests, run the following command:

```sh
  bundle exec rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

# 🔭 Future Features <a name="future-features"></a>

  - Create a forum or discussion board where users can share their experiences and strategies for achieving pay equity.
  - Emphasize strong data encryption and privacy measures to ensure that users feel safe sharing their salary information.
  - Allow users to provide feedback on their experiences with pay equity efforts and suggest improvements for the platform.
  - Provide resources and articles on negotiating salaries, recognizing pay discrimination, and taking action to address pay disparities.
  
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

# 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
