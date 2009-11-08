class SecurityFilters {
	def filters = {
		// Ensure that all controllers and actions require an authenticated user,
		// except for the "public" controller
		//		auth(controller: "*", action: "*") {
		//			before = {
		//				 Exclude the "public" controller.
		//				if (controllerName == "public") return true
		//				
		//				 This just means that the user must be authenticated. He does 
		//				 not need any particular role or permission. 
		//				accessControl { true }
		//			}
		//		}
		
		

		visitorChange(controller: "comment", action: "(list|show|edit|update|delete)") { 
            before = { 
                accessControl { 
                    role("Administrator") || role ("User")
                }
            }
        }

		userChange(controller: "investment|folder|picture|news", action: "(create|edit|save|update|delete)") { 
			before = { 
				accessControl { 
					role("Administrator") || role ("User")
				}
			}
		}
		
		
		adminChange(controller: "auth|users", action: "(list|show|create|edit|save|update|delete)") {
			before = { 
        		accessControl { 
                	role("Administrator")
            	}
        	}
		}
	}
}