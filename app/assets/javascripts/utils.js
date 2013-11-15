var utils = {};

// From : http://stackoverflow.com/questions/1267283/how-can-i-create-a-zerofilled-value-using-javascript
utils.zeroFill = function (number, width) {
    'use strict';

    width -= number.toString().length;
    if (width > 0) {
        return new Array(width + (/\./.test(number) ? 2 : 1) ).join('0') + number;
    }
    return number.toString();
};