local discord = GetPlayerIdentifierByType(src,'discord')
local pData = QBCore.Functions.GetPlayer(src)
local cid = pData.PlayerData.citizenid
MySQL.scalar('SELECT discord FROM players WHERE citizenid = ?',{cid} ,function(Ddata)
    if Ddata ~= 'nil' then 
        if Ddata ~= discord:sub(9) then 
            DropPlayer(src, 'DISCORD DUP DETTECTED\nyou can not join the game with this discord ')
            TriggerEvent("qb-log:server:CreateLog", "anticheat", "Anti DUP discord", "red", "tried to join with this discord : <@"..discord:sub(9) .."> the first discord it's this one <@"..Ddata..">")
        end
    else
        MySQL.update('UPDATE players SET discord = ? WHERE citizenid = ?', {discord:sub(9), cid})
    end
end)
