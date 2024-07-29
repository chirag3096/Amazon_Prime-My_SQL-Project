Drop Database if exists Amazon_Prime;
Create Database Amazon_Prime;
Use Amazon_Prime;

Drop table if exists Amazon_Prime_users;
CREATE TABLE Amazon_Prime_users (
    User_ID INT,
    Name VARCHAR(100),
    Email_Address VARCHAR(100),
    Username VARCHAR(100),
    Date_of_Birth DATE,
    Gender VARCHAR(25),
    Location VARCHAR(100),
    Membership_Start_Date DATE,
    Membership_End_Date DATE,
    Subscription_Plan VARCHAR(100),
    Payment_Information VARCHAR(100),
    Renewal_Status VARCHAR(100),
    Usage_Frequency VARCHAR(100),
    Purchase_History VARCHAR(100),
    Favorite_Genres VARCHAR(100),
    Devices_Used VARCHAR(100),
    Engagement_Metrics VARCHAR(100),
    Feedback_Ratings INT,
    Customer_Support_Interactions INT
);

SELECT * FROM amazon_prime_users;


## Retrieve the Name and Email address of all users
Select Name,Email_Address from amazon_prime_users;

## Find the number of users by gender
Select Gender,count(User_ID) AS Number_of_Users from amazon_prime_users
group by Gender
Order by Number_of_Users
;

## Get the username and membership start date of users
Select Username,Membership_Start_Date from amazon_prime_users;

## Count the number of users from a specific location
Select Location,count(User_ID) from amazon_prime_users
where Location = "Michaeltown";

## list the subscription plan along with count of users subscribed to each plan
Select Subscription_Plan,count(User_ID) AS Number_of_Subscribed from amazon_prime_users
group by Subscription_Plan
order by Number_of_Subscribed;

## Find the usernames and their corresponding payment information 
Select Username, Payment_Information from amazon_prime_users;

## Identify the renewal status of each user subscription
Select Username,Renewal_Status,Subscription_Plan from amazon_prime_users;

## Calculate the average usage frequency of all users
Select Username,Usage_Frequency from amazon_prime_users;

Select Usage_Frequency,count(Usage_Frequency) AS Number_Users from amazon_prime_users
group by Usage_Frequency;

## Determine the number of users with a specific purchase history
Select Purchase_History,count(User_ID) AS Number_Users from amazon_prime_users
group by Purchase_History 
order by Number_Users desc;

## list the favortive genres of users along with count of users for each genre
Select Favorite_Genres, Count(User_ID) AS Number_Users from amazon_prime_users
group by Favorite_Genres;

## Retrieve the distinct devices used by users
Select distinct(Devices_Used) from amazon_prime_users;

## Get the engagement metrics for users who gave feedback or rating
Select Username,Engagement_Metrics from amazon_prime_users
where Feedback_Ratings is Not Null;

## Get the username and membership End date of users between 1-12-2024 to 1-4-2025
Select Username,Membership_End_Date from amazon_prime_users
where Membership_End_Date between '2025-1-1' and '2025-5-14';

## Find the username of user who had customer support interactions
Select Username,Customer_Support_Interactions from amazon_prime_users
where Customer_Support_Interactions >= "1"
order by Customer_Support_Interactions;

## List the user who have used a specific device
Select Username,Devices_Used from amazon_prime_users 
where Devices_Used = "Smartphone";

## Calculate the total feedback given by users
select count(User_ID) from amazon_prime_users
where Feedback_Ratings is not null;

Select sum(Feedback_Ratings) from amazon_prime_users;

## Find username of users who have not made any purchase
Select Username,Purchase_History from amazon_prime_users
where Purchase_History is null;

## Identify the most frequently used device among users
Select max(Devices_Used) from amazon_prime_users;

## List the username and their corresponding locations for users who are highly engaged
Select Username,Location from amazon_prime_users 
where Engagement_Metrics = "High";