# Calorie Tracker App

Web based Calorie Tracker application using Angular, ASP.NET Core Web API &amp; Entity Framework Core

## Angular Application

### Environment Setup

```
npm install
ng serve
```

### Functionality
- JWT Authentication Flow for User Login and invite a friend (register)
- Project Structure with AuthGuard, HttpInterceptor, Router

### Pages
- Regular User
    - Login
    - My Food Entry
    - Invite a Friend
- Admin User
    - Manage Food Entry (All user data)
    - Report Summary




## Calorie Tracker API

ASP.NET Core Web API with Entity Framework Core


### Database Migration 

- Open Package Manager Console
- Select Project QuizEngine.Repo

Run following commands on Package Manager Console

- `Add-Migration IdentityMigration`
- `Update-Database`



### Controllers

**Auth**
- POST `api/auth/login` for User Login
- POST `api/auth/register` for User Registration

**FoodEntries**

Regular user endpoints
- GET `/api/foodEntries` for all food entry records of logged in user
- GET `/api/foodEntries/{id}` for a sepecific food entry
- POST `/api/foodEntries` for creating food entry record
- PUT `/api/foodEntries/{id}` for updating a record
- DELETE `/api/foodEntries/{id}` for deleting a record

Admin user ednpoints
- GET `/api/foodEntries/GetAllUsersData` for admin to get all users data
- GET `/api/foodEntries/GetReportSummary` for admin to get report summary data


