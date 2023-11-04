function DeductCurrency(player, amount)
    -- ตรวจสอบว่าผู้เล่นมีตังเพียงพอหรือไม่
    if player.leaderstats.Money.Value >= amount then
        player.leaderstats.Money.Value = player.leaderstats.Money.Value - amount
        return true -- การลดตังสำเร็จ
    else
        return false -- ไม่มีตังเพียงพอ
    end
end
