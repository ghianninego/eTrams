package eTrams.utilities.beanUtilities;

import java.sql.Connection;

public interface BeanInterface {
	// used as an interface to be implemented for Factory Design Pattern
	
	public void getBeanType();
	public int storeToDatabase(Connection connection);
}
