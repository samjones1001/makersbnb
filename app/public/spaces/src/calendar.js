$(window).load(function()
{
	dateArray = []
	for (i=1;i<=parseInt($('#amount_dates').val());i++){
		newDate = convertDate($('#'+i).val())
		dateArray.push({date: newDate})
	}
	//
	//
	if ($('#user_start_date').val() == "") {
		calendar = setUpCalendar(dateArray);
	}
	else {
	calendar = setUpCalendar(dateArray,convertDate($('#user_start_date').val()))
	$('#startdate').val($('#user_start_date').val())
	}
	$('#startdate').glDatePicker(calendar);
	if ($('#user_start_date').val() == "") {
		calendar = setUpCalendar(dateArray)
		$('#enddate').val("")
	} else {
		calendar = setUpCalendar(dateArray,convertDate($('#user_end_date').val()))
		$('#enddate').val($('#user_end_date').val())		
	}
	$('#enddate').glDatePicker(calendar);
});

function setUpCalendar(dateArray,selectDate){
  return {
                showAlways: true,
                allowMonthSelect: true,
                allowYearSelect: true,
                prevArrow: '',
                nextArrow: '',
                selectedDate: selectDate,
                selectableDateRange: [

                ],

                selectableDates: dateArray
            }
}

function convertDate(date) {
	year = parseInt(date.substring(0, 4))
	month = parseInt(date.substring(5, 7))-1
	day = parseInt(date.substring(8, 10))
	return new Date(year,month,day)
}
