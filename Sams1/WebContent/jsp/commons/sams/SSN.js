function validate_form()
{
valid=true;
if(document.entry.LastName.value=="")
{
alert("Please Fill in your LastName");
document.entry.LastName.focus()
valid=false;
}
if(document.entry.FirstName.value=="")
{
alert("Please Fill in your FirstName");
document.entry.FirstName.focus()
valid =false;
}
if(document.entry.CBirth.value=="")
{
alert("Please Fill in your Country of Birth");
document.entry.CBirth.focus()
valid =false;
}
if(document.entry.BirthDate.value=="")
{
alert("Please  Fill in your birth date in the format mmddyy");
document.entry.BirthDate.focus()
valid=false;
}
if(document.entry.BirthDate.value!="")
{
    x = document.entry.BirthDate.value ;
    
    if (x.length < 6 || x.length > 6)
	{
        alert("That is not a valid Date Of Birth\n Please enter it in the format mmddyy.");
        document.entry.BirthDate.value = ""
        document.entry.BirthDate.focus()
         valid=false;
}
}
if(document.entry.Ptitle.value=="")
{
alert("Please Fill in your Title Of Your Position");
document.entry.Ptitle.focus()
valid =false;
}
if(document.entry.EDept.value=="")
{
alert("Please Fill in your Employing Department");
document.entry.EDept.focus()
valid =false;
}
if(document.entry.StudentID.value=="")
{
alert("Please Fill in your ID NUMBER");
valid=false;
}
if(document.entry.StudentID.value!="")
{
    x = document.entry.StudentID.value ;
    
    if (x.length < 9 || x.length > 9)
	{
        alert("That is not a valid UTA ID number\n Please enter a 9 digit number.");
        document.entry.StudentID.value = ""
        document.entry.StudentID.focus()
         valid=false;
}
}
/*if(document.entry.SSN.value=="")
{
alert("Please Fill in your SSN Number");
valid=false;
}*/
if(document.entry.SSN.value!="")
{
    x = document.entry.SSN.value
    
    if (x.length < 9 || x.length > 9)
	{
        window.alert("That is not a valid  SSN Number\n Please enter a 9 digit number If you do not know it leave it blank.");
        document.entry.SSN.value = ""
        document.entry.SSN.focus()
              valid=false;
}
function reformat(SSN)
{
return (reformat (SSN, "", 3, "-", 2, "-", 4))
}
}
if(document.entry.StreetAddress.value=="")
{
alert("Please Fill in your  Street Address");
document.entry.StreetAddress.focus()
valid =false;
}
if(document.entry.City.value=="")
{
alert("Please Fill in your  City");
document.entry.City.focus()
valid =false;
}

if(document.entry.HomeCountryAddress.value=="")
{
alert("Please Fill in your  Home Country Address");
document.entry.HomeCountryAddress.focus()
valid =false;
}
if(document.entry.State.selectedIndex==0)
{
  alert("Please Select your State");
 document.entry.State.focus()
valid =false;
}
if(document.entry.Zip.value=="")
{
alert("Please Fill in your Zip");
document.entry.Zip.focus()
valid =false;
}
if(document.entry.Phone.value=="")
{
alert("Please Fill in your Phone");
document.entry.Phone.focus()
valid =false;
}
if(document.entry.Phone.value!="")
{
    x = document.entry.Phone.value ;
    
    if (x.length < 10 || x.length > 10)
	{
        alert("That is not a valid Phone Number\n Please enter a 10 digit number starting with area code in the format 0123456789.");
        document.entry.Phone.value = ""
        document.entry.Phone.focus()
         valid=false;
}
}
if(document.entry.Major.selectedIndex==0)
{
  alert("Please Select your Major");
 document.entry.Major.focus()
valid =false;
}
if(!((document.entry.CurrentDegree[0].checked)||(document.entry.CurrentDegree[1].checked)||(document.entry.CurrentDegree[2].checked)||(document.entry.CurrentDegree[3].checked)||(document.entry.CurrentDegree[4].checked)))
{
alert("Please Select your CurrentDegree "); 
 valid=false;
 }
if(document.entry.CurrentDegree[4].checked)
{
if(document.entry.OtherDegree.value=="")
{
alert("Please Enter your current degree in the box provided");
document.entry.OtherDegree.focus()
valid=false;
}
}

if(!((document.entry.ImmigrationStatus[0].checked)||(document.entry.ImmigrationStatus[1].checked)||(document.entry.ImmigrationStatus[2].checked)||(document.entry.ImmigrationStatus[3].checked)))
{
  alert("Please Select your Immigration Status");
 
valid =false;
}
if(document.entry.ImmigrationStatus[1].checked)
{
if(document.entry.Istat.value=="")
{
alert("Please Enter your ImmigrationStatus in the box provided");
document.entry.Istat.focus()
valid=false;
}
}


if(document.entry.GD.value=="")
{
alert("Please Fill in your  Graduation Date");
document.entry.GD.focus()
valid =false;
}
if(document.entry.GD.value!="")
{
    x = document.entry.GD.value ;
    
    if (x.length < 6 || x.length > 6)
	{
        alert("That is not a valid Graduation Date\n Please enter it in the format mmddyy.");
        document.entry.GD.value = ""
        document.entry.GD.focus()
         valid=false;
}
}
if(document.entry.Email.value=="")
{
alert("Please Fill in your  Email");
valid =false;
}
if(document.entry.Email.value!="")
{
var str=entry.Email.value;
var re=/^[A-Za-z0-9_\-]+([.][A-Za-z0-9_\-]+)*[@][A-Za-z0-9_\-]+([.][a-zA-Z0-9_]+)+$/;
if(!re.test(str))
{
window.alert("Invalid Address  Enter Something like (sss@yahoo.com)");
document.entry.Email.value=""
document.entry.Email.focus()
return false;
}
}
return valid;
}