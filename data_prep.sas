/* sorting the data with descending date  */
proc sort data=sashelp.stocks(where=(stock='IBM')) out=mystocks;
	by descending date;
run;

/* create two columns to hold the corresponding close and volume in previous date */
data mystockslag;
    set mystocks;
    closelag = lag(close);
    volumelag = lag(volume);
    keep date close volume closelag volumelag;
run;	

/* sorting the data back to ascending date  */
proc sort data=mystockslag out=baselib.mystockslag;
	by date;
run;
