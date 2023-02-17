function difference( firstDate, secondDate ){
	return ( firstDate - secondDate )/86400000;
}

function absoluteDifference ( firstDate, secondDate ){
	return Math.abs( difference( firstDate, secondDate ) );
};

module.exports = {
	difference: difference,
	absoluteDifference: absoluteDifference
};