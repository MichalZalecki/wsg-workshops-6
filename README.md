# WSG Workshops App

App created at WSG workshops meetings. This code base presents result app after meeting at 25.06.2015.

## Fork

Please fork this project to your own Github account.

## Setup

Create `.env` file in the root directory. Add valid `GITHUB_APP_ID` and `GITHUB_APP_SECRET` for OmniAuth. 

### Initial setup
```
bundle
bundle exec rake db:setup
```

### Run the server
```
rails s
```
Application is available at `localhost:3000/`
