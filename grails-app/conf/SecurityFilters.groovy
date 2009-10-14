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
		
		// Creating, modifying, or deleting a book requires the "Administrator" 
		// role. 
//		investmentEdit(controller: "Investment", action: "(create|edit|save|update|delete)") { 
//			before = { 
//				accessControl { 
//					role("Administrator") || role ("User")
//				}
//			}
//		}
//		investmentList(controller: "Investment", action: "(index|list)") { 
//			before = { 
//				accessControl {false} 
//			}
//		}
	}
}