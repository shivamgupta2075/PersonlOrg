public class WrapperClass {

	public class Rates {
		public Integer USD {get;set;} 
		public Double SGD {get;set;} 
		public Double NZD {get;set;} 
		public Double JPY {get;set;} 
		public Double ISK {get;set;} 
		public Double GBP {get;set;} 
		public Double EUR {get;set;} 
		public Double AUD {get;set;} 
		public Double CAD {get;set;} 
		public Double CHF {get;set;} 

		public Rates(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'USD') {
							USD = parser.getIntegerValue();
						} else if (text == 'SGD') {
							SGD = parser.getDoubleValue();
						} else if (text == 'NZD') {
							NZD = parser.getDoubleValue();
						} else if (text == 'JPY') {
							JPY = parser.getDoubleValue();
						} else if (text == 'ISK') {
							ISK = parser.getDoubleValue();
						} else if (text == 'GBP') {
							GBP = parser.getDoubleValue();
						} else if (text == 'EUR') {
							EUR = parser.getDoubleValue();
						} else if (text == 'AUD') {
							AUD = parser.getDoubleValue();
						} else if (text == 'CAD') {
							CAD = parser.getDoubleValue();
						} else if (text == 'CHF') {
							CHF = parser.getDoubleValue();
						} else {
							System.debug(LoggingLevel.WARN, 'Rates consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public Boolean success {get;set;} 
	public Integer timestamp {get;set;} 
	public String base {get;set;} 
	public String date_Z {get;set;} // in json: date
	public Rates rates {get;set;} 

	public WrapperClass(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'success') {
						success = parser.getBooleanValue();
					} else if (text == 'timestamp') {
						timestamp = parser.getIntegerValue();
					} else if (text == 'base') {
						base = parser.getText();
					} else if (text == 'date') {
						date_Z = parser.getText();
					} else if (text == 'rates') {
						rates = new Rates(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'WrapperClass consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	
	public static WrapperClass parse(String json) {
		//System.JSONParser parser = System.JSON.createParser(json);
		//return new WrapperClass(parser);
		return (WrapperClass) System.JSON.deserialize(json, WrapperClass.class);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
}