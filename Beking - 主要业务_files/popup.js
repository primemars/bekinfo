function getWindowTitle(url)
{
	if(url!=""){	
	var t = "WinT"+url.replace(/\//g,"_"); /* replace all "/" with "_" */
	var winName = t.replace(/./g,"_"); /* replace all "." with "_" */ 
	return winName;}	
}
function geturlcore(url)
{
	if(url!=""){	
		var varsp1 = url;
		var varsp2 = varsp1.split("=");		
		return varsp2[1];	}
}
// Start popupgeneric1
// THIS IS CHANGED BY SHIVANI ON 07/19/2006 TO GET THE COREMETRICS TAGGING FOR THE SWISS MEDIA FILE AND 
// CHANGES MADE IS THAT FUNCTION POPUPGENERIC IS CREATED AND USED IN THE FLASHQUESTIONS.TPL FILE
// TO GET THE COREMETRICS TAGGING INFO.

function popupgeneric1(urlmain,url,type, width, height, toolbar, status, location, menubar, scrollbar, resizable){
var wint = getWindowTitle(url);
var sPageID = "/locations/swiss/people/consultants/index.asp";
var PgName = "Swiss Office Site Media Download  - "+ geturlcore(url);
var sCatID = geturlcore(url);
if (sCatID==""){sCatID="/"}
var this_server = urlmain;
if (this_server == "mckinsey.com" || this_server == "www.mckinsey.com" ){cmSetProduction();}
cmCreatePageviewTag(sPageID,PgName,sCatID,null);	
if (type == "POPUP")
{
	winPopup = window.open(url, wint,"width="+width+",height="+height+",left=100,top=100,screenX=100,screenY=100,toolbar="+toolbar+",status="+status+",location="+location+",menubar="+menubar+",scrollbars="+scrollbar+",resizable="+resizable);	
	winPopup.focus();
}

if (type == "SLIDESHOW")
{		
		winSlideshow = window.open (url,wint, "toolbar=no,width="+width+",height="+height+",scrollbars=no,statusbar=no,resize=no,menubar=no");	
		winSlideshow.focus();
}

if (type == "MP3")
{	
	winMP3 = window.open (url,wint, "toolbar=no,width="+width+",height="+height+",scrollbars=no,status=no,resize=no,menubar=no");
	winMP3.focus();		
}

if (type == "AUDIO")
{	
	winAudio = window.open (url,wint, "toolbar=no,width="+width+",height="+height+",scrollbars=no,status=no,resize=no,menubar=no");
	winAudio.focus();	
}

if (type == "VIDEO")
{	
	winVideo = window.open (url,wint, "toolbar=no,width="+width+",height="+height+",scrollbars=no,status=no,resize=no,menubar=no");
	winVideo.focus();		
}

if (type == "CASESTUDY")
{	
	winCasestudy = window.open(url, wint,"width="+width+",height="+height+",left=100,top=20,screenX=100,screenY=20,toolbar=no,status=yes,location=no,menubar=no,scrollbars=yes,resizable");
	winCasestudy.focus();	
}

if (type == "PRINTERFRIENDLY")
{	
	newWindow = window.open(url, wint,"width="+width+",height="+height+",left=100,top=100,screenX=100,screenY=100,toolbar=no,status=no,location=no,menubar=yes,scrollbars=yes,resizable=no");
	newWindow.focus();	
}

if (type == "PRINTERFRIENDLYKEYDATES")
{	
	winKD = window.open(url, wint,"width="+width+",height="+height+",left=100,top=100,screenX=100,screenY=100,toolbar=no,status=no,location=no,menubar=yes,scrollbars=yes,resizable=no");
	winKD.focus();	
}

if (type == "EMAILTOCOLLEAGUE")
{	
	winEmailtocollegue = window.open(url, wint,"width="+width+",height="+height+",left=100,top=100,screenX=100,screenY=100,toolbar=no,status=no,location=no,menubar=yes,scrollbars=yes,resizable");
	winEmailtocollegue.focus();	
}

if (type == "OTHERS")
{	
	winOthers = window.open(url, wint,"width="+width+",height="+height+",left=100,top=100,screenX=100,screenY=100,toolbar="+toolbar+",status="+status+",location="+location+",menubar="+menubar+",scrollbars="+scrollbar+",resizable="+resizable);
	winOthers.focus();	
}

}

//End popupgeneric 1

// Start popupgeneric 
function popupgeneric(url,type, width, height, toolbar, status, location, menubar, scrollbar, resizable){
var wint = getWindowTitle(url);
if (type == "POPUP")
{
	winPopup = window.open(url, wint,"width="+width+",height="+height+",left=100,top=100,screenX=100,screenY=100,toolbar="+toolbar+",status="+status+",location="+location+",menubar="+menubar+",scrollbars="+scrollbar+",resizable="+resizable);	
	winPopup.focus();
}

if (type == "SLIDESHOW")
{		
		winSlideshow = window.open (url,wint, "toolbar=no,width="+width+",height="+height+",scrollbars=no,statusbar=no,resize=no,menubar=no");	
		winSlideshow.focus();
}

if (type == "MP3")
{	
	winMP3 = window.open (url,wint, "toolbar=no,width="+width+",height="+height+",scrollbars=no,status=no,resize=no,menubar=no");
	winMP3.focus();		
}

if (type == "AUDIO")
{	
	winAudio = window.open (url,wint, "toolbar=no,width="+width+",height="+height+",scrollbars=no,status=no,resize=no,menubar=no");
	winAudio.focus();	
}

if (type == "VIDEO")
{	
	winVideo = window.open (url,wint, "toolbar=no,width="+width+",height="+height+",scrollbars=no,status=no,resize=no,menubar=no");
	winVideo.focus();		
}

if (type == "CASESTUDY")
{	
	winCasestudy = window.open(url, wint,"width="+width+",height="+height+",left=100,top=20,screenX=100,screenY=20,toolbar=no,status=yes,location=no,menubar=no,scrollbars=yes,resizable");
	winCasestudy.focus();	
}

if (type == "PRINTERFRIENDLY")
{	
	newWindow = window.open(url, wint,"width="+width+",height="+height+",left=100,top=100,screenX=100,screenY=100,toolbar=no,status=no,location=no,menubar=yes,scrollbars=yes,resizable=no");
	newWindow.focus();	
}

if (type == "PRINTERFRIENDLYKEYDATES")
{	
	winKD = window.open(url, wint,"width="+width+",height="+height+",left=100,top=100,screenX=100,screenY=100,toolbar=no,status=no,location=no,menubar=yes,scrollbars=yes,resizable=no");
	winKD.focus();	
}

if (type == "EMAILTOCOLLEAGUE")
{	
	winEmailtocollegue = window.open(url, wint,"width="+width+",height="+height+",left=100,top=100,screenX=100,screenY=100,toolbar=no,status=no,location=no,menubar=yes,scrollbars=yes,resizable");
	winEmailtocollegue.focus();	
}

if (type == "OTHERS")
{	
	winOthers = window.open(url, wint,"width="+width+",height="+height+",left=100,top=100,screenX=100,screenY=100,toolbar="+toolbar+",status="+status+",location="+location+",menubar="+menubar+",scrollbars="+scrollbar+",resizable="+resizable);
	winOthers.focus();	
}

}

//End popupgeneric


function popup(url,type)
{
//syntax  - popupgeneric(url,type, width, height, toolbar, status, location, menubar, scrollbar, resizable)
if (type == "POPUP")
{
	popupgeneric(url,'POPUP','660','500','no','no','no','yes','yes','no')
}
if (type == "SLIDESHOW")
{	
	popupgeneric(url,'SLIDESHOW','610','424','no','no','no','no','no','no');	
}
if (type == "MP3")
{
	popupgeneric(url,'MP3','339','224','no','no','no','no','no','no');
}
if (type == "AUDIO")
{
	popupgeneric(url,'AUDIO','339','213','no','no','no','no','no','no');
}
if (type == "VIDEO")
{	
	popupgeneric(url,'VIDEO','339','213','no','no','no','no','no','no');
}
if (type == "CASESTUDY")
{
	popupgeneric(url,'CASESTUDY','680','600','no','no','no','no','no','no');
}
if (type == "PRINTERFRIENDLY")
{
	popupgeneric(url,'PRINTERFRIENDLY','577','500','no','no','no','yes','yes','no');
}
if (type == "PRINTERFRIENDLYKEYDATES")
{
	popupgeneric(url,'PRINTERFRIENDLYKEYDATES','510','400','no','no','no','yes','no','no');
}
if (type == "EMAILTOCOLLEAGUE")
{
	popupgeneric(url,'EMAILTOCOLLEAGUE','660','500','no','no','no','yes','yes','yes');
}
}


var gmyWin=null;

function myOpenWindow(winURL, winName, winFeatures, winObj)
{
  var theWin; // this will hold our opened window

  // first check to see if the window already exists
  if (winObj != null) {
    // the window has already been created, but did the user close it?
    // if so, then reopen it. Otherwise make it the active window.
    if (!winObj.closed) {
	  //alert("The game is already being played.");
      winObj.focus();
      return winObj;
    }
    // otherwise fall through to the code below to re-open the window
  }

  // if we get here, then the window hasn't been created yet, or it
  // was closed by the user.
  theWin = window.open(winURL, winName, winFeatures);
  return theWin;
}