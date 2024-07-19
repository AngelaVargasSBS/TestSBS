package com.sbs.prueba.util;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sbs.prueba.controller.dto.General.GetResultDTO;
import com.sbs.prueba.controller.dto.StatusDTO;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpStatus;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.*;
import java.time.format.DateTimeParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.sbs.prueba.util.Constants.*;
import static io.vavr.API.Option;

public final class Utils {

    public static final String DATE_FORMAT = "dd/MM/yyyy";
    public static final DateTimeFormatter formatter = DateTimeFormat.forPattern(DATE_FORMAT);
    public static final DateFormat dateFormatter = new SimpleDateFormat(DATE_FORMAT);
    public static final java.time.format.DateTimeFormatter dataBaseDateFormatter = java.time.format.DateTimeFormatter.ofPattern(DATE_FORMAT);

    private static final Integer DEFAULT_INTEGER_VALUE = 0;
    private static final Long DEFAULT_LONG_VALUE = 0L;
    private static final Double DEFAULT_DOUBLE_VALUE = 0.0;
    public static final String zeroRegexFormatter = "%,.0f";

    private static final String DATE_FORMAT_ERROR = "Error formatting date";

    public static final Integer CODE_TYPE_PAYMENT = 3;

    public static final Integer RISK_NUMBER_MAIN_INSURED = 1;

    public static final Integer ANNIVERSARY_AFTER_TARIFIED = 1;

    public static final String EMAIL_REGEX = "^(.+)@(\\S+)$";

    public static final String NUMBER_MAX  = "^[1-9][0-9]{0,2}$";

    public static String convertToString(Date date) {
        return Option(date).map(d -> new DateTime(d)).map(dateTime -> dateTime.toString(formatter)).getOrElse(StringUtils.EMPTY);
    }

    public static Integer defaultValueInteger(Integer value) {
        return Option(value).getOrElse(DEFAULT_INTEGER_VALUE);
    }

    public static Long defaultValueLong(Long value) {
        return Option(value).getOrElse(DEFAULT_LONG_VALUE);
    }

    public static Double defaultValueDouble(Double value) {
        return Option(value).getOrElse(DEFAULT_DOUBLE_VALUE);
    }

    public static Date calculateDate(Date date, Integer value, String measure ) {
        measure = measure.toLowerCase();
        DateTime dateTime = new DateTime(date);
        if (YEARS_WITHOUT.equals(measure) || YEARS.equals(measure)) {
            return dateTime.plusYears(value).toDate();
        } else if (MONTHS.equals(measure)) {
            return dateTime.plusMonths(value).toDate();
        } else if (DAYS.equals(measure) || DAYS_ACCENT_MARK.equals(measure)) {
            return dateTime.plusDays(value).toDate();
        } else {
            return date;
        }
    }

    public static String getStackTrace(Throwable ex) {
        StringBuffer sb = new StringBuffer(5000);
        StackTraceElement[] st = ex.getStackTrace();
        sb.append(ex.getClass().getName() + ": " + ex.getMessage() + "\n");
        for (int i = 0; i < st.length; i++) {
            sb.append("\t at " + st[i].toString() + "\n");
        }
        return sb.toString();
    }

    public static Date stringToDate(String date,String formatter ) {
        DateFormat dateFormatter = new SimpleDateFormat(formatter);
        try {
            if(!date.isEmpty()){
                return  dateFormatter.parse( date  );
            }else{
                return null;
            }
        } catch (ParseException parEx) {
            throw new IllegalArgumentException(DATE_FORMAT_ERROR, parEx);
        }
    }

    public static String dateToString(Date date, String formatter) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat(formatter);
            return dateFormat.format(date);
        } catch (Exception var3) {
            var3.printStackTrace();
            return null;
        }
    }

    public static Date stringToDateOrNull(String date ) {
        return Option(date).map(d -> {
            try {
                return formatter.parseDateTime(date).toDate();
            } catch (Exception e) {
                return null;
            }
        }).getOrNull();
    }


    public static LocalDate stringToLocalDateOrNull(String date) {
        return Option(date).map(d -> {
            try {
                return LocalDate.parse(date, dataBaseDateFormatter);
            } catch (Exception e) {
                return null;
            }
        }).getOrNull();
    }

    public static Date sumDaysToDate(Date date, int days){
        return sumTime(Calendar.DAY_OF_YEAR, date, days);
    }
    public static Date sumTime(int constantCalendar, Date date, int number){
        if (number==0) return date;
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(constantCalendar, number);
        return calendar.getTime();
    }
    public static int calculateMonthsQuantityBetweenDates(Date fechaInicio, Date fechaFin) {
        try {
            //Fecha inicio en objeto Calendar
            Calendar startCalendar = Calendar.getInstance();
            startCalendar.setTime(fechaInicio);
            //Fecha finalización en objeto Calendar
            Calendar endCalendar = Calendar.getInstance();
            endCalendar.setTime(fechaFin);
            //Cálculo de meses para las fechas de inicio y finalización
            int startMes = (startCalendar.get(Calendar.YEAR) * 12) + startCalendar.get(Calendar.MONTH);
            int endMes = (endCalendar.get(Calendar.YEAR) * 12) + endCalendar.get(Calendar.MONTH);
            //Diferencia en meses entre las dos fechas
            int diffMonth = endMes - startMes;
            return diffMonth;
        } catch (Exception e) {
            return 0;
        }
    }
    public static boolean isEmailFormat(String email) {
        return patternMatches(email, EMAIL_REGEX);
    }
    public static boolean patternMatches(String stringToEvaluate, String regexPattern) {
        return Pattern.compile(regexPattern)
                .matcher(stringToEvaluate)
                .matches();
    }
    public static Date parseDate(String date, String format) {
        try {
            return new SimpleDateFormat(format).parse(date);
        } catch (ParseException e) {
            return null;
        }
    }
    public static String getFormatDate(Date date, String format) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(date);
    }

    public static Date getCurrentDateWithTimeZone(String timeZone) {
        try {
            Date date = new Date();
            DateFormat dateFormat = new SimpleDateFormat(DATE_FORMAT_WITH_HOURS);
            TimeZone getTimeZone = TimeZone.getTimeZone(timeZone);
            dateFormat.setTimeZone(getTimeZone);
            return date;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static String checkIfNull(String value){
        String defaultMsg = "";
        String valueToReturn = "";
        if(value != null){
            valueToReturn = value;
        }else{
            valueToReturn = defaultMsg;
        }
        return valueToReturn;
    }

    public static Integer stringToNumeric(String field) throws Exception {
        Integer number;
        try {
            number = Integer.valueOf(field);

        } catch (NumberFormatException numberFormatException) {
            throw new Exception("El campo ingresado no es un número.");
        }
        return number;
    }

    public static Boolean validateStringInteger(String field) {
        try {
            Integer.parseInt(field);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public static BigDecimal stringToBigDecimalValidation(String participationPercentage) throws Exception {

        BigDecimal shareBeneficiary;

        try {
            shareBeneficiary = new BigDecimal(participationPercentage);
        } catch (Exception exception) {
            throw new Exception(exception.getMessage());
        }
        return shareBeneficiary;
    }


    public static Boolean validateStringNumeric(String field) {

        try {
            Long.valueOf(field);
            return true;
        } catch (NumberFormatException numberFormatException) {
            return false;
        }
    }

    public static Boolean validateStringBigDecimal(String field) {
        try {
            new BigDecimal(field);
            return true;
        } catch (NumberFormatException | NullPointerException e) {
            return false;
        }
    }

    public static String formatStringDate(String inputDate){
        String desiredFormat = Constants.DATE_FORMAT_EXCLUSION_VALIDATION;
        String formattedDate = "";
        SimpleDateFormat inputFormat = new SimpleDateFormat(Utils.DATE_FORMAT);
        SimpleDateFormat outputFormat = new SimpleDateFormat(desiredFormat);

        try {
            Date date = inputFormat.parse(inputDate);
            formattedDate = outputFormat.format(date);
            System.out.println(formattedDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return formattedDate;
    }

    public static List<Date> getfilterByDateFromAndTo(String dateFrom, String dateTo) throws Exception {
        Date creationFromDate = null;
        Date creationToDate = null;
        List<Date> dateList = new ArrayList<>();

        if(dateFrom != null) {
            if(!dateFrom.matches(Constants.REGEX_DATE)) {
                throw new Exception("El campo << creationFromDate >> no tiene un formato correcto dd/mm/yyyy");
            }
            creationFromDate = stringToDateOrNull(dateFrom);
            if(creationFromDate == null) {
                throw new Exception("El campo << creationFromDate >> no se pudo asignar.");
            }
            dateList.add(creationFromDate);
        }

        if(dateTo != null) {
            if(!dateTo.matches(Constants.REGEX_DATE)) {
                throw new Exception("El campo << creationToDate >> no tiene un formato correcto dd/mm/yyyy");
            }
            creationToDate = stringToDateOrNull(dateTo);
            if (creationToDate == null) {
                throw new Exception("El campo << creationToDate >> no se pudo asignar.");
            }
            dateList.add(creationToDate);
        }
        return dateList;
    }

    public static void getValidatePageAndSize(Integer page, Integer size, Boolean unpaged) throws Exception {
        if (page == null || size == null && !unpaged ) {
            throw new Exception("Los campos 'page' y 'size' son requeridos.");
        }
    }

    public static Date getStartDateOfMonth(String dateString) {
        try {
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
            Date date = dateFormat.parse(dateString);

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);

            // Establecer el día del mes como 1
            calendar.set(Calendar.DAY_OF_MONTH, 1);

            // Establecer la hora, minutos, segundos y milisegundos a cero
            calendar.set(Calendar.HOUR_OF_DAY, 0);
            calendar.set(Calendar.MINUTE, 0);
            calendar.set(Calendar.SECOND, 0);
            calendar.set(Calendar.MILLISECOND, 0);

            return calendar.getTime();
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return null;
    }

    public static Date getEndDateOfMonth(String dateString) {
        try {
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
            Date date = dateFormat.parse(dateString);

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);

            // Obtener el último día del mes
            int lastDayOfMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

            // Establecer el día del mes como el último día del mes
            calendar.set(Calendar.DAY_OF_MONTH, lastDayOfMonth);

            // Establecer la hora, minutos, segundos y milisegundos al final del día
            calendar.set(Calendar.HOUR_OF_DAY, 23);
            calendar.set(Calendar.MINUTE, 59);
            calendar.set(Calendar.SECOND, 59);
            calendar.set(Calendar.MILLISECOND, 999);

            return calendar.getTime();
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return null;
    }

    public static int daysBetween(Date firstDate, Date secondDate){
        int milisecondsByDay = 86400000;
        int days = (int) ((secondDate.getTime() - firstDate.getTime())/ milisecondsByDay);
        return days;
    }

    public static void sendErrorResponse(HttpServletResponse response, HttpStatus status, String message) throws IOException {
        response.setStatus(status.value());
        response.setContentType("application/json");
        ObjectMapper objectMapper = new ObjectMapper();
        String jsonResponse = objectMapper.writeValueAsString(
                new StatusDTO(String.valueOf(status.value()), message));
        response.getWriter().write(jsonResponse);
    }

    public static Double calculateAgeByStringDate(String birthDate, String dateFormatter) throws Exception {
        double currentAge;
        try {
            LocalDate currentDate = LocalDate.now();
            java.time.format.DateTimeFormatter dataBaseDateFormatter = java.time.format.DateTimeFormatter.ofPattern(dateFormatter);

            LocalDate dateOfBirth = LocalDate.parse(birthDate, dataBaseDateFormatter);
            Period period = Period.between(dateOfBirth, currentDate);
            currentAge = period.getYears() + (period.getMonths() / 12.0);

            return currentAge;
        } catch (DateTimeParseException e) {
            System.out.println("Error al analizar la fecha de nacimiento: " + e.getMessage());
            throw new Exception("Error al analizar la fecha de nacimiento: " + e.getMessage());
        }
    }

    public static Boolean validateDateFormat(String inputDate) {
        boolean correcto;
        try {
            String day = inputDate.substring(0, 2);
            String month = inputDate.substring(3, 5);
            String year = inputDate.substring(6, 10);

            //Formato de fecha (día/mes/año)
            SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");
            formatoFecha.setLenient(false);
            //Comprobación de la fecha
            formatoFecha.parse(stringToNumeric(day) + "/" + stringToNumeric(month) + "/" + stringToNumeric(year));
            correcto = true;

        } catch (ParseException e) {
            correcto = false;
        } catch (Exception e) {
            correcto = false;
        }
        return correcto;
    }


    public static String dateValidation(String inputDateStr) throws Exception {
        SimpleDateFormat[] inputFormats = {
                new SimpleDateFormat("MM/dd/yyyy"),
                new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS"),
                new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"),
                new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy")
        };

        SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");

        for (SimpleDateFormat inputFormat : inputFormats) {
            try {
                Date inputDate = inputFormat.parse(inputDateStr);
                return outputFormat.format(inputDate);
            } catch (ParseException e) {
                // No hacer nada, e intentar con el siguiente formato
            }
        }

        return null; // Si ninguno de los formatos coincide, retorna null
    }

    public static Boolean validationEventDate(String eventDate) throws Exception {
        Boolean validationLastEventDate = false;

        try {
            java.time.format.DateTimeFormatter inputFormat = java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy");

            LocalDate date = LocalDate.parse(eventDate, inputFormat);

            if (date.isEqual(LocalDate.now()) || date.isAfter(LocalDate.now())) validationLastEventDate = true;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
        return validationLastEventDate;
    }

    /**
     * Convierte una fecha en formato Date a una cadena de texto con el formato especificado.
     *
     * @param date La fecha a ser convertida.
     * @param formatterDate El formato de fecha deseado para la cadena de texto.
     * @param dateDescription Una descripción de la fecha que se está formateando.
     * @return Una cadena de texto que representa la fecha formateada o una cadena vacía si la fecha es nula.
     */
    public static String getStringDate(Date date, String formatterDate, String dateDescription){
        String finalDate = "";
        try {
            if (date != null) {
                finalDate = getFormatDate(date, formatterDate);
            }
        }catch (Exception e){
            System.out.println("Error al formatear la "+ dateDescription+ " :" + date);
        }
        return finalDate;
    }

    /**
     * Convierte un número double en una cadena de texto y separa por miles el número si es necesario.
     *
     * @param number El número double a convertir.
     * @param isThousandsSeparator Indica si se debe usar separadores de miles.
     * @param doubleDescription Nombre del campo.
     * @return Una cadena que representa el número double.
     */
    public static String getDoubleToString(Number number, Boolean isThousandsSeparator, String doubleDescription){
        String doubleNumber = "0.0";
        try {
            if (number != null) {
                if (isThousandsSeparator){
                    doubleNumber = String.format(zeroRegexFormatter, number.doubleValue());
                }else{
                    doubleNumber = String.valueOf(number);
                }
            }
        }catch (Exception e){
            System.out.println("Error al formatear "+ doubleDescription+ " :" + number);
        }
        return doubleNumber;
    }

    /**
     * Valida que un número no supere el valor de 100 y sea mayor a cero.
     *
     * @param number El número a ser validado.
     * @return true si el número no supera 100 y es menor a 1, false en caso contrario.
     */
    public static Boolean validateNumberInRange(Double number) {
        return number >= 1 && number <= 100;
    }

    /**
     * Valida que un número no supere el valor de 100 y sea mayor a cero.
     *
     * @param number El número a ser validado.
     * @return true si el número no supera 1000 y es mayor a 0, false en caso contrario.
     */
    public static boolean validateNumber(String number) {

        Pattern pattern = Pattern.compile(NUMBER_MAX);

        Matcher matcher = pattern.matcher(number);

        return matcher.matches();// Verificar si coincide con el patrón
    }


    /**
     * Da formato de acuerdo a la entrada y salida
     *
     * @param String feacha a ser formateada
     * @return Fecha formateada
     */
    public static String getFormatDate(String dateString, String formatInput, String formatOutput) throws ParseException {
        SimpleDateFormat inputFormat = new SimpleDateFormat(formatInput);
        SimpleDateFormat outputFormat = new SimpleDateFormat(formatOutput);
        Date date = inputFormat.parse(dateString);
        return outputFormat.format(date);
    }

    /**
     * Valida una cadena de string que contenga caracteres especiales
     *
     * param String cadena a ser validada.
     * return true si cintiene caracteres especiales
     */
    public static boolean validateStringSpecialCharacter(String text) {
        text = text.replace(" ", "");
        boolean find = text.matches("^[a-zA-ZñÑáéíóúÁÉÍÓÚüÜ]*$");
        return !find;
    }


    /**
     * Transformar un archivo a base 64
     * @param file archivo que se quiere convertir a base 64
     */
    public static GetResultDTO transformFileToBase64(MultipartFile file) throws Exception {
        try {
            // Se obtienen los bytes del archivo
            byte[] fileBytes = file.getBytes();

            //Se convierten los bytes a Base64
            String base64File = Base64.getEncoder().encodeToString(fileBytes);

            return new GetResultDTO(1, base64File);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    /**
     * Transforma una base 64 a archivo
     * @param base64String base 64 que se quiere convertir a archivo
     */
    public static ByteArrayResource transformBase64ToFile(String base64String) throws Exception  {
        try {
            //Se convierte la cadena Base64 a un array de bytes
            byte[] byteArray = Base64.getDecoder().decode(base64String);

            // Crea un ByteArrayResource a partir del array de bytes
            ByteArrayResource resource = new ByteArrayResource(byteArray);

            return resource;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
}