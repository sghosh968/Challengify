$(window).load(function(){
  $('.datetimepicker').datetimepicker();


  //for flip clock countdown timer
  //instantiates the timer on challenge show page
  //var clock = $('.your-clock').FlipClock({
    //countdown(true);
  //});
  //clock.countdown(true);
//  clock.setCountdown(true);
//alert("hi");
var clock;
// Grab the current date
var currentDate = new Date();

// Set some date in the future. In this case, it's always Jan 1
var futureDate  = new Date(currentDate.getFullYear() + 1, 0, 1);

// Calculate the difference in seconds between the future and current date
var diff = futureDate.getTime() / 1000 - currentDate.getTime() / 1000;

// Instantiate a coutdown FlipClock
clock = $('.dw_clock').FlipClock(diff, {
  clockFace: 'DailyCounter',
  countdown: true,
  showSeconds: true
});







});
