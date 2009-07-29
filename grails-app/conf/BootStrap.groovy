class BootStrap {

     def init = { servletContext ->
     	new User(nick:"Alek",email:"apena@wp.pl",password:"password").save()
     }
     def destroy = {
     }
} 
