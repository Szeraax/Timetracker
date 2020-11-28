Add-Type -AssemblyName System.Windows.Forms

$Form = New-Object system.Windows.Forms.Form
$Form.Text = "CAPTURE USER"
$Form.Width = 600
$Form.Height = 600
$Form.AutoScroll = $True


$label = New-Object Windows.Forms.Label
$label.Location = New-Object Drawing.Point 50,30
$label.Size = New-Object Drawing.Point 250,30
$label.text = "ENTER NOTE"
$Form.Controls.Add($label)

$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(50,300)
$listBox.Size = New-Object System.Drawing.Size(250,30)
$listBox.Height = 130
[void] $listBox.Items.Add('5')
[void] $listBox.Items.Add('10')
[void] $listBox.Items.Add('15')
[void] $listBox.Items.Add('20')
[void] $listBox.Items.Add('30')
[void] $listBox.Items.Add('45')
[void] $listBox.Items.Add('60')
$form.Controls.Add($listBox)

$textfield = New-Object Windows.Forms.TextBox
$textfield.Location = New-Object Drawing.Point 50,60
$textfield.Size = New-Object Drawing.Point 500,200
$textfield.Multiline = $True
$Form.Controls.Add($textfield)

$CLCV = New-Object Windows.Forms.Button
$CLCV.text = "CLCV"
$CLCV.Location = New-Object Drawing.Point 100,500
$CLCV.DialogResult = [System.Windows.Forms.DialogResult]::OK
$CLCV.Add_Click({$global:z=$textfield.Text})
$form.AcceptButton = $CLCV
$form.Controls.Add($CLCV)

$RRNetwork = New-Object Windows.Forms.Button
$RRNetwork.text = "RRNetwork"
$RRNetwork.Location = New-Object Drawing.Point 200,500
$RRNetwork.DialogResult = [System.Windows.Forms.DialogResult]::OK
$RRNetwork.Add_Click({$global:y=$textfield.Text})
$form.AcceptButton = $RRNetwork
$form.Controls.Add($RRNetwork)

$First5 = New-Object Windows.Forms.Button
$First5.text = "First5"
$First5.Location = New-Object Drawing.Point 300,500
$First5.DialogResult = [System.Windows.Forms.DialogResult]::OK
$First5.Add_Click({$global:x=$textfield.Text})
$form.AcceptButton = $First5
$form.Controls.Add($First5)


$other = New-Object Windows.Forms.Button
$other.text = "Other"
$other.Location = New-Object Drawing.Point 400,500
$other.DialogResult = [System.Windows.Forms.DialogResult]::OK
$other.Add_Click({$global:o=$textfield.Text})
$form.AcceptButton = $other
$form.Controls.Add($other)

$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $global:time = $listBox.SelectedItem
   
}



if ($x -ne $null)
{
    $stuff=$x
    $client = "First5"
    New-Object -TypeName PSCustomObject -Property @{


Who = $client
Note = $stuff
Time = $time

} | Export-Csv -Path c:\temp\notes.csv -NoTypeInformation -Append
}
if ($y -ne $null)
{
    $stuff = $y
    $client = "RRNetwork"
    New-Object -TypeName PSCustomObject -Property @{


Who = $client
Note = $stuff
Time = $time

} | Export-Csv -Path c:\temp\notes.csv -NoTypeInformation -Append
}
if ($z -ne $null)
{
    $stuff = $z
    $client = "CLCV"
    New-Object -TypeName PSCustomObject -Property @{


Who = $client
Note = $stuff
Time = $time

} | Export-Csv -Path c:\temp\notes.csv -NoTypeInformation -Append
}
if ($o -ne $null)
{
    $stuff = $o
    $client = "Other"
    New-Object -TypeName PSCustomObject -Property @{


Who = $client
Note = $stuff
Time = $time

} | Export-Csv -Path c:\temp\notes.csv -NoTypeInformation -Append
}

