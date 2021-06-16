@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String inputCountry = 'United States';
        String[] result = ParkLocator.country(inputCountry);
        // Verify that a fake result is returned
        String[] mockResult = new String[]{'a','b','c'};
        System.assertEquals(mockResult, result); 
        System.debug('ParkLocatorTest result: ' + result);
        System.debug('ParkLocatorTest mockResult: ' + mockResult);
    }
}