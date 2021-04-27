# Feature_Design_Plan



# **Feature Plan**

Through contrastive analysis with the bad and good website example, it’s familiar a developed site should conform to the usual user navigation structure that often encounter from other sites. This way could make our website more familiar and intuitive to interact with. Similarly to most of the common website structure, the home page should contain several basic buttons, such as login and sign up. In addition, according to the requirements form the task, a searching capability is necessary for check-in; allowing user to check-in their locations by entering the check-in code. An app QR code is required in the website for user to download the app, as well a map to get the information of hot-spot area and time-frame. To improve user experience, a hamburger button and back to top button should be included into the design.

Considering to different user levels, the capabilities should be separated depending on different users. A backstage management system should be opened as a new windows to allow admins access only.

## **Main page (Home.vue/index.html):**

- Header bar

  - Logo (left-top)

  - Sign up button (right)

    - Different buttons for user, venue and admin.

    - Be able to sign up with social media/email account (Facebook, Google etc).

  - Loginbutton (right)

    - Different access for user, venue and admin.

    - Be able to login with social media/email account (Facebook, Google etc).

- Search bars

  - Provide searching capabilities based on the area or postcode input.

  - Enter check-in code to record currently location.

  - View check-in history.

- Map
  - Show currently hot-spot area and time-frame.

- App QR code
  - For user to download the app(floating style).

- Footer
  - Fake company contact details like phone number, email address, etc.

## **Search page:**

- Search bar

  - Similar to the main page.

  - Initially shows search query from first page.

- Search filters

  - Time/date

  - Address/distance

  - Venue name

- List of results

  - Each result shows:

    - User name

    - Time/date

    - Venue name

## **Backstage page (Admin):**

- Header bar
  - Sign up button for other Health Officials

- Way to manage venue information and check their check in history
  - Give permission to the venue QR code requirements.

- Way to manage user information and check their check in history
  - Enter user id and venue id to check.

- Way to send warning or notification to users and venue

- Map
  - View and modify currently hot-spot area and manage time-frame.

# **Integration of Feature into Website**

Information below is about how each feature will implement based on the user interaction in reference to the page/site.

## **Sign Up / Log In**

- Clicking on the button located in the top right of the web page will pop up with a login page for users or venues. For admins, there will be a button to direct to the backstage login page.

- Provide a registration system within the same style of login pop up box, it allows users or venues without accounts to sign up a name, id, passwords and email address, etc.

## **Search / Filters**

- Enter the check-in code, the users can check-in with the current location.

- Another search capability can also view the check-in history, by entering check-in code or through the filter.

- Further filters can be accessed after the initial search, based on id, date, location, etc.

## **Map**

- Based on the check-in location that is entered, the hot-spot area and time-frame will show up for user and venue to see if they are in the hot-spot area or not.

- As admins, they can modify the hot-spot area and time-frame by entering or sorting the location.

## **Language Selection**

- Located in footer, arrangement of flags or drop down button with various languages to translate the page for language barrier.

## **Link Social Media**

- In the login pop up, there is social media or google login to link the account for easier login.

## **Navigation Bar / Hamburger buttons**

- Hamburger button positioned in the header to list each div in the page, clicking on the respective navigation will direct the user to that part, allowing users to quickly reach where they wanna access.

- Positioned in the footer, there is a back to top bar, clicking on it can directly back to the top of the page.

## **Contact Info / Form**

- Located in the footer, including the contact details of the company or submit feedback by typing the message in the box and sending through email by clicking the submit button.







## **Site Design**

![img](https://minio.llycloud.com/image/uPic/image-20210428kloEc2.jpg)

![img](https://minio.llycloud.com/image/uPic/image-20210428fI7CSL.jpg)

![img](https://minio.llycloud.com/image/uPic/image-20210428YABZFI.png)

![img](https://minio.llycloud.com/image/uPic/image-20210428eAlLJC.jpg)

![img](https://minio.llycloud.com/image/uPic/image-20210428AvmkCV.jpg)

Mobile:

![img](https://minio.llycloud.com/image/uPic/image-20210428lQF1XR.png)

![img](https://minio.llycloud.com/image/uPic/image-20210428VtQyd6.png)

Backstage page:

![img](https://minio.llycloud.com/image/uPic/image-202104286FEsJn.png)