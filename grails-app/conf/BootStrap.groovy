class BootStrap {

     def init = { servletContext ->
     	new User(email:"apena@wp.pl",password:"password").save()
     }
     def destroy = {
     }
} 
