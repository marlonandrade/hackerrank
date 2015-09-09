// input boilerplate

process.stdin.resume();
process.stdin.setEncoding('ascii');

var _data = "";
var _lines = "";
var _lineIndex = 0;

process.stdin.on('data', function (data) { _data += data; });
process.stdin.on('end', function () {
  _lines = _data.split("\n");
  main();
});

function readLine() {
  return _lines[_lineIndex++];
}

// code

Date.ParseTime = function(timeString) {
  var regex = /(\d{2}):(\d{2}):(\d{2})(PM|AM)/;
  var matches = timeString.match(regex);

  var date = new Date();
  date.setHours(matches[1]);
  date.setMinutes(matches[2]);
  date.setSeconds(matches[3]);

  var afterNoom = matches[4] === 'PM';
  if (afterNoom && date.getHours() !== 12 ||
     !afterNoom && date.getHours() === 12) {
    date.setHours(date.getHours() + 12);
  }

  return date;
};

function main() {
  var date = Date.ParseTime(readLine());
  console.log(date.toLocaleTimeString('en-US', { hour12: false }));
}

