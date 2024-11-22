local function restartScript(scriptName)
    print('Restarting script: ' .. scriptName)
    StopResource(scriptName)
    StartResource(scriptName)
    print('Script ' .. scriptName .. ' successfully restarted.')
end

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        Citizen.Wait(restartTimer)
        for _, scriptName in ipairs(scriptsToRestart) do
            restartScript(scriptName)
        end
    end
end)
