# CSVtoHTML

 
This is Powershell script to create a HTML file from CSV(s) located in a directory.

The script create an Table in HTML for each CSV file found in the folder defined.



# Prerequisites

You must specify the folder location which contains the CSV Files for that :

Open and Edit the below variable :

```powershell
   $Pathfiles = $ScriptDir + "\Hyper-V_ExportFiles\Nodes\"
```



# Setting
If you want to change the background color of the columns header you must change this variable :
```powershell
$backgroundColorHeader = "#f3f3f3"
```


# How to Start the Script 

Open Powershell, go to the script location and type:

```powershell
.\Build_HTMLReport_From_CSVFiles.ps1
```




# Screenshot

![Image](https://raw.githubusercontent.com/ClissonFlorian/CSVtoHTML/master/CSVtoHTML.png)


# Next Features

* Add function which allow to send the report by email
* Add parameters in the script which allow to specify:
	* directly the folder containing the CSV(s) files
	* the export location
	* the parameters necessary to send the report by email ( smpt server , email address etc...)

