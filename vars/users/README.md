#Handling users
The folder user_keys, should contain the ssh keys of the users defined in user_passwords.yml. 
There should be one folder per user, the public key for userA should be called userA/id_rsa.pub, and the private key userA/id_rsa

user_passwords.yml now contains dummy passwords which should not be used in production!! (alex:alex, matthieu:matthieu)
The content of user_keys have already been excludes from git of course.

      #Passwords can be generated using:
      #mkpasswd --method=sha-512
      #Resulting line should look like this:
      #username: '$6$LLzRkpZJM1b$CvFO*******************************************************************9uYUB0gHHgZQfc/'
