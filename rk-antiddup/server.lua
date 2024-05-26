local discord = GetPlayerIdentifierByType(src,'discord')
local pData = QBCore.Functions.GetPlayer(src)
local cid = pData.PlayerData.citizenid
MySQL.scalar('SELECT discord FROM players WHERE citizenid = ?',{cid},function(DID)
    if DID ~= 'nil' then 
        if DID ~= discord:sub(9) then 
            DropPlayer(src, 'DISCORD DUP DETTECTED\nyou can not join the game with this discord ')
        end
    else
        MySQL.update('UPDATE players SET discord = ? WHERE citizenid = ?', {discord:sub(9), cid})
    end
end)