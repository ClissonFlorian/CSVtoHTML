# CSVtoHTML
Powershell script to create an HTML file from CSV files located in a directory



 
This is Powershell script to create an HTML file from CSV(s) located in a directory



#Prerequisites

You must specify the folder location which contains the CSV Files for that :

- Open and Edit the below variable 
```shell
   $Pathfiles = $ScriptDir + "\Hyper-V_ExportFiles\Nodes\"
```



#Setting
If you want to change the background color of the columns header you must change this variable :
```shell
$backgroundColorHeader = "#f3f3f3"
```


#How to Start the Script 

Open Powershell, go to the script location and type:

`.\Build_HTMLReport_From_CSVFiles.ps1`


#Screenshot

![Image](https://raw.githubusercontent.com/ClissonFlorian/CSVtoHTML/master/CSVtoHTML.png)


#Next Features

-  Add function which allow to send the report by email

- Add parameters in the script which allow to specify:
	-  directly the folder containing the CSV(s) files

    -  the export location

    -  the parameters necessary to send the report by email ( smpt server , email address etc...)


#License

    Copyright (C) 2016 Mr Byb

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
