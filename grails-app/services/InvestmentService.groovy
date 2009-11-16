class InvestmentService { 

	   def hasRightToInvestment(investmentInstance) {
		   def permission = Permissions.findByType("org.jsecurity.authz.permission.WildcardPermission")
	       def subject = org.jsecurity.SecurityUtils.getSubject()
	       if(investmentInstance && subject && subject.principal) {
	           def isPermitted = subject.isPermitted(new org.jsecurity.authz.permission.WildcardPermission("investment:list:"+investmentInstance.id))
	           return isPermitted
	       }
	       return false
	    }

}