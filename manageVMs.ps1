Connect-AzAccount

Get-AzSubscription | Format-List -Property Id, Name

$subscriptId = Read-Host -Prompt 'Enter the ID of the subscription you want to use'

Set-AzContext -SubscriptionId $subscriptId
Get-AzVM  -Status | Format-List -Property Name,ResourceGroupName, PowerState

$changeVMstate = Read-Host -Prompt 'Do you want to change VM state? (yes/no)'

while ($changeVMstate -eq 'yes'){

    Write-Output "`n1. Start a VM"
    Write-Output "2. Stop a VM"

    $option = Read-Host -Prompt 'Choose an option (1,2)'

    $resourceGrpName = Read-Host -Prompt 'Enter resource group name'
    $vmName = Read-Host -Prompt 'Enter vm name'

    if ($option -eq 1){
        Start-AzVM -ResourceGroupName $resourceGrpName -Name $vmName
    }
    elseif ($option -eq 2){
        Stop-AzVM -ResourceGroupName $resourceGrpName -Name $vmName

    }
    Get-AzVM  -Status | Format-List -Property Name,ResourceGroupName, PowerState
    $changeVMstate = Read-Host -Prompt 'Do you want to start or stop a VM? (yes/no)'
}

Read-Host -Prompt "Press Enter to exit"

