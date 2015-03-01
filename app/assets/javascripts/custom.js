var x;
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



$(function () {
  //Datemask dd/mm/yyyy
  $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
  //Datemask2 mm/dd/yyyy
  $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
  //Money Euro
  $("[data-mask]").inputmask();

  //Date range picker
  $('#reservation').daterangepicker();
  //Date range picker with time picker
  $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
  //Date range as a button
  $('#daterange-btn').daterangepicker(
    {
      ranges: {
        'Today': [moment(), moment()],
        'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
        'Last 7 Days': [moment().subtract('days', 6), moment()],
        'Last 30 Days': [moment().subtract('days', 29), moment()],
        'This Month': [moment().startOf('month'), moment().endOf('month')],
        'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
      },
      startDate: moment().subtract('days', 29),
      endDate: moment()
    },
    function (start, end) {
      $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
    }
  );

  //iCheck for checkbox and radio inputs
  $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
    checkboxClass: 'icheckbox_minimal-blue',
    radioClass: 'iradio_minimal-blue'
  });
  //Red color scheme for iCheck
  $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
    checkboxClass: 'icheckbox_minimal-red',
    radioClass: 'iradio_minimal-red'
  });
  //Flat red color scheme for iCheck
  $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
    checkboxClass: 'icheckbox_flat-green',
    radioClass: 'iradio_flat-green'
  });

  //Colorpicker
  $(".my-colorpicker1").colorpicker();
  //color picker with addon
  $(".my-colorpicker2").colorpicker();

  //Timepicker
  $(".timepicker").timepicker({
    showInputs: false
  });
});

$('.fr_accept, .fr_reject').click(function(){
  x = $(this)
  $('#' + $(this).val().split('_')[1] ).val($(this).val().split('_')[0])
  $(this).closest('form').submit();
  $(this).closest('fieldset').hide();
});




});

$(document).ready(function(){
alert("Document is ready");
});
