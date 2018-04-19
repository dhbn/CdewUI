--
function sp(f,i) 
    tr="TOPRIGHT";
    f2=f.debuffFrames;
    s=f2[1]:GetWidth();
    f3=f2[i];f3:SetSize(s,s);
    f3:ClearAllPoints();
        if i>6 
            then f3:SetPoint("BOTTOMRIGHT",f2[i-3],tr,0,0) 
            else f3:SetPoint(tr,f2[1],tr,-(s*(i-3)),0) 
            end 
        end

 function CBF(f,i) 
      bf=CreateFrame("Button",f:GetName().."Debuff"..i,f,"CompactDebuffTemplate");
       bf.baseSize=22;bf:SetSize(f.buffFrames[1]:GetSize()) end;
        
 function mv(f) 
    for i=4,12 do sp(f,i) 
       end 
   end

-- shows more buffs next to frame --
CBT="CompactDebuffTemplate"; function mb(ff3)for p=7,12 do ff3.debuffFrames[p]:ClearAllPoints(); ff3.debuffFrames[p]:SetPoint("BOTTOMRIGHT", ff3.debuffFrames[p-3], "TOPRIGHT", 0, 0)end end;

function CBF(pr,i) bf=CreateFrame("Button",pr:GetName().."Debuff"..i,pr,CBT);bf.baseSize=22;end;function mv(u) mb(u);for k=4,6 do f2=u.debuffFrames[k];f2:ClearAllPoints();f2:SetPoint("TOPRIGHT", u.debuffFrames[1], "TOPRIGHT", -(22*(k-3)), 0) end end;

function mv3(t) CompactUnitFrame_SetMaxDebuffs(t,12);if(type(t.debuffFrames)=="table") then if(not t.debuffFrames[4]) then for j=4,12 do CBF(t,j) end end mv(t) end end;hooksecurefunc("CompactUnitFrame_UpdateDebuffs",function(f) mv3(f) end);

-- sort so player always on bottom --
LoadAddOn("Blizzard_CompactRaidFrames") CRFSort_Group=function(t1, t2) if UnitIsUnit(t1,"player") then return false elseif UnitIsUnit(t2,"player") then return true else return t1 < t2 end end CompactRaidFrameContainer.flowSortFunc=CRFSort_Group

-- show arena123 on nameplate--
local U=UnitIsUnit hooksecurefunc("CompactUnitFrame_UpdateName",function(F)if IsActiveBattlefieldArena()and F.unit:find("nameplate")then for i=1,5 do if U(F.unit,"arena"..i)then F.name:SetText(i)F.name:SetTextColor(1,1,0)break end end end end)

-- hide keytext --
--
for i = 1, 12 do 
	_G["MultiBarBottomLeftButton"..i.."HotKey"]:SetAlpha(0)
	_G["MultiBarBottomLeftButton"..i.."Name"]:SetAlpha(0)
	
	_G["MultiBarBottomRightButton"..i.."HotKey"]:SetAlpha(0)
	_G["MultiBarBottomRightButton"..i.."Name"]:SetAlpha(0)

	_G["ActionButton"..i.."HotKey"]:SetAlpha(0)
	_G["ActionButton"..i.."Name"]:SetAlpha(0)

	_G["MultiBarLeftButton"..i.."HotKey"]:SetAlpha(0)
	_G["MultiBarLeftButton"..i.."Name"]:SetAlpha(0)

	_G["MultiBarRightButton"..i.."HotKey"]:SetAlpha(0)
	_G["MultiBarRightButton"..i.."Name"]:SetAlpha(0)

	
end

for i = 1, 10 do 
	_G["PetActionButton"..i.."HotKey"]:SetAlpha(0) 
end

--
