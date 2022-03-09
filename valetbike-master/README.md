# ValetBike

Smith College CSC223: Software Engineering\
Starter App for ValetBike project

## Environment Configuration
Follow the general steps in the next section to set up your local development environment from scratch. It is essential that you **consult a more detailed guide** that corresponds to your specific type of development machine. Use one of the guides listed below to help you complete the steps for setting up ValetBike on your machine.

* [Install Ruby on Mac (Intel and M1)](https://mac.install.guide/ruby/index.html)
* [Install Ruby on Mac (M1 additional details)](https://github.com/deadroxy/valetbike/blob/master/notes/dev-enviro.md)
* [Install Ruby on Windows 10](https://gorails.com/setup/windows/10)

On Mac it is strongly recommended that you use asdf to install Ruby. On Windows you should set up your environment through the Windows Subsystem for Linux (WSL). The guides above explain how to do so in detail.

## General Configuration Steps

As you configure your environment you should **keep a log** where you **write down all the steps you take** and each command you type. You will inevitably run into errors setting up your development environment and maintaining a meticulous log will allow others to help you troubleshoot. 
 
**1. Fork & clone ValetBike repo**
* Click fork in the upper right hand corner of the ValetBike GitHub page
* Then create a local copy of your fork with:
* `git clone https://github.com/<username>/valetbike.git`

**2. Install MySQL 8**
* Download: https://dev.mysql.com/downloads/mysql
* Be sure to select the version that corresponds to your operating system (Intel Mac = x86, M1 Mac = ARM)
* Choose "Use Legacy Password Encryption" when installing
* Make note of the password you set for the root user
* After install make sure you add `/usr/local/mysql/bin` (or equivalent) to your path

**3. Install Ruby 3.0.2**
* Consult one of the guides linked in the previous section
* Use [asdf](https://asdf-vm.com/guide/getting-started.html) on Mac/Linux systems
* Use the [WSL](https://docs.microsoft.com/en-us/windows/wsl) on Windows systems
* Make sure you are using Ruby 3.02 before proceeding:
  * `cd valetbike` then `ruby -v` to check your version

**4. Install essential gems**
* Disable gem docs:
  * `echo "gem: --no-document" >> ~/.gemrc`
* Install Rails 6.1.4:
  * `gem install rails --version 6.1.4`
* Install MySQL gem:
  * `gem install mysql2`
  * Use the `-- --with-opt-dir="$(brew --prefix openssl@1.1)"` flag on M1 Macs
* Install required gems:
  * `bundle install`

**5. Configure database environment variables**
* Add a file called `.env` to your app's root directory
* Ensure that it includes the credentials you setup when installing MySQL:

```shell
MYSQL_USERNAME=root
MYSQL_PASSWORD=YOURPASSWORD
MYSQL_SOCKET=/tmp/mysql.sock              # For Mac
MYSQL_SOCKET=/var/run/mysqld/mysqld.sock  # For Windows
```

**6. Prepare database in MySQL**
* Run either `rake db:create`
* Or `mysql -u root -p` and `CREATE DATABASE valetbike_development;`

**7. Run database migrations**
* `rake db:migrate`

**8. Confirm app runs**
* Launch web server using `rackup` or `rails s`
* If using `rackup` open http://localhost:9292 (or http://127.0.0.1:9292) in a browser
* If using `rails s` open http://localhost:3000 (or http://127.0.0.1:3000) in a browser
* You should see ValetBike welcome page
  

## Assignment #1: Hello Stack, Welcome to ValetBike!

### Brief Background
You and several other junior engineers have just started at ValetBike, a community tech co-op based in Nipmuc Notch, and you are excited to finally be getting paid to contribute to a meaningful app. During your hiring interview, you said you were comfortable doing full stack programming, but stressed you hadn't worked in Ruby on Rails before. The lead developer thought you were right for the position and promised you a guided tour of the codebase on your first day. However, after your onboarding, you learn they've just gone on leave indefinitely. It also turns out the lead developer was the *only* developer at ValetBike, and now the rest of the team is counting on you and the other new programmers to complete the prototype before the scheduled launch day.

As a fearless software engineer you agree to onboard yourself and attempt to continue the build. You didn't get much information about the architecture or design of the product during your interview. All you remember is that the lead developer had been working with the [ValleyBike](https://valleybike.org) team to iterate on their system which launched in 2018 and that they were using GitHub to collaborate on their codebase.

### Assignment Goal
Your primary objective is to get your development environment configured so that the existing app will run on your machine. To exceed expectations, you must add at least one feature to the current code. To distinguish yourself, you should add two or more features. See submission guidelines below for complete details.

### How to Begin
* Create a GitHub account if you don't have one
* Go to [https://github.com/deadroxy/valetbike](https://github.com/deadroxy/valetbike)
* Follow the README instructions to configure your environment

### Teamwork Guidelines
You may work in teams of up to five people to get your environments set up and to modify the code. But you must each submit your own unique environment screenshots via Moodle. If you choose to fork the repo to add features, you can collaborate on the code, but you must each create and submit a record of a unique pull request.

### Ruby on Rails Guides
You will probably be unfamiliar with the main components of the ValetBike stack like the language (Ruby), the framework (Rails), and the database (MySQL). Luckily the lead developer left links to their favorite books and tutorials for you below. Consult them regularly as you get your bearings in the new environment.

* [Getting Started with Rails](https://guides.rubyonrails.org/getting_started.html)
* [I Love Ruby](https://i-love-ruby.gitlab.io/)
* [The Bastards Book of Ruby](http://ruby.bastardsbook.com/)
* [Why's (Poignant) Guide to Ruby](https://poignant.guide/)

### Exploration Tips
* Review the files the lead developer left in the `notes/` folder
* Use GitHub to dive into previous commits to see what they built so far
* Use `rails console` to experiment with creating station & bike records from the command line
  - `s = Station.new(name: "Neu Station", address: "123 Novel Lane", identifier: "45")`
  - `s.save`
  - `b = Bike.new(identifier: "1234")`
  - `b.current_station = s`
  - `b.save`
  - `s.docked_bikes`
  - `s.docked_bikes.count`

### Submission Guidelines to Meet Expectations
1. Get ValetBike running on your development machine
2. Modify the welcome message
3. Take a screenshot showing your change works (include browser, console, date/time)
4. Name the screenshot "youremail-a1-ss.png" or *.jpg (for me it would be "jbrewer-a1-ss.png")
5. Create a text file called "youremail-a1-team.txt" (for me it would be "jbrewer-a1-team.txt")
6. List the names of everyone you worked with on this assignment, including your own (for me it would be "Johanna Brewer")
7. Submit your screenshot and team list via Moodle

### Submission Guidelines to Exceed Expectations or Distinguish yourself
1. Complete all of the Meets Expectations tasks
2. Implement one (Exceeds) or more (Distinguished) of the features below
   - Show number of docked bikes at each station
   - Create rake task to import station & bike data from csv files
   - Allow user to view list of bikes
   - Allow user to switch between station and bike list views
   - Allow user to reverse sort order of stations or bikes in list view
3. Commit and push your changes to your fork on GitHub
4. Create a pull request from your modified fork to the main ValetBike repo
5. Create a file called "youremail-a1-pr.txt" (for me it would be "jbrewer-a1-pr.txt")
6. Include a complete link to your pull request as the first line of this file (e.g. "https://github.com/deadroxy/valetbike/pull/1234")
7. Submit your pull request file along with your screenshot and team list via Moodle
