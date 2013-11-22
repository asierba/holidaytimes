/*global $, utils */

$(function () {
    "use strict";

    $('.from').datepicker({dateFormat: 'yy-mm-dd'});
    $('.to').datepicker({dateFormat: 'yy-mm-dd'});
});

function CalendarCtrl($scope) {
    "use strict";

    var monthIndex = 0,
        monthNames = ["January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"];

    $scope.year = 0;
    $scope.days = [];

    function numbeOfDaysInMonth(month) {
        switch (monthNames[month]) {
        case "February":
            return 28;
        case "April":
        case "June":
        case "September":
        case "November":
            return 30;

        case "January":
        case "March":
        case "May":
        case "July":
        case "August":
        case "October":
        case "December":
            return 31;
        }
    }

    function createDaysNonThisMonth(min, max) {
        var days = [],
            i;
        for (i = min; i <= max; i++) {
            days.push({value: i, isNotThisMonth: true});
        }
        return days;
    }

    function createDaysThisMonth(num) {
        var days = [],
            i;
        for (i = 1; i <= num; i++) {
            days.push({value: i});
        }
        return days;
    }

    function createDaysPreviousMonth() {
        var firstDayOfMonth = new Date($scope.year, monthIndex, 1, 0, 0, 0, 0),
            firstDayOfMonthIndex = firstDayOfMonth.getDay() === 0 ? 7 : firstDayOfMonth.getDay(),
            previousMonth = monthIndex === 0 ? 11 : monthIndex - 1,
            numOfDaysPreviousMonth = numbeOfDaysInMonth(previousMonth),
            mondayPreviousMonth = numOfDaysPreviousMonth - firstDayOfMonthIndex + 2;

        return createDaysNonThisMonth(mondayPreviousMonth, numOfDaysPreviousMonth);
    }

    function createDaysNextMonth() {
        var lastDayOfMonth = new Date($scope.year, monthIndex, numbeOfDaysInMonth(monthIndex), 0, 0, 0, 0),
            lastDayOfMonthIndex = lastDayOfMonth.getDay() === 0 ? 7 : lastDayOfMonth.getDay(),
            daysLeftOnWeek = 7 - lastDayOfMonthIndex;

        return createDaysNonThisMonth(1, daysLeftOnWeek);
    }

    function drawBookingOnCalendar(booking) {
        var start_day = new Date(booking.from).getUTCDate(),
            end_day = new Date(booking.to).getUTCDate(),
            start_month = new Date(booking.from).getMonth(),
            end_month = new Date(booking.to).getMonth(),
            firstDayOfMonth = new Date($scope.year, monthIndex, 1, 0, 0, 0, 0),
            firstDayOfMonthIndex = firstDayOfMonth.getDay() === 0 ? 7 : firstDayOfMonth.getDay(),
            previousMonth = monthIndex === 0 ? 11 : monthIndex - 1,
            numOfDaysPreviousMonth = numbeOfDaysInMonth(previousMonth),
            numOfDaysThisMonth = numbeOfDaysInMonth(monthIndex),
            mondayPreviousMonth = numOfDaysPreviousMonth - firstDayOfMonthIndex + 2,
            i = 0,
            day;

        if (start_month < monthIndex) {
            start_day = 1;
        }

        if (end_month > monthIndex) {
            end_day = numOfDaysThisMonth;
        }

        for (i = start_day; i <= end_day; i++) {
            day = $scope.days[i + numOfDaysPreviousMonth - mondayPreviousMonth];
            if (day.bookings === undefined) {
                day.bookings = [];
            }

            $scope.$apply(function () {
                day.bookings.push({id: booking.id, who: booking.who.substring(0, 10)});
            });
        }
    }

    function drawOnCalendar(bookings) {
        bookings.forEach(drawBookingOnCalendar);
    }

    function drawCalendar() {
        $scope.days = createDaysPreviousMonth()
            .concat(createDaysThisMonth(numbeOfDaysInMonth(monthIndex)))
            .concat(createDaysNextMonth());

        var numOfDaysThisMonth = numbeOfDaysInMonth(monthIndex),
            thisMonth = utils.zeroFill(monthIndex + 1, 2);

        $.ajax({
            type: 'GET',
            dataType: 'json',
            contentType: 'application/x-www-form-urlencoded; charset=utf-8',
            url: '/bookings/range?start=' +  $scope.year + '-' + thisMonth + '-01&finish=' +  $scope.year + '-' + thisMonth + '-' + numOfDaysThisMonth,
            success: drawOnCalendar
        });
    }

    $scope.month = function () {
        return monthNames[monthIndex];
    };

    $scope.goToPreviousMonth = function () {
        if (monthIndex === 0) {
            monthIndex = 11;
            $scope.year--;
        } else {
            monthIndex--;
        }

        drawCalendar();
    };

    $scope.goToNextMonth = function () {
        if (monthIndex === 11) {
            monthIndex = 0;
            $scope.year++;
        } else {
            monthIndex++;
        }

        drawCalendar();
    };

    function initialise() {
        var d = new Date();
        monthIndex = d.getMonth();
        $scope.year = d.getFullYear();

        drawCalendar();
    }

    initialise();
}