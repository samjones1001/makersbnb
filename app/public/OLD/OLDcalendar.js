$(window).load(function()
{
	// dateArray = []
	// for (i=1;i<=parseInt($('#amount_dates').val());i++){
	// 	year = parseInt($('#'+i).val().substring(0, 4))
	// 	month = parseInt($('#'+i).val().substring(5, 7))-1
	// 	day = parseInt($('#'+i).val().substring(8, 10))
	// 	dateArray.push({date: new Date(year,month,day)})


	// calendar = setUpCalendar(dateArray)
	// console.log(calendar)
	// $('#example2').glDatePicker(calendar);
	// Example #2 - Selectable dates and ranges and prevent month/year selection
	$('#example2').glDatePicker(
	{
		showAlways: true,
		allowMonthSelect: true,
		allowYearSelect: true,
		prevArrow: '',
		nextArrow: '',
		selectedDate: new Date(2017, 1, 1),
		selectableDateRange: [
			{ from: new Date(2017, 1, 1), to: new Date(2017, 1, 10)}
		],
		selectableDates: [
			{ date: new Date(2017, 3, 1) }
		]
	});

});

// function setUpCalendar(dateArray){
//   // console.log(dateArray)
//   return calendar =           {
//                 // console.log(dateArray)
//                 showAlways: true,
//                 allowMonthSelect: false,
//                 allowYearSelect: false,
//                 prevArrow: '',
//                 nextArrow: '',
//                 selectedDate: new Date(2013, 8, 5),
//                 selectableDateRange: [
//
//                 ],
//
//                 selectableDates: dateArray
//             }
// }
