#region Main Variable
#----------------

#Title HTML Report
$TitleHTML = "HTML - Report"

#Find this Script Location
$ScriptDir = split-path -parent $MyInvocation.MyCommand.Path

#CSV(s) Folder Path
$Pathfiles = $ScriptDir + "\Hyper-V_ExportFiles\Nodes\"

#List CSV(s) files from Folder define 
$csvfiles = @(Get-ChildItem $Pathfiles)

#Export FileName
$ExportFileName = "BuildAutoReport.html"

#Export Path 
$ExportFile = $ScriptDir+"\"+$ExportFileName

#Date generate file
$DataDate = date


#Define the Background Color on title of csv file
$backgroundColorHeader = "#f3f3f3"

#endregion






$outHtmlStart =""

###################################################
#IMPORT FILES

$IMPORT_TO = $ScriptDir+"\Hyper-V_ExportFiles\Nodes"


#region HTML Start
#----------------

# HTML Head
$outHtmlStart = "<!DOCTYPE html>
<html>
<head>
<title>$TitleHTML</title>
<style>
/*Reset CSS*/
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, 
time, mark, audio, video {margin: 0;padding: 0;border: 0;font-size: 100%;font: inherit;vertical-align: baseline;}
ol, ul {list-style: none;}
blockquote, q {quotes: none;}
blockquote:before, blockquote:after,
q:before, q:after {content: '';content: none;}
table {border-collapse: collapse;border-spacing: 0;}
/*Reset CSS*/

body{
    width:100%;
    min-width:1024px;
    font-family: Verdana, sans-serif;
    font-size:14px;
    /*font-weight:300;*/
    line-height:1.5;
    color:#222222;
    background-color:#fcfcfc;
}

p{
    color:222222;
}

strong{
    font-weight:600;
}

h1{
    font-size:30px;
    font-weight:300;
}

h2{
    font-size:20px;
    font-weight:300;
}

#ReportBody{
    width:95%;
    height:500;
    /*border: 1px solid;*/
    margin: 0 auto;
}



.DATAs{
    width:100%;
    /*height:200px;*/
    /*border: 1px solid;*/
    float:left;
    margin-bottom:22px;
    line-height:1.5;
}

table{
    width:100%;
    min-width:1280px;
    /*table-layout: fixed;*/
    /*border-collapse: collapse;*/
    border: 1px solid #CCCCCC;
    /*margin-bottom:15px;*/
}

/*Row*/
tr{
    font-size: 12px;
}

/*Column*/
td {
    padding:10px 8px 10px 8px;
    font-size: 12px;
    border: 1px solid #CCCCCC;
    text-align:center;
    vertical-align:middle;
}

/*Table Heading*/
th {
    background: $backgroundColorHeader;
    border: 1px solid #CCCCCC;
    font-size: 14px;
    font-weight:normal;
    padding:12px;
    text-align:center;
    vertical-align:middle;
}

</style>
</head>
<body>
<br><br>
<center><h1>$TitleHTML</h1></center>
<center><font face=""Verdana,sans-serif"" size=""3"" color=""#222222"">Datas update on $($DataDate)</font></center>
$($hlString)
<br>
<div id=""ReportBody""><!--Start ReportBody-->"

#endregion

      
    
    
#region Read CSV and Build Html
#------------------------------ 
       
foreach($csvfile in $csvfiles)
{
       
           
    # assign csv data to a variable (optional)
       
    $csv = import-csv "$IMPORT_TO\$csvfile"

           
    $hearderNames = ($csv | Get-member -MemberType 'NoteProperty' | Select-Object -ExpandProperty 'Name')
        
    
    Write-Host "CSV File :" $csvfile.Name -ForegroundColor Green `n 

    $hearderName =""
    $i=1

    $TitleHeader =""
    foreach($hearderName in $hearderNames)
    {
       
            if($i -eq 1)
            {
                $StartHeader = "<th><p style=""text-align:left;margin-left:-4px"">$hearderName</p></th>"

            }else
            {
                $TitleHeader += "<th><p>$hearderName</p></th>" 
            }
              
            $i++
    }
         
                      
    #define date table
    $outConfigFilesStart =""     
    $i = 0
    $data =""
            
    $csv | ForEach-Object{
                             
            $hns =1
            foreach($hearderName in $hearderNames)
            {
                                    
                if($hns -eq 1)
                {
                  
                    $data+="<tr style=""background:$($vmTableTrBgColor)""><!--Data Line-->"

                }
                               
                $data += "<td rowspan=""$($rowSpanCount)""><p style=""text-align:left"">$($_.$hearderName)</p></td>"
                $hns++
                
            }
        }
                   
                 
        $buildhearderTable = $StartHeader+$TitleHeader
          
        $outConfigFilesStart += "
        <div class=""DATAs""><!--Start DATA Class-->
        <table>
        <h2>$csvnodefile</h2><br>
        <tbody>
        <tr><!--Header Line-->$buildhearderTable</tr>"
    				  
        $outConfigFilesTable +=$data
     
        #ALL IS IN THIS VARIABLE "$DATA"
        $outAllFiles += $outConfigFilesStart + $outConfigFilesTable       
                   
        $outConfigFilesStart =""
        $outConfigFilesTable =""
}
 

#endregion        


#Concatenate Data 
$outFullHTML =  $outHtmlStart + $outAllFiles


#Export File
$outFullHTML | Out-File $ExportFile

Write-Host `n 
Write-Host "Export to ... "$ExportFile -ForegroundColor Yellow

