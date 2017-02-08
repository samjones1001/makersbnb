$(window).load(function()
{
	dateArray = []
	for (i=1;i<=parseInt($('#amount_dates').val());i++){
		year = parseInt($('#'+i).val().substring(0, 4))
		month = parseInt($('#'+i).val().substring(5, 7))-1
		day = parseInt($('#'+i).val().substring(8, 10))
		dateArray.push({date: new Date(year,month,day)})
	}
	//
	//
	console.log(dateArray[0]['date'])
	calendar = setUpCalendar(dateArray,dateArray[0]['date'])
	$('#startdate').glDatePicker(calendar);

	calendar = setUpCalendar(dateArray,dateArray[dateArray.length-1]['date'])
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
