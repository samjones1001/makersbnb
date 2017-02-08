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
	calendar = setUpCalendar(dateArray)
	$('#example2').glDatePicker(calendar);
});

function setUpCalendar(dateArray){
  return {
                // console.log(dateArray)
                showAlways: true,
                allowMonthSelect: true,
                allowYearSelect: true,
                prevArrow: '',
                nextArrow: '',
                selectedDate: new Date(2017, 1, 1),
                selectableDateRange: [

                ],

                selectableDates: dateArray
            }
}
