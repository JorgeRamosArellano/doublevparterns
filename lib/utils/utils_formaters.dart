abstract class UtilsFormaters {

  static String _monthName(int month) {
    const months = {
      1: "Enero",
      2: "Febrero",
      3: "Marzo",
      4: "Abril",
      5: "Mayo",
      6: "Junio",
      7: "Julio",
      8: "Agosto",
      9: "Septiembre",
      10: "Octubre",
      11: "Noviembre",
      12: "Diciembre",
    };
    return months[month] ?? "Mes inválido";
  }

  static String getDateFormatterByString(String stringDate){
    final dateSelected = DateTime.parse(stringDate);
    return '${dateSelected.day} de ${_monthName(dateSelected.month)} del ${dateSelected.year}';
  }

}