//= require booking

/*global describe, beforeEach, it, expect, CalendarCtrl*/

describe("When first loading the calendar", function () {
    'use strict';

    var calendar,
        scope;

    beforeEach(function () {
        scope = {};
        calendar = new CalendarCtrl(scope);
    });

    it("should show current month", function () {
        // TODO change this not to use hardcoded value
        expect(scope.month()).toBe("November");
    });

    it("should show current year", function () {
        expect(scope.year).toBe(new Date().getFullYear());
    });

    it("should show current month's layout", function () {
        expect(scope.days).toEqual([
            {value: 28, isNotThisMonth: true},
            {value: 29, isNotThisMonth: true},
            {value: 30, isNotThisMonth: true},
            {value: 31, isNotThisMonth: true},

            {value: 1}, {value: 2}, {value: 3}, {value: 4}, {value: 5},
            {value: 6}, {value: 7}, {value: 8}, {value: 9}, {value: 10},
            {value: 11}, {value: 12}, {value: 13}, {value: 14}, {value: 15},
            {value: 16}, {value: 17}, {value: 18}, {value: 19}, {value: 20},
            {value: 21}, {value: 22}, {value: 23}, {value: 24}, {value: 25},
            {value: 26}, {value: 27}, {value: 28}, {value: 29}, {value: 30},

            {value: 1, isNotThisMonth: true}]);

    });
});

describe("When clicking next month", function () {
    'use strict';

    var calendar,
        scope;

    beforeEach(function () {
        scope = {};
        calendar = new CalendarCtrl(scope);

        scope.goToNextMonth();
    });

    it("should show next month", function () {
        // TODO change this not to use hardcoded value
        expect(scope.month()).toBe("December");
    });

    it("should show current year", function () {
        expect(scope.year).toBe(new Date().getFullYear());
    });

    it("should show next month's layout", function () {
        expect(scope.days).toEqual([
            {value: 25, isNotThisMonth: true},
            {value: 26, isNotThisMonth: true},
            {value: 27, isNotThisMonth: true},
            {value: 28, isNotThisMonth: true},
            {value: 29, isNotThisMonth: true},
            {value: 30, isNotThisMonth: true},

            {value: 1}, {value: 2}, {value: 3}, {value: 4}, {value: 5},
            {value: 6}, {value: 7}, {value: 8}, {value: 9}, {value: 10},
            {value: 11}, {value: 12}, {value: 13}, {value: 14}, {value: 15},
            {value: 16}, {value: 17}, {value: 18}, {value: 19}, {value: 20},
            {value: 21}, {value: 22}, {value: 23}, {value: 24}, {value: 25},
            {value: 26}, {value: 27}, {value: 28}, {value: 29}, {value: 30}, {value: 31},

            {value: 1, isNotThisMonth: true},
            {value: 2, isNotThisMonth: true},
            {value: 3, isNotThisMonth: true},
            {value: 4, isNotThisMonth: true},
            {value: 5, isNotThisMonth: true}]);
    });
});

describe("When clicking previous month", function () {
    'use strict';

    var calendar,
        scope;

    beforeEach(function () {
        scope = {};
        calendar = new CalendarCtrl(scope);

        scope.goToPreviousMonth();
    });

    it("should show next month", function () {
        // TODO change this not to use hardcoded value
        expect(scope.month()).toBe("October");
    });

    it("should show current year", function () {
        expect(scope.year).toBe(new Date().getFullYear());
    });
});