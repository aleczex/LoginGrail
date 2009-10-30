class LoggingFilters {
	static filters = {
		all(controller:"*", action:"*") {
			before = {
				log.debug "Parameters: ${params.inspect()}"
			}
			after = { model ->
				log.debug "Model: ${model?.inspect()}"
			}
		}
	}
}