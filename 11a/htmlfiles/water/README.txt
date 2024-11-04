This application is used to manage the top-level web page
for the water-type pokemon.  Users can add more web pages
using the submission form at the bottom of the page.
Users can visit the web pages using the links at the top
of the page.

To install the application follow these instructions:

1- Move the water directory to the correct location for your
   web site.

2- Create a database, and database user for the application.

3- Edit water/config.php.  Replace the text DB_HOST_ADDRESS,
   DB_USER_NAME, DB_USER_PASSWD, and DB_DATABASE with the
   appropriate values from step 2.

4- From a web browser, load the file water/install.php.
   If the file loads correctly, it will display a success
   message with a blue background.

   If it loads correctly, remove the file.  If not, look
   in the apache error log file, to find and fix your errors.
   Then try again.

5- Assign the correct permissions and ownership for the
   water directory and everything inside of it, so that
   the web administrator has appropriate access.
      
6- Test by browsing the site, following links, and inserting
   more links.

