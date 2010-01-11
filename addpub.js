var sf;
var nsf;

function showForm(entrytype)
{    
    var formHTML = "";
    //alert("showForm called!");
    
    if(entrytype == "article")
	{
	    sf = new Array("author", "title", "journal", "year");
	    nsf = new Array("volume", "number", "pages", "month", "note", "key");
	}
    else if(entrytype == "book")
	{
	    sf = new Array("author", "title", "publisher", "year");
	    nsf = new Array("volume", "series", "address", "edition", "month", "note", "key");
	}
    else if(entrytype == "inproceedings")
	{
	    sf = new Array("author", "title", "booktitle", "year");
	    nsf = new Array("editor", "pages", "organization", "publisher", "address", "month", "note", "key");
	}
    else if(entrytype == "incollection")
	{
	    sf = new Array("author", "title", "booktitle", "year");
	    nsf = new Array("editor", "pages", "organization", "publisher", "address", "month", "note", "key");
	}
    else if(entrytype == "inbook")
	{
	    sf = new Array("author", "title", "pages", "publisher", "year");
	    nsf = new Array("volume", "series", "address", "edition", "month", "note", "key");
	}
    else if(entrytype == "mastersthesis")
	{
	    sf = new Array("author", "title", "school", "year");
	    nsf = new Array("address", "month", "note", "key");
	}
    else if(entrytype == "misc")
	{
	    sf = new Array();
	    nsf = new Array("author", "title", "howpublished", "month", "year", "note", "key");
	}
    else if(entrytype == "masproject")
	{
	    sf = new Array("author", "title", "school", "year");
	    nsf = new Array("address", "month", "note", "key");
	}
    else if(entrytype == "phdthesis")
	{
	    sf = new Array("author", "title", "school", "year");
	    nsf = new Array("address", "month", "note", "key");
	}
    else if(entrytype == "techreport")
	{
	    sf = new Array("author", "title", "institution", "year");
	    nsf = new Array("type", "number", "address", "month", "note", "key");
	}
    else if(entrytype == "unpublished")
	{
	    sf = new Array("author", "title", "note");
	    nsf = new Array("month", "year", "key");
	}
    else
	{
	    alert("Invalid choice!");
	}

    for(var i = 0; i<sf.length; i++)
	{
		formHTML += "<label for=\"" + sf[i] + "\">" + sf[i] + "(*)";
		if(sf[i] == "author")
			formHTML += " (e.g. John Doe and Jane Doe and Jim Doe)";
		formHTML += "</label><br />";
	    formHTML += "<input type=\"text\" name=\"" + sf[i] + "\" id=\"" + sf[i] + "\"  style=\"width:400px;\" value=\"\" /><br /><br />";
	}
    for(var i = 0; i<nsf.length; i++)
	{
		formHTML += "<label for=\"" + nsf[i] + "\">" + nsf[i];
		if(nsf[i] == "month")
			formHTML += " (e.g. March 14-20)";
		formHTML += "</label><br />";
	    formHTML += "<input type=\"text\" name=\"" + nsf[i] + "\" id=\"" + nsf[i] + "\"  style=\"width:400px;\" value=\"\" /><br /><br />";
	}
    
    document.getElementById("entryform").innerHTML = formHTML;
}

function genBib2(documentt)
{
    var bibcode;
    var entrytype = documentt.bibentryform.entrytype.value;
    var entryname = documentt.bibentryform.entryname.value;

    var abstract = documentt.bibentryform.abstract.value;
    var researcharea = documentt.bibentryform.researcharea.value;
    var keywords = documentt.bibentryform.keywords.value;
    var filelink = documentt.bibentryform.filelink.value;

    bibcode = "@" + entrytype + "{" + entryname + ",\n";
    
    for(var i=0; i<sf.length; i++)
	{
	    //	    if(document.getElementById(sf[i]).value != '')
		bibcode += "\t" + sf[i] + "= \"{" + documentt.getElementById(sf[i]).value + "}\",\n";
	}
    for(var i=0; i<nsf.length; i++)
	{
	    if(documentt.getElementById(nsf[i]).value != '')
		bibcode += "\t" + nsf[i] + "= \"{" + documentt.getElementById(nsf[i]).value + "}\",\n";    
	}

    //if(abstract != '')
	bibcode += "\tabstract = \"{" + abstract + "}\",\n";
    //if(keywords != '')
	bibcode += "\tkeywords = \"{" + keywords + "}\",\n";
    if(filelink != '')
	bibcode += "\tfilelink = \"{" + filelink + "}\",\n";
    //if(researcharea != '')
	bibcode += "\tresearcharea = \"{" + researcharea + "}\"\n";
    bibcode += "}\n";

    //var htmlbibcode = bibcode.replace(/(?:\n\r|\n|\r)/g, '<br />');
    //var htmlbibcode = htmlbibcode.replace(/\t/g, '&nbsp;&nbsp;&nbsp;');

    documentt.getElementById("bibtexcode").value=bibcode;
}

function genBib()
{
    genBib2(document);
}

function openUploadPubForm()
{
    OpenSubWin("uploadpub.php?entryid="+document.getElementById("entryname").value, 400, 400, 1);
}

function OpenSubWin( page, w, h, sb )
{  var sw = screen.width, sh = screen.height;
    var ulx = ((sw-w)/2), uly = ((sh-h)/2);
    var sbt = (sb==1) ? 'yes' : 'no';

  var paramz = 'toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars='+sbt+',width='+w+',height='+h+'';
  var oSubWin = window.open( "", "SubWin", paramz );

  oSubWin.moveTo( ulx, uly );
  oSubWin.location.replace( page );
}

/* called by uploadpub */
function returnFilelinkAndClose( strFilelink )
{
    window.opener.document.bibentryform.filelink.value = strFilelink;
    //genBib2(window.opener.document);
    window.close();
}
