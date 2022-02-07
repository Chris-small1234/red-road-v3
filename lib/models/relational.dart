class RelationalModel {
  static String question1 =
      'In the last month, have you felt easily frusterated from school or work?';
  static String question2 =
      'In the last month, have you felt easily angered by events or people?';
  static String question3 =
      'In the last month, have you felt hurt by memories of your past?';
  static String question4 = 'I often feel responsible for how others feel';
  static String question5 = 'When someone citicizes me, I feel bad';
  static String question6 =
      'I don\u0027t share how I feel in case it hurts someone';

  static double sliderValue1 = 50;
  static double sliderValue2 = 50;
  static double sliderValue3 = 50;
  static double sliderValue4 = 50;
  static double sliderValue5 = 50;
  static double sliderValue6 = 50;
  static double sliderValue7 = 50;
  static double sliderValue8 = 50;
  static double sliderValue9 = 50;
  static double sliderValue10 = 50;
  static double sliderValue11 = 50;

  static void getSliderValues(var sliderValues) {
    for (var i; i <= sliderValues.length; i++) {
      sliderValues[i] = 50;
    }
    return sliderValues;
  }

  static String sliderStrings = 'Always - Often - Sometimes - Rarely - Never';
}
