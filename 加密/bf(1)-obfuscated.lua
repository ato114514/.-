local bai = {
    autofram = false,
    SelectToolWeapon = nil,
    fastacttack = false,
    daoyu = nil,
    autonew = false,
    SelectToolWeaponOld = nil,
    zidongzhuanqian = false,
    autojiansuiguo = false,
    autosjiguoshi = false,
    z = false,
    x = false,
    c = false,
    v = false,
    zhangshaxian = 17,
    usefasttp = false,
    fanwei=false,
    autonextland=false,
    autoraid=false,
    selectraid=nil
}
function notify(Title, Text, Duration)
    game.StarterGui:SetCore("SendNotification", {
        Title = Title,
        Text = Text,
        Icon = nil,
        Duration = Duration
    })
end

local placeId = game.PlaceId
if placeId == 2753915549 then
     OldWorld = true
elseif placeId == 4442272183 then
    NewWorld = true
elseif placeId == 7449423635 then
     ThreeWorld = true
end
function NoClip(NoClipVal)
    if not NoClipVal then
        if Clipping then
            Clipping:Disconnect()
        end
        return
    end
    Clipping = game:GetService("RunService").Stepped:connect(function()
        for i, v in next, game.Players.LocalPlayer.Character:GetChildren() do
            if v:IsA("Part") or v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end)
end
local Nonquest = false
function fasttp(p)
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
    repeat
        task.wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
    until (p.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 1500 and
        game.Players.LocalPlayer.Character.Humanoid.Health > 0
    wait()

end
function tp(P, notfasttp)
    NoClip(true)

    Distance = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 10 then

        Speed = 1000
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear), {
                CFrame = P + Vector3.new(0, 10, 0)
            }):Play()
    elseif Distance < 170 then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
        Speed = 350
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear), {
                CFrame = P + Vector3.new(0, 10, 0)
            }):Play()
    elseif Distance < 1000 then

        Speed = 450
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear), {
                CFrame = P + Vector3.new(0, 10, 0)
            }):Play()
    elseif Distance >= 1000 then
        if notfasttp == nil and bai.usefasttp == true then
            NoClip(false)
            fasttp(P)
            NoClip(true)
            task.wait(1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P

            task.wait(1)
            if (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 250 then
                NoClip(true)

                Speed = 150

                spawn(function()
                    repeat
                        wait()
                        spawn(function()
                            local part = Instance.new("Part", workspace)
                            part.Anchored = true
                            part.Size = Vector3.new(10, 0.1, 10)
                            part.Material = "Glass"
                            part.BrickColor = BrickColor.Random()
                            part.Transparency = 0.7
                            part.Position = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position +
                                                Vector3.new(0, -3.05, 0)
                            wait()
                            part.Destroy(part)
                        end)
                    until (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 100 and
                        game.Players.LocalPlayer.Character.Humanoid.Health > 0
                end)

                game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
                    TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear), {
                        CFrame = P + Vector3.new(0, 10, 0)
                    }):Play()

            end
        else

            NoClip(true)

            Speed = 150
            spawn(function()
                repeat
                    wait()
                    spawn(function()
                        local part = Instance.new("Part", workspace)
                        part.Anchored = true
                        part.Size = Vector3.new(10, 0.1, 10)
                        part.Material = "Glass"
                        part.BrickColor = BrickColor.Random()
                        part.Transparency = 0.7
                        part.Position = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position +
                                            Vector3.new(0, -3.05, 0)
                        wait()
                        part.Destroy(part)
                    end)
                until (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 100 and
                    game.Players.LocalPlayer.Character.Humanoid.Health > 0
            end)

            game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
                TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear), {
                    CFrame = P + Vector3.new(0, 10, 0)
                }):Play()

        end

    end

    NoClip(false)
end
function CheckQuest()
    local MyLevel = game.Players.LocalPlayer.Data.Level.Value

    if OldWorld then
        if MyLevel == 1 or MyLevel <= 9 then -- Bandit
            Nonquest = false
            Ms = "Bandit [Lv. 5]"
            NameQuest = "BanditQuest1"
            LevelQuest = 1
            NameMon = "Bandit"
            CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0,
                0.341998369, 0, 0.939700544)
            CFrameMon = CFrame.new(1353.44885, 3.40935516, 1376.92029, 0.776053488, -6.97791975e-08, 0.630666852,
                6.99138596e-08, 1, 2.4612488e-08, -0.630666852, 2.49917598e-08, 0.776053488)
        elseif MyLevel == 10 or MyLevel <= 14 then -- Monkey
            Nonquest = false
            Ms = "Monkey [Lv. 14]"
            NameQuest = "JungleQuest"
            LevelQuest = 1
            NameMon = "Monkey"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1402.74609, 98.5633316, 90.6417007, 0.836947978, 0, 0.547282517, -0, 1, -0,
                -0.547282517, 0, 0.836947978)
        elseif MyLevel == 15 or MyLevel <= 29 then -- Gorilla
            Nonquest = false
            Ms = "Gorilla [Lv. 20]"
            NameQuest = "JungleQuest"
            LevelQuest = 2
            NameMon = "Gorilla"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1267.89001, 66.2034225, -531.818115, -0.813996196, -5.25169774e-08, -0.580869019,
                -5.58769671e-08, 1, -1.21082593e-08, 0.580869019, 2.26011476e-08, -0.813996196)
        elseif MyLevel == 30 or MyLevel <= 89 then -- Galley Captain
            Nonquest = true
            Ms = "Galley Captain [Lv. 650]"
            NameQuest = "FountainQuest"
            LevelQuest = 2
            NameMon = "Galley Captain"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0,
                -0.996196866, 0, 0.087131381)
            CFrameMon = CFrame.new(5782.90186, 94.5326462, 4716.78174, 0.361808896, -1.24757526e-06, -0.932252586,
                2.16989656e-06, 1, -4.96097414e-07, 0.932252586, -1.84339774e-06, 0.361808896)
        elseif MyLevel == 90 or MyLevel <= 99 then -- Snow Bandits
            Nonquest = false
            Ms = "Snow Bandit [Lv. 90]"
            NameQuest = "SnowQuest"
            LevelQuest = 1
            NameMon = "Snow Bandits"
            CFrameQuest = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0,
                -0.939684391, 0, -0.342042685)
            CFrameMon = CFrame.new(1412.92346, 55.3503647, -1260.62036, -0.246266365, -0.0169920288, -0.969053388,
                0.000432241941, 0.999844253, -0.0176417865, 0.969202161, -0.00476344163, -0.246220857)
        elseif MyLevel == 100 or MyLevel <= 119 then -- Snowman
            Nonquest = false
            Ms = "Snowman [Lv. 100]"
            NameQuest = "SnowQuest"
            LevelQuest = 2
            NameMon = "Snowman"
            CFrameQuest = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0,
                -0.939684391, 0, -0.342042685)
            CFrameMon = CFrame.new(1376.86401, 97.2779999, -1396.93115, -0.986755967, 7.71178321e-08, -0.162211925,
                7.71531674e-08, 1, 6.08143536e-09, 0.162211925, -6.51427134e-09, -0.986755967)
        elseif MyLevel == 120 or MyLevel <= 149 then -- Chief Petty Officer
            Nonquest = false

            Ms = "Chief Petty Officer [Lv. 120]"
            NameQuest = "MarineQuest2"
            LevelQuest = 1
            NameMon = "Chief Petty Officer"
            CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-4882.8623, 22.6520386, 4255.53516, 0.273695946, -5.40380647e-08, -0.96181643,
                4.37720793e-08, 1, -4.37274998e-08, 0.96181643, -3.01326679e-08, 0.273695946)
        elseif MyLevel == 150 or MyLevel <= 174 then -- Sky Bandit
            Nonquest = false
            Ms = "Sky Bandit [Lv. 150]"
            NameQuest = "SkyQuest"
            LevelQuest = 1
            NameMon = "Sky Bandit"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0,
                -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-4959.51367, 365.39267, -2974.56812, 0.964867651, 7.74418396e-08, 0.262737453,
                -6.95931988e-08, 1, -3.91783708e-08, -0.262737453, 1.95171506e-08, 0.964867651)
        elseif MyLevel == 175 or MyLevel <= 189 then -- Dark Master
            Nonquest = false
            Ms = "Dark Master [Lv. 175]"
            NameQuest = "SkyQuest"
            LevelQuest = 2
            NameMon = "Dark Master"
            CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0,
                -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-5079.98096, 376.477356, -2194.17139, 0.465965867, -3.69776352e-08, 0.884802461,
                3.40249851e-09, 1, 4.00000886e-08, -0.884802461, -1.56281423e-08, 0.465965867)
        elseif MyLevel == 190 or MyLevel <= 209 then
            Nonquest = false
            Ms = "Prisoner [Lv. 190]"
            LevelQuest = 1
            NameQuest = "PrisonerQuest"
            NameMon = "Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316,
                1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
            CFrameMon = CFrame.new(5433.39307, 88.678093, 514.986877, 0.879988372, 0, -0.474995494, 0, 1, 0,
                0.474995494, 0, 0.879988372)
        elseif MyLevel == 210 or MyLevel <= 249 then
            Nonquest = false
            Ms = "Dangerous Prisoner [Lv. 210]"
            LevelQuest = 2
            NameQuest = "PrisonerQuest"
            NameMon = "Dangerous Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316,
                1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
            CFrameMon = CFrame.new(5433.39307, 88.678093, 514.986877, 0.879988372, 0, -0.474995494, 0, 1, 0,
                0.474995494, 0, 0.879988372)
        elseif MyLevel == 250 or MyLevel <= 274 then -- Toga Warrior
            Nonquest = false
            Ms = "Toga Warrior [Lv. 250]"
            NameQuest = "ColosseumQuest"
            LevelQuest = 1
            NameMon = "Toga Warrior"
            CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931,
                -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
            CFrameMon = CFrame.new(-1779.97583, 44.6077499, -2736.35474, 0.984437346, 4.10396339e-08, 0.175734788,
                -3.62286876e-08, 1, -3.05844168e-08, -0.175734788, 2.3741821e-08, 0.984437346)
        elseif MyLevel == 275 or MyLevel <= 299 then -- Gladiato
            Nonquest = false
            Ms = "Gladiator [Lv. 275]"
            NameQuest = "ColosseumQuest"
            LevelQuest = 2
            NameMon = "Gladiato"
            CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931,
                -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
            CFrameMon = CFrame.new(-1274.75903, 58.1895943, -3188.16309, 0.464524001, 6.21005611e-08, 0.885560572,
                -4.80449414e-09, 1, -6.76054768e-08, -0.885560572, 2.71497012e-08, 0.464524001)
        elseif MyLevel == 300 or MyLevel <= 329 then -- Military Soldier
            Nonquest = false
            Ms = "Military Soldier [Lv. 300]"
            NameQuest = "MagmaQuest"
            LevelQuest = 1
            NameMon = "Military Soldier"
            CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669,
                -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
            CFrameMon = CFrame.new(-5363.01123, 41.5056877, 8548.47266, -0.578253984, -3.29503091e-10, 0.815856814,
                9.11209668e-08, 1, 6.498761e-08, -0.815856814, 1.11920997e-07, -0.578253984)
        elseif MyLevel == 330 or MyLevel <= 374 then -- Military Spy
            Nonquest = false
            Ms = "Military Spy [Lv. 325]"
            NameQuest = "MagmaQuest"
            LevelQuest = 2
            NameMon = "Military Spy"
            CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669,
                -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
            CFrameMon = CFrame.new(-5787.99023, 120.864456, 8762.25293, -0.188358366, -1.84706277e-08, 0.982100308,
                -1.23782129e-07, 1, -4.93306951e-09, -0.982100308, -1.22495649e-07, -0.188358366)
        elseif MyLevel == 375 or MyLevel <= 399 then -- Fishman Warrior
            Nonquest = false
            Ms = "Fishman Warrior [Lv. 375]"
            NameQuest = "FishmanQuest"
            LevelQuest = 1
            NameMon = "Fishman Warrior"
            CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574,
                -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
            CFrameMon = CFrame.new(60946.6094, 48.6735229, 1525.91687, -0.0817126185, 8.90751153e-08, 0.996655822,
                2.00889794e-08, 1, -8.77269599e-08, -0.996655822, 1.28533992e-08, -0.0817126185)
        elseif MyLevel == 400 or MyLevel <= 449 then -- Fishman Commando
            Nonquest = false
            Ms = "Fishman Commando [Lv. 400]"
            NameQuest = "FishmanQuest"
            LevelQuest = 2
            NameMon = "Fishman Commando"
            CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504)
            CFrameMon = CFrame.new(60946.6094, 48.6735229, 1525.916871)
        elseif MyLevel == 450 or MyLevel <= 474 then
            Nonquest = false
            Ms = "God's Guard [Lv. 450]"
            NameQuest = "SkyExp1Quest"
            LevelQuest = 1
            NameMon = "God's Guards"
            CFrameQuest = CFrame.new(-4721.71436, 845.277161, -1954.20105)
            CFrameMon = CFrame.new(-4716.95703, 853.089722, -1933.925427)
        elseif MyLevel == 475 or MyLevel <= 524 then
            Nonquest = false
            Ms = "Shanda [Lv. 475]"
            NameQuest = "SkyExp1Quest"
            LevelQuest = 2
            NameMon = "Shandas"
            CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0,
                -0.906319618, 0, -0.422592998)
            CFrameMon = CFrame.new(-7904.57373, 5584.37646, -459.62973, 0.65171206, 5.11171692e-08, 0.758466363,
                -4.76232476e-09, 1, -6.33034247e-08, -0.758466363, 3.76435416e-08, 0.65171206)
        elseif MyLevel == 525 or MyLevel <= 549 then -- Royal Squad
            Nonquest = false
            Ms = "Royal Squad [Lv. 525]"
            NameQuest = "SkyExp2Quest"
            LevelQuest = 1
            NameMon = "Royal Squad"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-7555.04199, 5606.90479, -1303.24744, -0.896107852, -9.6057462e-10, -0.443836004,
                -4.24974544e-09, 1, 6.41599973e-09, 0.443836004, 7.63560326e-09, -0.896107852)
        elseif MyLevel == 550 or MyLevel <= 624 then -- Royal Soldier
            Nonquest = false
            Ms = "Royal Soldier [Lv. 550]"
            NameQuest = "SkyExp2Quest"
            LevelQuest = 2
            NameMon = "Royal Soldier"
            CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            CFrameMon = CFrame.new(-7837.31152, 5649.65186, -1791.08582, -0.716008604, 0.0104285581, -0.698013008,
                5.02521061e-06, 0.99988848, 0.0149335321, 0.69809103, 0.0106890313, -0.715928733)
        elseif MyLevel == 625 or MyLevel <= 649 then -- Galley Pirate
            Nonquest = false
            Ms = "Galley Pirate [Lv. 625]"
            NameQuest = "FountainQuest"
            LevelQuest = 1
            NameMon = "Galley Pirate"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0,
                -0.996196866, 0, 0.087131381)
            CFrameMon = CFrame.new(5569.80518, 38.5269432, 3849.01196, 0.896460414, 3.98027495e-08, 0.443124533,
                -1.34262139e-08, 1, -6.26611296e-08, -0.443124533, 5.02237434e-08, 0.896460414)
        elseif MyLevel >= 650 then -- Galley Captain
            Nonquest = false
            Ms = "Galley Captain [Lv. 650]"
            NameQuest = "FountainQuest"
            LevelQuest = 2
            NameMon = "Galley Captain"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0,
                -0.996196866, 0, 0.087131381)
            CFrameMon = CFrame.new(5782.90186, 94.5326462, 4716.78174, 0.361808896, -1.24757526e-06, -0.932252586,
                2.16989656e-06, 1, -4.96097414e-07, 0.932252586, -1.84339774e-06, 0.361808896)
        end
    end
    if NewWorld then
        Nonquest = false
        if MyLevel == 700 or MyLevel <= 724 then -- Raider [Lv. 700]
            Ms = "Raider [Lv. 700]"
            NameQuest = "Area1Quest"
            LevelQuest = 1
            NameMon = "Raider"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0,
                0.974368095, 0, -0.22495985)
            CFrameMon = CFrame.new(-737.026123, 10.1748352, 2392.57959, 0.272128761, 0, -0.962260842, -0, 1, -0,
                0.962260842, 0, 0.272128761)
        elseif MyLevel == 725 or MyLevel <= 774 then -- Mercenary [Lv. 725]
            Ms = "Mercenary [Lv. 725]"
            NameQuest = "Area1Quest"
            LevelQuest = 2
            NameMon = "Mercenary"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0,
                0.974368095, 0, -0.22495985)
            CFrameMon = CFrame.new(-1022.21271, 72.9855194, 1891.39148, -0.990782857, 0, -0.135460541, 0, 1, 0,
                0.135460541, 0, -0.990782857)
        elseif MyLevel == 775 or MyLevel <= 799 then -- Swan Pirate [Lv. 775]
            Ms = "Swan Pirate [Lv. 775]"
            NameQuest = "Area2Quest"
            LevelQuest = 1
            NameMon = "Swan Pirate"
            CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376,
                0, 0.139203906)
            CFrameMon = CFrame.new(976.467651, 111.174057, 1229.1084, 0.00852567982, -4.73897828e-08, -0.999963999,
                1.12251888e-08, 1, -4.7295778e-08, 0.999963999, -1.08215579e-08, 0.00852567982)
        elseif MyLevel == 800 or MyLevel <= 874 then -- Factory Staff [Lv. 800]
            Ms = "Factory Staff [Lv. 800]"
            NameQuest = "Area2Quest"
            LevelQuest = 2
            NameMon = "Factory Staff"
            CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376,
                0, 0.139203906)
            CFrameMon = CFrame.new(336.74585, 73.1620483, -224.129272, 0.993632793, 3.40154607e-08, 0.112668738,
                -3.87658332e-08, 1, 3.99718729e-08, -0.112668738, -4.40850592e-08, 0.993632793)
        elseif MyLevel == 875 or MyLevel <= 899 then -- Marine Lieutenant [Lv. 875]
            Ms = "Marine Lieutenant [Lv. 875]"
            NameQuest = "MarineQuest3"
            LevelQuest = 1
            NameMon = "Marine Lieutenant"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0,
                -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-2842.69922, 72.9919434, -2901.90479, -0.762281299, 0, -0.64724648, 0, 1.00000012, 0,
                0.64724648, 0, -0.762281299)
        elseif MyLevel == 900 or MyLevel <= 949 then -- Marine Captain [Lv. 900]
            Ms = "Marine Captain [Lv. 900]"
            NameQuest = "MarineQuest3"
            LevelQuest = 2
            NameMon = "Marine Captain"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0,
                -0.500031412, 0, 0.866007268)
            CFrameMon = CFrame.new(-1814.70313, 72.9919434, -3208.86621, -0.900422215, 7.93464423e-08, -0.435017526,
                3.68856199e-08, 1, 1.06050372e-07, 0.435017526, 7.94441988e-08, -0.900422215)
        elseif MyLevel == 950 or MyLevel <= 974 then -- Zombie [Lv. 950]
            Ms = "Zombie [Lv. 950]"
            NameQuest = "ZombieQuest"
            LevelQuest = 1
            NameMon = "Zombie"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0,
                0.95628953, 0, -0.29242146)
            CFrameMon = CFrame.new(-5649.23438, 126.0578, -737.773743, 0.355238914, -8.10359282e-08, 0.934775114,
                1.65461245e-08, 1, 8.04023372e-08, -0.934775114, -1.3095117e-08, 0.355238914)
        elseif MyLevel == 975 or MyLevel <= 999 then -- Vampire [Lv. 975]
            Ms = "Vampire [Lv. 975]"
            NameQuest = "ZombieQuest"
            LevelQuest = 2
            NameMon = "Vampire"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0,
                0.95628953, 0, -0.29242146)
            CFrameMon = CFrame.new(-6030.32031, 0.4377408, -1313.5564, -0.856965423, 3.9138893e-08, -0.515373945,
                -1.12178942e-08, 1, 9.45958547e-08, 0.515373945, 8.68467822e-08, -0.856965423)
        elseif MyLevel == 1000 or MyLevel <= 1049 then -- Snow Trooper [Lv. 1000] **
            Ms = "Snow Trooper [Lv. 1000]"
            NameQuest = "SnowMountainQuest"
            LevelQuest = 1
            NameMon = "Snow Trooper"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0,
                -0.92718488, 0, -0.374604106)
            CFrameMon = CFrame.new(621.003418, 391.361053, -5335.43604, 0.481644779, 0, 0.876366913, 0, 1, 0,
                -0.876366913, 0, 0.481644779)
        elseif MyLevel == 1050 or MyLevel <= 1099 then -- Winter Warrior [Lv. 1050]
            Ms = "Winter Warrior [Lv. 1050]"
            NameQuest = "SnowMountainQuest"
            LevelQuest = 2
            NameMon = "Winter Warrior"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0,
                -0.92718488, 0, -0.374604106)
            CFrameMon = CFrame.new(1295.62683, 429.447784, -5087.04492, -0.698032081, -8.28980049e-08, -0.71606636,
                -1.98835952e-08, 1, -9.63858184e-08, 0.71606636, -5.30424877e-08, -0.698032081)
        elseif MyLevel == 1100 or MyLevel <= 1124 then -- Lab Subordinate [Lv. 1100]
            Ms = "Lab Subordinate [Lv. 1100]"
            NameQuest = "IceSideQuest"
            LevelQuest = 1
            NameMon = "Lab Subordinate"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0,
                0.891015649, 0, 0.453972578)
            CFrameMon = CFrame.new(-5769.2041, 37.9288292, -4468.38721, -0.569419742, -2.49055017e-08, 0.822046936,
                -6.96206541e-08, 1, -1.79282633e-08, -0.822046936, -6.74401548e-08, -0.569419742)
        elseif MyLevel == 1125 or MyLevel <= 1174 then -- Horned Warrior [Lv. 1125]
            Ms = "Horned Warrior [Lv. 1125]"
            NameQuest = "IceSideQuest"
            LevelQuest = 2
            NameMon = "Horned Warrior"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0,
                0.891015649, 0, 0.453972578)
            CFrameMon = CFrame.new(-6401.27979, 15.9775667, -5948.24316, 0.388303697, 0, -0.921531856, 0, 1, 0,
                0.921531856, 0, 0.388303697)
        elseif MyLevel == 1175 or MyLevel <= 1199 then -- Magma Ninja [Lv. 1175]
            Ms = "Magma Ninja [Lv. 1175]"
            NameQuest = "FireSideQuest"
            LevelQuest = 1
            NameMon = "Magma Ninja"
            CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0,
                -0.469463557, 0, -0.882952213)
            CFrameMon = CFrame.new(-5466.06445, 57.6952019, -5837.42822, -0.988835871, 0, -0.149006829, 0, 1, 0,
                0.149006829, 0, -0.988835871)
        elseif MyLevel == 1200 or MyLevel <= 1249 then
            Ms = "Lava Pirate [Lv. 1200]"
            NameQuest = "FireSideQuest"
            LevelQuest = 2
            NameMon = "Lava Pirate"
            CFrameQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295,
                -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
            CFrameMon = CFrame.new(-5169.71729, 34.1234779, -4669.73633, -0.196780294, 0, 0.98044765, 0, 1.00000012, -0,
                -0.98044765, 0, -0.196780294)
        elseif MyLevel == 1250 or MyLevel <= 1274 then
            Ms = "Ship Deckhand [Lv. 1250]"
            NameQuest = "ShipQuest1"
            LevelQuest = 1
            NameMon = "Ship Deckhand"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012,
                -0, 0.96964103, 0, -0.244533136)
            CFrameMon = CFrame.new(1163.80872, 138.288452, 33058.4258, -0.998580813, 5.49076979e-08, -0.0532564968,
                5.57436763e-08, 1, -1.42118655e-08, 0.0532564968, -1.71604082e-08, -0.998580813)
        elseif MyLevel == 1275 or MyLevel <= 1299 then
            Ms = "Ship Engineer [Lv. 1275]"
            NameQuest = "ShipQuest1"
            LevelQuest = 2
            NameMon = "Ship Engineer"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012,
                -0, 0.96964103, 0, -0.244533136)
            CFrameMon = CFrame.new(921.30249023438, 125.400390625, 32937.34375)
        elseif MyLevel == 1300 or MyLevel <= 1324 then
            Ms = "Ship Steward [Lv. 1300]"
            NameQuest = "ShipQuest2"
            LevelQuest = 1
            NameMon = "Ship Steward"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836,
                1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
            CFrameMon = CFrame.new(917.96057128906, 136.89932250977, 33343.4140625)
        elseif MyLevel == 1325 or MyLevel <= 1349 then
            Ms = "Ship Officer [Lv. 1325]"
            NameQuest = "ShipQuest2"
            LevelQuest = 2
            NameMon = "Ship Officer"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836,
                1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
            CFrameMon = CFrame.new(944.44964599609, 181.40081787109, 33278.9453125)
        elseif MyLevel == 1350 or MyLevel <= 1374 then
            Ms = "Arctic Warrior [Lv. 1350]"
            NameQuest = "FrostQuest"
            LevelQuest = 1
            NameMon = "Arctic Warrior"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0,
                0.358349502, 0, -0.933587909)
            CFrameMon = CFrame.new(5878.23486, 81.3886948, -6136.35596, -0.451037169, 2.3908234e-07, 0.892505825,
                -1.08168464e-07, 1, -3.22542007e-07, -0.892505825, -2.4201924e-07, -0.451037169)
        elseif MyLevel == 1375 or MyLevel <= 1424 then -- Snow Lurker [Lv. 1375]
            Ms = "Snow Lurker [Lv. 1375]"
            NameQuest = "FrostQuest"
            LevelQuest = 2
            NameMon = "Snow Lurker"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0,
                0.358349502, 0, -0.933587909)
            CFrameMon = CFrame.new(5513.36865, 60.546711, -6809.94971, -0.958693981, -1.65617333e-08, 0.284439981,
                -4.07668654e-09, 1, 4.44854642e-08, -0.284439981, 4.14883701e-08, -0.958693981)
        elseif MyLevel == 1425 or MyLevel <= 1449 then -- Sea Soldier [Lv. 1425]
            Ms = "Sea Soldier [Lv. 1425]"
            NameQuest = "ForgottenQuest"
            LevelQuest = 1
            NameMon = "Sea Soldier"
            CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0,
                0.13915664, 0, 0.990270376)
            CFrameMon = CFrame.new(-3115.78223, 63.8785706, -9808.38574, -0.913427353, 3.11199457e-08, 0.407000452,
                7.79564235e-09, 1, -5.89660658e-08, -0.407000452, -5.06883708e-08, -0.913427353)
        elseif MyLevel >= 1450 then -- Water Fighter [Lv. 1450]
            Ms = "Water Fighter [Lv. 1450]"
            NameQuest = "ForgottenQuest"
            LevelQuest = 2
            NameMon = "Water Fighter"
            CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0,
                0.13915664, 0, 0.990270376)
            CFrameMon = CFrame.new(-3212.99683, 263.809296, -10551.8799, 0.742111444, -5.59139615e-08, -0.670276582,
                1.69155214e-08, 1, -6.46908234e-08, 0.670276582, 3.66697037e-08, 0.742111444)
        end
    end
    if ThreeWorld then
        if MyLevel >= 1500 and MyLevel <= 1524 then -- Pirate Millionaire [Lv. 1500]
            Ms = "Pirate Millionaire [Lv. 1500]"
            NameQuest = "PiratePortQuest"
            LevelQuest = 1
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0,
                0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
        elseif MyLevel >= 1525 and MyLevel <= 1574 then -- Pistol Billionaire [Lv. 1525]
            Ms = "Pistol Billionaire [Lv. 1525]"
            NameQuest = "PiratePortQuest"
            LevelQuest = 2
            NameMon = "Pistol Billionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0,
                0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
        elseif MyLevel >= 1575 and MyLevel <= 1599 then -- Dragon Crew Warrior [Lv. 1575]
            Ms = "Dragon Crew Warrior [Lv. 1575]"
            NameQuest = "AmazonQuest"
            LevelQuest = 1
            NameMon = "Dragon Crew Warrior"
            CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0,
                0.438378751, 0, 0.898790359)
            CFrameMon = CFrame.new(6241.9951171875, 51.522083282471, -1243.9771728516)
        elseif MyLevel >= 1600 and MyLevel <= 1624 then -- Dragon Crew Archer [Lv. 1600]
            Ms = "Dragon Crew Archer [Lv. 1600]"
            NameQuest = "AmazonQuest"
            LevelQuest = 2
            NameMon = "Dragon Crew Archer"
            CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0,
                0.438378751, 0, 0.898790359)
            CFrameMon = CFrame.new(6488.9155273438, 383.38375854492, -110.66246032715)
        elseif MyLevel >= 1625 and MyLevel <= 1649 then -- Female Islander [Lv. 1625]
            Ms = "Female Islander [Lv. 1625]"
            NameQuest = "AmazonQuest2"
            LevelQuest = 1
            NameMon = "Female Islander"
            CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(4770.4990234375, 758.95520019531, 1069.8680419922)
        elseif MyLevel >= 1650 and MyLevel <= 1699 then -- Giant Islander [Lv. 1650]
            Ms = "Giant Islander [Lv. 1650]"
            NameQuest = "AmazonQuest2"
            LevelQuest = 2
            NameMon = "Giant Islander"
            CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789)
        elseif MyLevel >= 1700 and MyLevel <= 1724 then -- Marine Commodore [Lv. 1700]
            Ms = "Marine Commodore [Lv. 1700]"
            NameQuest = "MarineTreeIsland"
            LevelQuest = 1
            NameMon = "Marine Commodore"
            CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0,
                -0.258804798, 0, -0.965929747)
            CFrameMon = CFrame.new(2490.0844726563, 190.4232635498, -7160.0502929688)
        elseif MyLevel >= 1725 and MyLevel <= 1774 then -- Marine Rear Admiral [Lv. 1725]
            Ms = "Marine Rear Admiral [Lv. 1725]"
            NameQuest = "MarineTreeIsland"
            LevelQuest = 2
            NameMon = "Marine Rear Admiral"
            CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0,
                -0.258804798, 0, -0.965929747)
            CFrameMon = CFrame.new(3951.3903808594, 229.11549377441, -6912.81640625)
        elseif MyLevel >= 1775 and MyLevel <= 1799 then -- Fishman Raider [Lv. 1775]
            Ms = "Fishman Raider [Lv. 1775]"
            NameQuest = "DeepForestIsland3"
            LevelQuest = 1
            NameMon = "Fishman Raider"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0,
                -0.469463557, 0, -0.882952213)
            CFrameMon = CFrame.new(-10322.400390625, 390.94473266602, -8580.0908203125)
        elseif MyLevel >= 1800 and MyLevel <= 1824 then -- Fishman Captain [Lv. 1800]
            Ms = "Fishman Captain [Lv. 1800]"
            NameQuest = "DeepForestIsland3"
            LevelQuest = 2
            NameMon = "Fishman Captain"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0,
                -0.469463557, 0, -0.882952213)
            CFrameMon = CFrame.new(-11194.541992188, 442.02795410156, -8608.806640625)
        elseif MyLevel >= 1825 and MyLevel <= 1849 then -- Forest Pirate [Lv. 1825]
            Ms = "Forest Pirate [Lv. 1825]"
            NameQuest = "DeepForestIsland"
            LevelQuest = 1
            NameMon = "Forest Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0,
                0.707079291, 0, 0.707134247)
            CFrameMon = CFrame.new(-13225.809570313, 428.19387817383, -7753.1245117188)
        elseif MyLevel >= 1850 and MyLevel <= 1899 then -- Mythological Pirate [Lv. 1850]
            Ms = "Mythological Pirate [Lv. 1850]"
            NameQuest = "DeepForestIsland"
            LevelQuest = 2
            NameMon = "Mythological Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0,
                0.707079291, 0, 0.707134247)
            CFrameMon = CFrame.new(-13869.172851563, 564.95251464844, -7084.4135742188)
        elseif MyLevel >= 1900 and MyLevel <= 1924 then -- Jungle Pirate [Lv. 1900]
            Ms = "Jungle Pirate [Lv. 1900]"
            NameQuest = "DeepForestIsland2"
            LevelQuest = 1
            NameMon = "Jungle Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0,
                -0.996196866, 0, -0.0871315002)
            CFrameMon = CFrame.new(-11982.221679688, 376.32522583008, -10451.415039063)
        elseif MyLevel >= 1925 and MyLevel <= 1974 then -- Musketeer Pirate [Lv. 1925]
            Ms = "Musketeer Pirate [Lv. 1925]"
            NameQuest = "DeepForestIsland2"
            LevelQuest = 2
            NameMon = "Musketeer Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0,
                -0.996196866, 0, -0.0871315002)
            CFrameMon = CFrame.new(-13282.3046875, 496.23684692383, -9565.150390625)
        elseif MyLevel >= 1975 and MyLevel <= 1999 then
            Ms = "Reborn Skeleton [Lv. 1975]"
            NameQuest = "HauntedQuest1"
            LevelQuest = 1
            NameMon = "Reborn Skeleton"
            CFrameQuest = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
            CFrameMon = CFrame.new(-8817.880859375, 191.16761779785, 6298.6557617188)
        elseif MyLevel >= 2000 and MyLevel <= 2024 then
            Ms = "Living Zombie [Lv. 2000]"
            NameQuest = "HauntedQuest1"
            LevelQuest = 2
            NameMon = "Living Zombie"
            CFrameQuest = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
            CFrameMon = CFrame.new(-10125.234375, 183.94705200195, 6242.013671875)
        elseif MyLevel >= 2025 and MyLevel <= 2049 then
            Ms = "Demonic Soul [Lv. 2025]"
            NameQuest = "HauntedQuest2"
            LevelQuest = 1
            NameMon = "Demonic Soul"
            CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
        elseif MyLevel >= 2050 and MyLevel <= 2074 then
            Ms = "Posessed Mummy [Lv. 2050]"
            NameQuest = "HauntedQuest2"
            LevelQuest = 2
            NameMon = "Posessed Mummy"
            CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
        elseif MyLevel >= 2075 and MyLevel <= 2099 then
            Ms = "Peanut Scout [Lv. 2075]"
            NameQuest = "NutsIslandQuest"
            LevelQuest = 1
            NameMon = "Peanut Scout"
            CFrameQuest = CFrame.new(-2104.17163, 38.1299706, -10194.418, 0.758814394, -1.38604395e-09, 0.651306927,
                2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, 0.758814394)
            CFrameMon = CFrame.new(-2098.07544, 192.611862, -10248.8867, 0.983392298, -9.57031787e-08, 0.181492642,
                8.7276355e-08, 1, 5.44169616e-08, -0.181492642, -3.76732068e-08, 0.983392298)
        elseif MyLevel >= 2100 and MyLevel <= 2124 then
            Ms = "Peanut President [Lv. 2100]"
            NameQuest = "NutsIslandQuest"
            LevelQuest = 2
            NameMon = "Peanut President"
            CFrameQuest = CFrame.new(-2104.17163, 38.1299706, -10194.418, 0.758814394, -1.38604395e-09, 0.651306927,
                2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, 0.758814394)
            CFrameMon = CFrame.new(-1876.95959, 192.610947, -10542.2939, 0.0553516336, -2.83836812e-08, 0.998466909,
                -6.89634405e-10, 1, 2.84654931e-08, -0.998466909, -2.26418861e-09, 0.0553516336)
        elseif MyLevel >= 2125 and MyLevel <= 2149 then
            Ms = "Ice Cream Chef [Lv. 2125]"
            NameQuest = "IceCreamIslandQuest"
            LevelQuest = 1
            NameMon = "Ice Cream Chef"
            CFrameQuest = CFrame.new(-820.404358, 65.8453293, -10965.5654, 0.822534859, 5.24448502e-08, -0.568714678,
                -2.08336317e-08, 1, 6.20846663e-08, 0.568714678, -3.92184099e-08, 0.822534859)
            CFrameMon = CFrame.new(-821.614075, 208.39537, -10990.7617, -0.870096624, 3.18909272e-08, 0.492881238,
                -1.8357893e-08, 1, -9.71107568e-08, -0.492881238, -9.35439957e-08, -0.870096624)
        elseif MyLevel >= 2150 and MyLevel <= 2199 then
            Ms = "Ice Cream Commander [Lv. 2150]"
            NameQuest = "IceCreamIslandQuest"
            LevelQuest = 2
            NameMon = "Ice Cream Commander"
            CFrameQuest = CFrame.new(-819.376526, 67.4634171, -10967.2832)
            CFrameMon = CFrame.new(-610.11669921875, 208.26904296875, -11253.686523438)
        elseif MyLevel >= 2200 and MyLevel <= 2224 then
            Ms = "Cookie Crafter [Lv. 2200]"
            NameQuest = "CakeQuest1"
            LevelQuest = 1
            NameMon = "Cookie Crafter"
            CFrameQuest = CFrame.new(-2020.6068115234375, 37.82400894165039, -12027.80859375)
            CFrameMon = CFrame.new(-2286.684326171875, 146.5656280517578, -12226.8818359375)
        elseif MyLevel >= 2225 and MyLevel <= 2249 then
            Ms = "Cake Guard [Lv. 2225]"
            NameQuest = "CakeQuest1"
            LevelQuest = 2
            NameMon = "Cake Guard"
            CFrameQuest = CFrame.new(-2020.6068115234375, 37.82400894165039, -12027.80859375)
            CFrameMon = CFrame.new(-1817.9747314453125, 209.5632781982422, -12288.9228515625)
        elseif MyLevel >= 2250 and MyLevel <= 2274 then
            Ms = "Baking Staff [Lv. 2250]"
            NameQuest = "CakeQuest2"
            LevelQuest = 1
            NameMon = "Baking Staff"
            CFrameQuest = CFrame.new(-1928.31763, 37.7296638, -12840.626)
            CFrameMon = CFrame.new(-1818.347900390625, 93.41275787353516, -12887.66015625)
        elseif MyLevel >= 2275 and MyLevel <= 2299 then
            Ms = "Head Baker [Lv. 2275]"
            NameQuest = "CakeQuest2"
            LevelQuest = 2
            NameMon = "Head Baker"
            CFrameQuest = CFrame.new(-1928.31763, 37.7296638, -12840.626)
            CFrameMon = CFrame.new(-2288.795166015625, 106.9419174194336, -12811.111328125)
        elseif MyLevel >= 2300 and MyLevel <= 2324 then

            Ms = "Cocoa Warrior [Lv. 2300]"
            NameQuest = "ChocQuest1"
            LevelQuest = 1
            NameMon = "Cocoa Warrior"
            CFrameQuest = CFrame.new(230.672729, 24.7600384, -12198.6787, 0.0864662081, -3.57646286e-08, 0.996254802,
                -1.19936757e-07, 1, 4.63085392e-08, -0.996254802, -1.23491688e-07, 0.0864662081)
            CFrameMon = CFrame.new(113.095558, 24.76017, -12222.2588, -0.205096737, -0, -0.978741765, -0, 1.00000012,
                -0, 0.978741765, 0, -0.205096737)
        elseif MyLevel >= 2325 and MyLevel <= 2349 then
            Ms = "Chocolate Bar Battler [Lv. 2325]"
            NameQuest = "ChocQuest1"
            LevelQuest = 2
            NameMon = "Chocolate Bar Battler"
            CFrameQuest = CFrame.new(230.672729, 24.7600384, -12198.6787, 0.0864662081, -3.57646286e-08, 0.996254802,
                -1.19936757e-07, 1, 4.63085392e-08, -0.996254802, -1.23491688e-07, 0.0864662081)
            CFrameMon = CFrame.new(692.89856, 24.7601948, -12636.0908, 0.538462341, 1.97431351e-08, -0.842649579,
                -9.54910995e-09, 1, 1.73278423e-08, 0.842649579, -1.28383693e-09, 0.538462341)
        elseif MyLevel >= 2350 and MyLevel <= 2374 then
            Ms = "Sweet Thief [Lv. 2350]"
            NameQuest = "ChocQuest2"
            LevelQuest = 1
            NameMon = "Sweet Thief"
            CFrameQuest = CFrame.new(150.149414, 24.819622, -12771.4277, 0.470252186, -2.10301021e-08, 0.88253206,
                2.87148101e-08, 1, 8.52875548e-09, -0.88253206, 2.13310756e-08, 0.470252186)
            CFrameMon = CFrame.new(-20.0258827, 24.8197575, -12634.4326, -0.849365354, -2.7608861e-08, -0.527805388,
                -2.61844342e-08, 1, -1.01717612e-08, 0.527805388, 5.18074383e-09, -0.849365354)
        elseif MyLevel >= 2375 and MyLevel <= 2399 then
            Ms = "Candy Rebel [Lv. 2375]"
            NameQuest = "ChocQuest2"
            LevelQuest = 2
            NameMon = "Candy Rebel"
            CFrameQuest = CFrame.new(150.149414, 24.819622, -12771.4277, 0.470252186, -2.10301021e-08, 0.88253206,
                2.87148101e-08, 1, 8.52875548e-09, -0.88253206, 2.13310756e-08, 0.470252186)
            CFrameMon = CFrame.new(98.1978378, 24.8196487, -12900.0508, 0.526558936, 1.68818879e-08, 0.850138605,
                -1.16490426e-08, 1, -1.26426212e-08, -0.850138605, -3.24621596e-09, 0.526558936)
        elseif MyLevel >= 2400 and MyLevel <= 2424 then
            Ms = "Candy Pirate [Lv. 2400]"
            NameQuest = "CandyQuest1"
            LevelQuest = 1
            NameMon = "Candy Rebel"
            CFrameQuest = CFrame.new(-1262.83508, 14.1289549, -14484.8926, 0.656263351, 0, -0.75453198, -0, 1.00000012,
                -0, 0.75453198, 0, 0.656263351)
            CFrameMon = CFrame.new(-1285.84497, 14.8212357, -14438.2764, -0.269966513, -5.61459039e-08, 0.962869704,
                -3.71530078e-08, 1, 4.78941615e-08, -0.962869704, -2.28436878e-08, -0.269966513)

        elseif MyLevel >= 2425 then
            Ms = "Snow Demon [Lv. 2425]"
            NameQuest = "CandyQuest1"
            LevelQuest = 2
            NameMon = "Snow Demon"
            CFrameQuest = CFrame.new(-1262.83508, 14.1289549, -14484.8926, 0.656263351, 0, -0.75453198, -0, 1.00000012,
                -0, 0.75453198, 0, 0.656263351)
            CFrameMon = CFrame.new(-925.529419, 14.8213062, -14388.7793, 0.97269249, 1.67055247e-09, -0.232097775,
                4.23684599e-09, 1, 2.49537102e-08, 0.232097775, -2.52556482e-08, 0.97269249)

        end

    else
        if OldWorld then
            if MyLevel == 1 or MyLevel <= 9 then -- Bandit
                Nonquest = false
                Ms = "Bandit [Lv. 5]"
                NameQuest = "BanditQuest1"
                LevelQuest = 1
                NameMon = "Bandit"
                CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0,
                    0.341998369, 0, 0.939700544)
                CFrameMon = CFrame.new(1353.44885, 3.40935516, 1376.92029, 0.776053488, -6.97791975e-08, 0.630666852,
                    6.99138596e-08, 1, 2.4612488e-08, -0.630666852, 2.49917598e-08, 0.776053488)
            elseif MyLevel == 10 or MyLevel <= 14 then -- Monkey
                Nonquest = false
                Ms = "Monkey [Lv. 14]"
                NameQuest = "JungleQuest"
                LevelQuest = 1
                NameMon = "Monkey"
                CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(-1402.74609, 98.5633316, 90.6417007, 0.836947978, 0, 0.547282517, -0, 1, -0,
                    -0.547282517, 0, 0.836947978)
            elseif MyLevel == 15 or MyLevel <= 29 then -- Gorilla
                Nonquest = false
                Ms = "Gorilla [Lv. 20]"
                NameQuest = "JungleQuest"
                LevelQuest = 2
                NameMon = "Gorilla"
                CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(-1267.89001, 66.2034225, -531.818115, -0.813996196, -5.25169774e-08,
                    -0.580869019, -5.58769671e-08, 1, -1.21082593e-08, 0.580869019, 2.26011476e-08, -0.813996196)
            elseif MyLevel >= 30 and MyLevel <= 40 - 1 then
                Nonquest = false
                Ms = "Pirate [Lv. 35]"
                NameQuest = "BuggyQuest1"
                LevelQuest = 1
                NameMon = "Pirate"
                CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0,
                    0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(-1169.5365, 5.09531212, 3933.84082, -0.971822679, -3.73200315e-09, 0.235713184,
                    -4.16762763e-10, 1, 1.41145424e-08, -0.235713184, 1.3618596e-08, -0.971822679)
            elseif MyLevel >= 40 and MyLevel <= 60 - 1 then
                Nonquest = false
                Ms = "Brute [Lv. 45]"
                NameQuest = "BuggyQuest1"
                LevelQuest = 2
                NameMon = "Brute"
                CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0,
                    0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(-1165.09985, 15.1531372, 4363.51514, -0.962800264, 1.17564889e-06, 0.270213336,
                    2.60172015e-07, 1, -3.4237969e-06, -0.270213336, -3.22613073e-06, -0.962800264)
            elseif MyLevel >= 60 and MyLevel <= 75 - 1 then
                Nonquest = false
                Ms = "Desert Bandit [Lv. 60]"
                NameQuest = "DesertQuest"
                LevelQuest = 1
                NameMon = "Desert Bandit"
                CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0,
                    0.573571265, 0, 0.819155693)
                CFrameMon = CFrame.new(932.788818, 6.8503746, 4488.24609, -0.998625934, 3.08948351e-08, 0.0524050146,
                    2.79967303e-08, 1, -5.60361286e-08, -0.0524050146, -5.44919629e-08, -0.998625934)
            elseif MyLevel >= 75 and MyLevel <= 90 - 1 then
                Nonquest = false
                Ms = "Desert Officer [Lv. 70]"
                NameQuest = "DesertQuest"
                LevelQuest = 2
                NameMon = "Desert Officer"
                CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0,
                    0.573571265, 0, 0.819155693)
                CFrameMon = CFrame.new(1617.07886, 1.5542295, 4295.54932, -0.997540116, -2.26287735e-08, -0.070099175,
                    -1.69377223e-08, 1, -8.17798806e-08, 0.070099175, -8.03913949e-08, -0.997540116)
            elseif MyLevel == 90 or MyLevel <= 99 then -- Snow Bandits
                Nonquest = false
                Ms = "Snow Bandit [Lv. 90]"
                NameQuest = "SnowQuest"
                LevelQuest = 1
                NameMon = "Snow Bandits"
                CFrameQuest = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0,
                    -0.939684391, 0, -0.342042685)
                CFrameMon = CFrame.new(1412.92346, 55.3503647, -1260.62036, -0.246266365, -0.0169920288, -0.969053388,
                    0.000432241941, 0.999844253, -0.0176417865, 0.969202161, -0.00476344163, -0.246220857)
            elseif MyLevel == 100 or MyLevel <= 119 then -- Snowman
                Nonquest = false
                Ms = "Snowman [Lv. 100]"
                NameQuest = "SnowQuest"
                LevelQuest = 2
                NameMon = "Snowman"
                CFrameQuest = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0,
                    -0.939684391, 0, -0.342042685)
                CFrameMon = CFrame.new(1376.86401, 97.2779999, -1396.93115, -0.986755967, 7.71178321e-08, -0.162211925,
                    7.71531674e-08, 1, 6.08143536e-09, 0.162211925, -6.51427134e-09, -0.986755967)
            elseif MyLevel == 120 or MyLevel <= 149 then -- Chief Petty Officer
                Nonquest = false
                Ms = "Chief Petty Officer [Lv. 120]"
                NameQuest = "MarineQuest2"
                LevelQuest = 1
                NameMon = "Chief Petty Officer"
                CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-4882.8623, 22.6520386, 4255.53516, 0.273695946, -5.40380647e-08, -0.96181643,
                    4.37720793e-08, 1, -4.37274998e-08, 0.96181643, -3.01326679e-08, 0.273695946)
            elseif MyLevel == 150 or MyLevel <= 174 then -- Sky Bandit
                Nonquest = false
                Ms = "Sky Bandit [Lv. 150]"
                NameQuest = "SkyQuest"
                LevelQuest = 1
                NameMon = "Sky Bandit"
                CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0,
                    -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-4959.51367, 365.39267, -2974.56812, 0.964867651, 7.74418396e-08, 0.262737453,
                    -6.95931988e-08, 1, -3.91783708e-08, -0.262737453, 1.95171506e-08, 0.964867651)
            elseif MyLevel == 175 or MyLevel <= 189 then -- Dark Master
                Nonquest = false
                Ms = "Dark Master [Lv. 175]"
                NameQuest = "SkyQuest"
                LevelQuest = 2
                NameMon = "Dark Master"
                CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0,
                    -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-5079.98096, 376.477356, -2194.17139, 0.465965867, -3.69776352e-08, 0.884802461,
                    3.40249851e-09, 1, 4.00000886e-08, -0.884802461, -1.56281423e-08, 0.465965867)
            elseif MyLevel == 190 or MyLevel <= 209 then
                Nonquest = false
                Ms = "Prisoner [Lv. 190]"
                LevelQuest = 1
                NameQuest = "PrisonerQuest"
                NameMon = "Prisoner"
                CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09,
                    -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
                CFrameMon = CFrame.new(5433.39307, 88.678093, 514.986877, 0.879988372, 0, -0.474995494, 0, 1, 0,
                    0.474995494, 0, 0.879988372)
            elseif MyLevel == 210 or MyLevel <= 249 then
                Nonquest = false
                Ms = "Dangerous Prisoner [Lv. 210]"
                LevelQuest = 2
                NameQuest = "PrisonerQuest"
                NameMon = "Dangerous Prisoner"
                CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09,
                    -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
                CFrameMon = CFrame.new(5433.39307, 88.678093, 514.986877, 0.879988372, 0, -0.474995494, 0, 1, 0,
                    0.474995494, 0, 0.879988372)
            elseif MyLevel == 250 or MyLevel <= 274 then -- Toga Warrior
                Nonquest = false
                Ms = "Toga Warrior [Lv. 250]"
                NameQuest = "ColosseumQuest"
                LevelQuest = 1
                NameMon = "Toga Warrior"
                CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931,
                    -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
                CFrameMon = CFrame.new(-1779.97583, 44.6077499, -2736.35474, 0.984437346, 4.10396339e-08, 0.175734788,
                    -3.62286876e-08, 1, -3.05844168e-08, -0.175734788, 2.3741821e-08, 0.984437346)
            elseif MyLevel == 275 or MyLevel <= 299 then -- Gladiato
                Nonquest = false
                Ms = "Gladiator [Lv. 275]"
                NameQuest = "ColosseumQuest"
                LevelQuest = 2
                NameMon = "Gladiato"
                CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931,
                    -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
                CFrameMon = CFrame.new(-1274.75903, 58.1895943, -3188.16309, 0.464524001, 6.21005611e-08, 0.885560572,
                    -4.80449414e-09, 1, -6.76054768e-08, -0.885560572, 2.71497012e-08, 0.464524001)
            elseif MyLevel == 300 or MyLevel <= 329 then -- Military Soldier
                Nonquest = false
                Ms = "Military Soldier [Lv. 300]"
                NameQuest = "MagmaQuest"
                LevelQuest = 1
                NameMon = "Military Soldier"
                CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669,
                    -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
                CFrameMon = CFrame.new(-5363.01123, 41.5056877, 8548.47266, -0.578253984, -3.29503091e-10, 0.815856814,
                    9.11209668e-08, 1, 6.498761e-08, -0.815856814, 1.11920997e-07, -0.578253984)
            elseif MyLevel == 330 or MyLevel <= 374 then -- Military Spy
                Nonquest = false
                Ms = "Military Spy [Lv. 325]"
                NameQuest = "MagmaQuest"
                LevelQuest = 2
                NameMon = "Military Spy"
                CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669,
                    -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
                CFrameMon = CFrame.new(-5787.99023, 120.864456, 8762.25293, -0.188358366, -1.84706277e-08, 0.982100308,
                    -1.23782129e-07, 1, -4.93306951e-09, -0.982100308, -1.22495649e-07, -0.188358366)
            elseif MyLevel == 375 or MyLevel <= 399 then -- Fishman Warrior
                Nonquest = false
                Ms = "Fishman Warrior [Lv. 375]"
                NameQuest = "FishmanQuest"
                LevelQuest = 1
                NameMon = "Fishman Warrior"
                CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574,
                    -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
                CFrameMon = CFrame.new(60946.6094, 48.6735229, 1525.91687, -0.0817126185, 8.90751153e-08, 0.996655822,
                    2.00889794e-08, 1, -8.77269599e-08, -0.996655822, 1.28533992e-08, -0.0817126185)
            elseif MyLevel == 400 or MyLevel <= 449 then -- Fishman Commando
                Nonquest = false
                Ms = "Fishman Commando [Lv. 400]"
                NameQuest = "FishmanQuest"
                LevelQuest = 2
                NameMon = "Fishman Commando"
                CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574,
                    -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
                CFrameMon = CFrame.new(61890.5195, 18.48283, 1475.2229, 0.604474187, 1.35142002e-07, -0.79662472,
                    -5.68487266e-08, 1, 1.26506762e-07, 0.79662472, -3.11829673e-08, 0.604474187)
            elseif MyLevel == 450 or MyLevel <= 474 then
                Nonquest = false
                Ms = "God's Guard [Lv. 450]"
                NameQuest = "SkyExp1Quest"
                LevelQuest = 1
                NameMon = "God's Guards"
                CFrameQuest = CFrame.new(-4721.71436, 845.277161, -1954.20105)
                CFrameMon = CFrame.new(-4716.95703, 853.089722, -1933.925427)
            elseif MyLevel == 475 or MyLevel <= 524 then
                Nonquest = false
                Ms = "Shanda [Lv. 475]"
                NameQuest = "SkyExp1Quest"
                LevelQuest = 2
                NameMon = "Shandas"
                CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0,
                    -0.906319618, 0, -0.422592998)
                CFrameMon = CFrame.new(-7904.57373, 5584.37646, -459.62973, 0.65171206, 5.11171692e-08, 0.758466363,
                    -4.76232476e-09, 1, -6.33034247e-08, -0.758466363, 3.76435416e-08, 0.65171206)
            elseif MyLevel == 525 or MyLevel <= 549 then -- Royal Squad
                Nonquest = false
                Ms = "Royal Squad [Lv. 525]"
                NameQuest = "SkyExp2Quest"
                LevelQuest = 1
                NameMon = "Royal Squad"
                CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-7555.04199, 5606.90479, -1303.24744, -0.896107852, -9.6057462e-10, -0.443836004,
                    -4.24974544e-09, 1, 6.41599973e-09, 0.443836004, 7.63560326e-09, -0.896107852)
            elseif MyLevel == 550 or MyLevel <= 624 then -- Royal Soldier
                Nonquest = false
                Ms = "Royal Soldier [Lv. 550]"
                NameQuest = "SkyExp2Quest"
                LevelQuest = 2
                NameMon = "Royal Soldier"
                CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                CFrameMon = CFrame.new(-7837.31152, 5649.65186, -1791.08582, -0.716008604, 0.0104285581, -0.698013008,
                    5.02521061e-06, 0.99988848, 0.0149335321, 0.69809103, 0.0106890313, -0.715928733)
            elseif MyLevel == 625 or MyLevel <= 649 then -- Galley Pirate
                Nonquest = false
                Ms = "Galley Pirate [Lv. 625]"
                NameQuest = "FountainQuest"
                LevelQuest = 1
                NameMon = "Galley Pirate"
                CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0,
                    -0.996196866, 0, 0.087131381)
                CFrameMon = CFrame.new(5569.80518, 38.5269432, 3849.01196, 0.896460414, 3.98027495e-08, 0.443124533,
                    -1.34262139e-08, 1, -6.26611296e-08, -0.443124533, 5.02237434e-08, 0.896460414)
            elseif MyLevel >= 650 then -- Galley Captain
                Nonquest = false
                Ms = "Galley Captain [Lv. 650]"
                NameQuest = "FountainQuest"
                LevelQuest = 2
                NameMon = "Galley Captain"
                CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0,
                    -0.996196866, 0, 0.087131381)
                CFrameMon = CFrame.new(5782.90186, 94.5326462, 4716.78174, 0.361808896, -1.24757526e-06, -0.932252586,
                    2.16989656e-06, 1, -4.96097414e-07, 0.932252586, -1.84339774e-06, 0.361808896)
            end
        end
        if NewWorld then
            Nonquest = false
            if MyLevel == 700 or MyLevel <= 724 then -- Raider [Lv. 700]
                Ms = "Raider [Lv. 700]"
                NameQuest = "Area1Quest"
                LevelQuest = 1
                NameMon = "Raider"
                CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0,
                    0.974368095, 0, -0.22495985)
                CFrameMon = CFrame.new(-737.026123, 10.1748352, 2392.57959, 0.272128761, 0, -0.962260842, -0, 1, -0,
                    0.962260842, 0, 0.272128761)
            elseif MyLevel == 725 or MyLevel <= 774 then -- Mercenary [Lv. 725]
                Ms = "Mercenary [Lv. 725]"
                NameQuest = "Area1Quest"
                LevelQuest = 2
                NameMon = "Mercenary"
                CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0,
                    0.974368095, 0, -0.22495985)
                CFrameMon = CFrame.new(-1022.21271, 72.9855194, 1891.39148, -0.990782857, 0, -0.135460541, 0, 1, 0,
                    0.135460541, 0, -0.990782857)
            elseif MyLevel == 775 or MyLevel <= 799 then -- Swan Pirate [Lv. 775]
                Ms = "Swan Pirate [Lv. 775]"
                NameQuest = "Area2Quest"
                LevelQuest = 1
                NameMon = "Swan Pirate"
                CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0,
                    -0.99026376, 0, 0.139203906)
                CFrameMon = CFrame.new(976.467651, 111.174057, 1229.1084, 0.00852567982, -4.73897828e-08, -0.999963999,
                    1.12251888e-08, 1, -4.7295778e-08, 0.999963999, -1.08215579e-08, 0.00852567982)
            elseif MyLevel == 800 or MyLevel <= 874 then -- Factory Staff [Lv. 800]
                Ms = "Factory Staff [Lv. 800]"
                NameQuest = "Area2Quest"
                LevelQuest = 2
                NameMon = "Factory Staff"
                CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0,
                    -0.99026376, 0, 0.139203906)
                CFrameMon = CFrame.new(336.74585, 73.1620483, -224.129272, 0.993632793, 3.40154607e-08, 0.112668738,
                    -3.87658332e-08, 1, 3.99718729e-08, -0.112668738, -4.40850592e-08, 0.993632793)
            elseif MyLevel == 875 or MyLevel <= 899 then -- Marine Lieutenant [Lv. 875]
                Ms = "Marine Lieutenant [Lv. 875]"
                NameQuest = "MarineQuest3"
                LevelQuest = 1
                NameMon = "Marine Lieutenant"
                CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0,
                    -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-2842.69922, 72.9919434, -2901.90479, -0.762281299, 0, -0.64724648, 0,
                    1.00000012, 0, 0.64724648, 0, -0.762281299)
            elseif MyLevel == 900 or MyLevel <= 949 then -- Marine Captain [Lv. 900]
                Ms = "Marine Captain [Lv. 900]"
                NameQuest = "MarineQuest3"
                LevelQuest = 2
                NameMon = "Marine Captain"
                CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0,
                    -0.500031412, 0, 0.866007268)
                CFrameMon = CFrame.new(-1814.70313, 72.9919434, -3208.86621, -0.900422215, 7.93464423e-08, -0.435017526,
                    3.68856199e-08, 1, 1.06050372e-07, 0.435017526, 7.94441988e-08, -0.900422215)
            elseif MyLevel == 950 or MyLevel <= 974 then -- Zombie [Lv. 950]
                Ms = "Zombie [Lv. 950]"
                NameQuest = "ZombieQuest"
                LevelQuest = 1
                NameMon = "Zombie"
                CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0,
                    0.95628953, 0, -0.29242146)
                CFrameMon = CFrame.new(-5649.23438, 126.0578, -737.773743, 0.355238914, -8.10359282e-08, 0.934775114,
                    1.65461245e-08, 1, 8.04023372e-08, -0.934775114, -1.3095117e-08, 0.355238914)
            elseif MyLevel == 975 or MyLevel <= 999 then -- Vampire [Lv. 975]
                Ms = "Vampire [Lv. 975]"
                NameQuest = "ZombieQuest"
                LevelQuest = 2
                NameMon = "Vampire"
                CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0,
                    0.95628953, 0, -0.29242146)
                CFrameMon = CFrame.new(-6030.32031, 0.4377408, -1313.5564, -0.856965423, 3.9138893e-08, -0.515373945,
                    -1.12178942e-08, 1, 9.45958547e-08, 0.515373945, 8.68467822e-08, -0.856965423)
            elseif MyLevel == 1000 or MyLevel <= 1049 then -- Snow Trooper [Lv. 1000] **
                Ms = "Snow Trooper [Lv. 1000]"
                NameQuest = "SnowMountainQuest"
                LevelQuest = 1
                NameMon = "Snow Trooper"
                CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0,
                    -0.92718488, 0, -0.374604106)
                CFrameMon = CFrame.new(621.003418, 391.361053, -5335.43604, 0.481644779, 0, 0.876366913, 0, 1, 0,
                    -0.876366913, 0, 0.481644779)
            elseif MyLevel == 1050 or MyLevel <= 1099 then -- Winter Warrior [Lv. 1050]
                Ms = "Winter Warrior [Lv. 1050]"
                NameQuest = "SnowMountainQuest"
                LevelQuest = 2
                NameMon = "Winter Warrior"
                CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0,
                    -0.92718488, 0, -0.374604106)
                CFrameMon = CFrame.new(1295.62683, 429.447784, -5087.04492, -0.698032081, -8.28980049e-08, -0.71606636,
                    -1.98835952e-08, 1, -9.63858184e-08, 0.71606636, -5.30424877e-08, -0.698032081)
            elseif MyLevel == 1100 or MyLevel <= 1124 then -- Lab Subordinate [Lv. 1100]
                Ms = "Lab Subordinate [Lv. 1100]"
                NameQuest = "IceSideQuest"
                LevelQuest = 1
                NameMon = "Lab Subordinate"
                CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0,
                    0.891015649, 0, 0.453972578)
                CFrameMon = CFrame.new(-5769.2041, 37.9288292, -4468.38721, -0.569419742, -2.49055017e-08, 0.822046936,
                    -6.96206541e-08, 1, -1.79282633e-08, -0.822046936, -6.74401548e-08, -0.569419742)
            elseif MyLevel == 1125 or MyLevel <= 1174 then -- Horned Warrior [Lv. 1125]
                Ms = "Horned Warrior [Lv. 1125]"
                NameQuest = "IceSideQuest"
                LevelQuest = 2
                NameMon = "Horned Warrior"
                CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0,
                    0.891015649, 0, 0.453972578)
                CFrameMon = CFrame.new(-6401.27979, 15.9775667, -5948.24316, 0.388303697, 0, -0.921531856, 0, 1, 0,
                    0.921531856, 0, 0.388303697)
            elseif MyLevel == 1175 or MyLevel <= 1199 then -- Magma Ninja [Lv. 1175]
                Ms = "Magma Ninja [Lv. 1175]"
                NameQuest = "FireSideQuest"
                LevelQuest = 1
                NameMon = "Magma Ninja"
                CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0,
                    -0.469463557, 0, -0.882952213)
                CFrameMon = CFrame.new(-5466.06445, 57.6952019, -5837.42822, -0.988835871, 0, -0.149006829, 0, 1, 0,
                    0.149006829, 0, -0.988835871)
            elseif MyLevel == 1200 or MyLevel <= 1249 then
                Ms = "Lava Pirate [Lv. 1200]"
                NameQuest = "FireSideQuest"
                LevelQuest = 2
                NameMon = "Lava Pirate"
                CFrameQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07,
                    -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
                CFrameMon = CFrame.new(-5169.71729, 34.1234779, -4669.73633, -0.196780294, 0, 0.98044765, 0, 1.00000012,
                    -0, -0.98044765, 0, -0.196780294)
            elseif MyLevel == 1250 or MyLevel <= 1274 then
                Ms = "Ship Deckhand [Lv. 1250]"
                NameQuest = "ShipQuest1"
                LevelQuest = 1
                NameMon = "Ship Deckhand"
                CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0,
                    1.00000012, -0, 0.96964103, 0, -0.244533136)
                CFrameMon = CFrame.new(1163.80872, 138.288452, 33058.4258, -0.998580813, 5.49076979e-08, -0.0532564968,
                    5.57436763e-08, 1, -1.42118655e-08, 0.0532564968, -1.71604082e-08, -0.998580813)
            elseif MyLevel == 1275 or MyLevel <= 1299 then
                Ms = "Ship Engineer [Lv. 1275]"
                NameQuest = "ShipQuest1"
                LevelQuest = 2
                NameMon = "Ship Engineer"
                CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0,
                    1.00000012, -0, 0.96964103, 0, -0.244533136)
                CFrameMon = CFrame.new(921.30249023438, 125.400390625, 32937.34375)
            elseif MyLevel == 1300 or MyLevel <= 1324 then
                Ms = "Ship Steward [Lv. 1300]"
                NameQuest = "ShipQuest2"
                LevelQuest = 1
                NameMon = "Ship Steward"
                CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836,
                    1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
                CFrameMon = CFrame.new(917.96057128906, 136.89932250977, 33343.4140625)
            elseif MyLevel == 1325 or MyLevel <= 1349 then
                Ms = "Ship Officer [Lv. 1325]"
                NameQuest = "ShipQuest2"
                LevelQuest = 2
                NameMon = "Ship Officer"
                CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836,
                    1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
                CFrameMon = CFrame.new(944.44964599609, 181.40081787109, 33278.9453125)
            elseif MyLevel == 1350 or MyLevel <= 1374 then
                Ms = "Arctic Warrior [Lv. 1350]"
                NameQuest = "FrostQuest"
                LevelQuest = 1
                NameMon = "Arctic Warrior"
                CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0,
                    0.358349502, 0, -0.933587909)
                CFrameMon = CFrame.new(5878.23486, 81.3886948, -6136.35596, -0.451037169, 2.3908234e-07, 0.892505825,
                    -1.08168464e-07, 1, -3.22542007e-07, -0.892505825, -2.4201924e-07, -0.451037169)
            elseif MyLevel == 1375 or MyLevel <= 1424 then -- Snow Lurker [Lv. 1375]
                Ms = "Snow Lurker [Lv. 1375]"
                NameQuest = "FrostQuest"
                LevelQuest = 2
                NameMon = "Snow Lurker"
                CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0,
                    0.358349502, 0, -0.933587909)
                CFrameMon = CFrame.new(5513.36865, 60.546711, -6809.94971, -0.958693981, -1.65617333e-08, 0.284439981,
                    -4.07668654e-09, 1, 4.44854642e-08, -0.284439981, 4.14883701e-08, -0.958693981)
            elseif MyLevel == 1425 or MyLevel <= 1449 then -- Sea Soldier [Lv. 1425]
                Ms = "Sea Soldier [Lv. 1425]"
                NameQuest = "ForgottenQuest"
                LevelQuest = 1
                NameMon = "Sea Soldier"
                CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0,
                    0.13915664, 0, 0.990270376)
                CFrameMon = CFrame.new(-3115.78223, 63.8785706, -9808.38574, -0.913427353, 3.11199457e-08, 0.407000452,
                    7.79564235e-09, 1, -5.89660658e-08, -0.407000452, -5.06883708e-08, -0.913427353)
            elseif MyLevel >= 1450 then -- Water Fighter [Lv. 1450]
                Ms = "Water Fighter [Lv. 1450]"
                NameQuest = "ForgottenQuest"
                LevelQuest = 2
                NameMon = "Water Fighter"
                CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0,
                    0.13915664, 0, 0.990270376)
                CFrameMon = CFrame.new(-3212.99683, 263.809296, -10551.8799, 0.742111444, -5.59139615e-08, -0.670276582,
                    1.69155214e-08, 1, -6.46908234e-08, 0.670276582, 3.66697037e-08, 0.742111444)
            end
        end
        if ThreeWorld then
            if MyLevel >= 1500 and MyLevel <= 1524 then -- Pirate Millionaire [Lv. 1500]
                Ms = "Pirate Millionaire [Lv. 1500]"
                NameQuest = "PiratePortQuest"
                LevelQuest = 1
                NameMon = "Pirate Millionaire"
                CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0,
                    0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
            elseif MyLevel >= 1525 and MyLevel <= 1574 then -- Pistol Billionaire [Lv. 1525]
                Ms = "Pistol Billionaire [Lv. 1525]"
                NameQuest = "PiratePortQuest"
                LevelQuest = 2
                NameMon = "Pistol Billionaire"
                CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0,
                    0.258804798, 0, 0.965929627)
                CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
            elseif MyLevel >= 1575 and MyLevel <= 1599 then -- Dragon Crew Warrior [Lv. 1575]
                Ms = "Dragon Crew Warrior [Lv. 1575]"
                NameQuest = "AmazonQuest"
                LevelQuest = 1
                NameMon = "Dragon Crew Warrior"
                CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0,
                    0.438378751, 0, 0.898790359)
                CFrameMon = CFrame.new(6241.9951171875, 51.522083282471, -1243.9771728516)
            elseif MyLevel >= 1600 and MyLevel <= 1624 then -- Dragon Crew Archer [Lv. 1600]
                Ms = "Dragon Crew Archer [Lv. 1600]"
                NameQuest = "AmazonQuest"
                LevelQuest = 2
                NameMon = "Dragon Crew Archer"
                CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0,
                    0.438378751, 0, 0.898790359)
                CFrameMon = CFrame.new(6488.9155273438, 383.38375854492, -110.66246032715)
            elseif MyLevel >= 1625 and MyLevel <= 1649 then -- Female Islander [Lv. 1625]
                Ms = "Female Islander [Lv. 1625]"
                NameQuest = "AmazonQuest2"
                LevelQuest = 1
                NameMon = "Female Islander"
                CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(4770.4990234375, 758.95520019531, 1069.8680419922)
            elseif MyLevel >= 1650 and MyLevel <= 1699 then -- Giant Islander [Lv. 1650]
                Ms = "Giant Islander [Lv. 1650]"
                NameQuest = "AmazonQuest2"
                LevelQuest = 2
                NameMon = "Giant Islander"
                CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                CFrameMon = CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789)
            elseif MyLevel >= 1700 and MyLevel <= 1724 then -- Marine Commodore [Lv. 1700]
                Ms = "Marine Commodore [Lv. 1700]"
                NameQuest = "MarineTreeIsland"
                LevelQuest = 1
                NameMon = "Marine Commodore"
                CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0,
                    -0.258804798, 0, -0.965929747)
                CFrameMon = CFrame.new(2490.0844726563, 190.4232635498, -7160.0502929688)
            elseif MyLevel >= 1725 and MyLevel <= 1774 then -- Marine Rear Admiral [Lv. 1725]
                Ms = "Marine Rear Admiral [Lv. 1725]"
                NameQuest = "MarineTreeIsland"
                LevelQuest = 2
                NameMon = "Marine Rear Admiral"
                CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0,
                    -0.258804798, 0, -0.965929747)
                CFrameMon = CFrame.new(3951.3903808594, 229.11549377441, -6912.81640625)
            elseif MyLevel >= 1775 and MyLevel <= 1799 then -- Fishman Raider [Lv. 1775]
                Ms = "Fishman Raider [Lv. 1775]"
                NameQuest = "DeepForestIsland3"
                LevelQuest = 1
                NameMon = "Fishman Raider"
                CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0,
                    -0.469463557, 0, -0.882952213)
                CFrameMon = CFrame.new(-10322.400390625, 390.94473266602, -8580.0908203125)
            elseif MyLevel >= 1800 and MyLevel <= 1824 then -- Fishman Captain [Lv. 1800]
                Ms = "Fishman Captain [Lv. 1800]"
                NameQuest = "DeepForestIsland3"
                LevelQuest = 2
                NameMon = "Fishman Captain"
                CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0,
                    -0.469463557, 0, -0.882952213)
                CFrameMon = CFrame.new(-11194.541992188, 442.02795410156, -8608.806640625)
            elseif MyLevel >= 1825 and MyLevel <= 1849 then -- Forest Pirate [Lv. 1825]
                Ms = "Forest Pirate [Lv. 1825]"
                NameQuest = "DeepForestIsland"
                LevelQuest = 1
                NameMon = "Forest Pirate"
                CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0,
                    0.707079291, 0, 0.707134247)
                CFrameMon = CFrame.new(-13225.809570313, 428.19387817383, -7753.1245117188)
            elseif MyLevel >= 1850 and MyLevel <= 1899 then -- Mythological Pirate [Lv. 1850]
                Ms = "Mythological Pirate [Lv. 1850]"
                NameQuest = "DeepForestIsland"
                LevelQuest = 2
                NameMon = "Mythological Pirate"
                CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0,
                    0.707079291, 0, 0.707134247)
                CFrameMon = CFrame.new(-13869.172851563, 564.95251464844, -7084.4135742188)
            elseif MyLevel >= 1900 and MyLevel <= 1924 then -- Jungle Pirate [Lv. 1900]
                Ms = "Jungle Pirate [Lv. 1900]"
                NameQuest = "DeepForestIsland2"
                LevelQuest = 1
                NameMon = "Jungle Pirate"
                CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0,
                    -0.996196866, 0, -0.0871315002)
                CFrameMon = CFrame.new(-11982.221679688, 376.32522583008, -10451.415039063)
            elseif MyLevel >= 1925 and MyLevel <= 1974 then -- Musketeer Pirate [Lv. 1925]
                Ms = "Musketeer Pirate [Lv. 1925]"
                NameQuest = "DeepForestIsland2"
                LevelQuest = 2
                NameMon = "Musketeer Pirate"
                CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0,
                    -0.996196866, 0, -0.0871315002)
                CFrameMon = CFrame.new(-13282.3046875, 496.23684692383, -9565.150390625)
            elseif MyLevel >= 1975 and MyLevel <= 1999 then
                Ms = "Reborn Skeleton [Lv. 1975]"
                NameQuest = "HauntedQuest1"
                LevelQuest = 1
                NameMon = "Reborn Skeleton"
                CFrameQuest = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
                CFrameMon = CFrame.new(-8817.880859375, 191.16761779785, 6298.6557617188)
            elseif MyLevel >= 2000 and MyLevel <= 2024 then
                Ms = "Living Zombie [Lv. 2000]"
                NameQuest = "HauntedQuest1"
                LevelQuest = 2
                NameMon = "Living Zombie"
                CFrameQuest = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
                CFrameMon = CFrame.new(-10125.234375, 183.94705200195, 6242.013671875)
            elseif MyLevel >= 2025 and MyLevel <= 2049 then
                Ms = "Demonic Soul [Lv. 2025]"
                NameQuest = "HauntedQuest2"
                LevelQuest = 1
                NameMon = "Demonic Soul"
                CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
                CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
            elseif MyLevel >= 2050 and MyLevel <= 2074 then
                Ms = "Posessed Mummy [Lv. 2050]"
                NameQuest = "HauntedQuest2"
                LevelQuest = 2
                NameMon = "Posessed Mummy"
                CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
                CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
            elseif MyLevel >= 2075 and MyLevel <= 2099 then
                Ms = "Peanut Scout [Lv. 2075]"
                NameQuest = "NutsIslandQuest"
                LevelQuest = 1
                NameMon = "Peanut Scout"
                CFrameQuest = CFrame.new(-2104.17163, 38.1299706, -10194.418, 0.758814394, -1.38604395e-09, 0.651306927,
                    2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, 0.758814394)
                CFrameMon = CFrame.new(-2098.07544, 192.611862, -10248.8867, 0.983392298, -9.57031787e-08, 0.181492642,
                    8.7276355e-08, 1, 5.44169616e-08, -0.181492642, -3.76732068e-08, 0.983392298)
            elseif MyLevel >= 2100 and MyLevel <= 2124 then
                Ms = "Peanut President [Lv. 2100]"
                NameQuest = "NutsIslandQuest"
                LevelQuest = 2
                NameMon = "Peanut President"
                CFrameQuest = CFrame.new(-2104.17163, 38.1299706, -10194.418, 0.758814394, -1.38604395e-09, 0.651306927,
                    2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, 0.758814394)
                CFrameMon = CFrame.new(-1876.95959, 192.610947, -10542.2939, 0.0553516336, -2.83836812e-08, 0.998466909,
                    -6.89634405e-10, 1, 2.84654931e-08, -0.998466909, -2.26418861e-09, 0.0553516336)
            elseif MyLevel >= 2125 and MyLevel <= 2149 then
                Ms = "Ice Cream Chef [Lv. 2125]"
                NameQuest = "IceCreamIslandQuest"
                LevelQuest = 1
                NameMon = "Ice Cream Chef"
                CFrameQuest = CFrame.new(-820.404358, 65.8453293, -10965.5654, 0.822534859, 5.24448502e-08,
                    -0.568714678, -2.08336317e-08, 1, 6.20846663e-08, 0.568714678, -3.92184099e-08, 0.822534859)
                CFrameMon = CFrame.new(-821.614075, 208.39537, -10990.7617, -0.870096624, 3.18909272e-08, 0.492881238,
                    -1.8357893e-08, 1, -9.71107568e-08, -0.492881238, -9.35439957e-08, -0.870096624)
            elseif MyLevel >= 2150 and MyLevel <= 2199 then
                Ms = "Ice Cream Commander [Lv. 2150]"
                NameQuest = "IceCreamIslandQuest"
                LevelQuest = 2
                NameMon = "Ice Cream Commander"
                CFrameQuest = CFrame.new(-819.376526, 67.4634171, -10967.2832)
                CFrameMon = CFrame.new(-610.11669921875, 208.26904296875, -11253.686523438)
            elseif MyLevel >= 2200 and MyLevel <= 2224 then
                Ms = "Cookie Crafter [Lv. 2200]"
                NameQuest = "CakeQuest1"
                LevelQuest = 1
                NameMon = "Cookie Crafter"
                CFrameQuest = CFrame.new(-2020.6068115234375, 37.82400894165039, -12027.80859375)
                CFrameMon = CFrame.new(-2286.684326171875, 146.5656280517578, -12226.8818359375)
            elseif MyLevel >= 2225 and MyLevel <= 2249 then
                Ms = "Cake Guard [Lv. 2225]"
                NameQuest = "CakeQuest1"
                LevelQuest = 2
                NameMon = "Cake Guard"
                CFrameQuest = CFrame.new(-2020.6068115234375, 37.82400894165039, -12027.80859375)
                CFrameMon = CFrame.new(-1817.9747314453125, 209.5632781982422, -12288.9228515625)
            elseif MyLevel >= 2250 and MyLevel <= 2274 then
                Ms = "Baking Staff [Lv. 2250]"
                NameQuest = "CakeQuest2"
                LevelQuest = 1
                NameMon = "Baking Staff"
                CFrameQuest = CFrame.new(-1928.31763, 37.7296638, -12840.626)
                CFrameMon = CFrame.new(-1818.347900390625, 93.41275787353516, -12887.66015625)
            elseif MyLevel >= 2275 and MyLevel <= 2299 then

                Ms = "Head Baker [Lv. 2275]"
                NameQuest = "CakeQuest2"
                LevelQuest = 2
                NameMon = "Head Baker"
                CFrameQuest = CFrame.new(-1928.31763, 37.7296638, -12840.626)
                CFrameMon = CFrame.new(-2288.795166015625, 106.9419174194336, -12811.111328125)
            end
        end
    end
end
CheckQuest()
local LocalPlayer = game.Players.LocalPlayer
function click()
    local VirtualUser = game:GetService('VirtualUser')

    VirtualUser:CaptureController()
    VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end
spawn(function()
    while true do

        if bai.autofram == true then

            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                CheckQuest()
                if OldWorld and (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and
                    (CFrameQuest.Position -
                        game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude >
                    50000 then
                    wait(.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(
                        61163.8515625, 11.6796875, 1819.7841796875))
                elseif OldWorld and not (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and
                    (CFrameQuest.Position -
                        game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude >
                    50000 then
                    wait(.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(
                        3864.8515625, 6.6796875, -1926.7841796875))
                elseif NewWorld and string.find(Ms, "Ship") and
                    (CFrameQuest.Position -
                        game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude >
                    30000 then

                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(
                        923.21252441406, 126.9760055542, 32852.83203125))
                elseif NewWorld and not string.find(Ms, "Ship") and
                    (CFrameQuest.Position -
                        game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude >
                    30000 then

                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(
                        -6508.5581054688, 89.034996032715, -132.83953857422))
                elseif (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <=
                    100 then

                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
                    wait(.9)
                    local string_1 = "StartQuest";
                    local string_2 = NameQuest;
                    local number_1 = LevelQuest;
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    Target:InvokeServer(string_1, string_2, number_1);
                    local string_1 = "SetSpawnPoint";
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    Target:InvokeServer(string_1);
                elseif (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude >
                    100 then
                    tp(CFrameQuest)
                end

            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then

                if Nonquest == true then
                    local string_1 = "SetSpawnPoint";
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    Target:InvokeServer(string_1);
                end
                if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if bai.autofram and v.Name == Ms and v:FindFirstChild("HumanoidRootPart") and
                            v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if string.find(
                                game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
                                wait()
                               

                                    repeat
                                        wait()
                                        spawn(function()
                                            spawn(function()
                                                local part = Instance.new("Part", workspace)
                                                part.Anchored = true
                                                part.Size = Vector3.new(10, 0.1, 10)
                                                part.Material = "Glass"
                                                part.BrickColor = BrickColor.Random()
                                                part.Transparency = 0.7
                                                part.Position = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position +
                                                                    Vector3.new(0, -4, 0)
                                                wait()
                                                part.Destroy(part)
                                            end)
                                        if OldWorld and
                                            (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and
                                            (CFrameQuest.Position -
                                                game:GetService("Players").LocalPlayer.Character:WaitForChild(
                                                    "HumanoidRootPart").Position).magnitude > 50000 then
                                            wait(.5)
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                "requestEntrance",
                                                Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                                        elseif OldWorld and
                                            not (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and
                                            (CFrameQuest.Position -
                                                game:GetService("Players").LocalPlayer.Character:WaitForChild(
                                                    "HumanoidRootPart").Position).magnitude > 50000 then
                                            wait(.5)
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                "requestEntrance",
                                                Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
                                        elseif NewWorld and string.find(Ms, "Ship") and
                                            (CFrameQuest.Position -
                                                game:GetService("Players").LocalPlayer.Character:WaitForChild(
                                                    "HumanoidRootPart").Position).magnitude > 30000 then

                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                "requestEntrance",
                                                Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                                        elseif NewWorld and not string.find(Ms, "Ship") and
                                            (CFrameQuest.Position -
                                                game:GetService("Players").LocalPlayer.Character:WaitForChild(
                                                    "HumanoidRootPart").Position).magnitude > 30000 then

                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                "requestEntrance",
                                                Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
                                        end

                                        pcall(function()
                                            if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then

                                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and
                                                    (v.HumanoidRootPart.Position -
                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <=
                                                    350 then
                                                    PosMon = v.HumanoidRootPart.CFrame

                                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                        local args = {
                                                            [1] = "Buso"
                                                        }
                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                            unpack(args))
                                                    end

                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                                        v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)

                                                    if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and
                                                        game.Players.LocalPlayer.Character:FindFirstChild("Black Leg")
                                                            .Level.Value >= 150 then
                                                        local vim = game:service('VirtualInputManager')
                                                        vim:SendKeyEvent(true, "V", false, game)
                                                        vim:SendKeyEvent(false, "V", false, game)
                                                    end

                                                end
                                            end
                                        end)
                                    end)
                                    until (not bai.autofram or not v.Parent or v.Humanoid.Health <= 0) or
                                        (not string.find(
                                            game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title
                                                .Text, NameMon)) or
                                        (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)
                                    if not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container
                                                           .QuestTitle.Title.Text, NameMon) then
                                        game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer(
                                            "AbandonQuest");
                                    end
                               
                            else
                                game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest");
                            end
                        end
                    end
                else
                    tp(CFrameMon)

                end
            end
        end

        wait(.2)
    end
end)
spawn(function()
    while wait(.2) do
        pcall(function()
            if bai.autosjiguoshi then

                if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    CheckQuest()
                    if (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >
                        10 then
                        tp(CFrameQuest)
                    else
                        local string_1 = "StartQuest";
                        local string_2 = NameQuest;
                        local number_1 = LevelQuest;
                        local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                        Target:InvokeServer(string_1, string_2, number_1);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                    end
                elseif game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    CheckQuest()
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle
                                       .Title.Text, NameMon) then
                        if game.Workspace.Enemies:FindFirstChild(Ms) then
                            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if not string.find(v.Name, "Boss") and v.Humanoid.Health > 0 and
                                    (v.HumanoidRootPart.Position - CFrameMon.Position).Magnitude <= 1000 then
                                    PosMon = v.HumanoidRootPart.CFrame

                                    repeat
                                        wait()
                                        spawn(function()
                                            local part = Instance.new("Part", workspace)
                                            part.Anchored = true
                                            part.Size = Vector3.new(10, 0.1, 10)
                                            part.Material = "Glass"
                                            part.BrickColor = BrickColor.Random()
                                            part.Transparency = 0.7
                                            part.Position = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position +
                                                                Vector3.new(0, -4, 0)
                                            wait()
                                            part.Destroy(part)
                                        end)
                                        local health = v.Humanoid.Health
                                        local maxhealth = v.Humanoid.MaxHealth
                                        local percent = (health / maxhealth) * 100
                                        if percent <= bai.zhangshaxian then
                                            bai.SelectToolWeapon = game.Players.LocalPlayer.Data.DevilFruit.Value
                                            tp(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
                                            PositionSkillMasteryDevilFruit = v.HumanoidRootPart.Position
                                            if (v.HumanoidRootPart.Position -
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                50 then

                                                if game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                    "Dragon-Dragon") then
                                                    if bai.z and v.Humanoid.Health > 0 then
                                                        game:service('VirtualInputManager'):SendKeyEvent(true, "Z",
                                                            false, game)
                                                        wait(.1)
                                                        game:service('VirtualInputManager'):SendKeyEvent(false, "Z",
                                                            false, game)
                                                    end
                                                    if bai.x and v.Humanoid.Health > 0 then
                                                        game:service('VirtualInputManager'):SendKeyEvent(true, "X",
                                                            false, game)
                                                        wait(.1)
                                                        game:service('VirtualInputManager'):SendKeyEvent(false, "X",
                                                            false, game)
                                                    end
                                                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                    "Human-Human: Buddha") then
                                                    if bai.z and v.Humanoid.Health > 0 and
                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.Size ==
                                                        Vector3.new(7.6, 7.676, 3.686) then
                                                    else
                                                        game:service('VirtualInputManager'):SendKeyEvent(true, "Z",
                                                            false, game)
                                                        wait(.1)
                                                        game:service('VirtualInputManager'):SendKeyEvent(false, "Z",
                                                            false, game)
                                                    end
                                                    if bai.x and v.Humanoid.Health > 0 then
                                                        game:service('VirtualInputManager'):SendKeyEvent(true, "X",
                                                            false, game)
                                                        wait(.1)
                                                        game:service('VirtualInputManager'):SendKeyEvent(false, "X",
                                                            false, game)
                                                    end
                                                    if bai.c and v.Humanoid.Health > 0 then
                                                        game:service('VirtualInputManager'):SendKeyEvent(true, "C",
                                                            false, game)
                                                        wait(.1)
                                                        game:service('VirtualInputManager'):SendKeyEvent(false, "C",
                                                            false, game)
                                                    end
                                                elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                    game.Players.LocalPlayer.Data.DevilFruit.Value) then
                                                    game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                        game.Players.LocalPlayer.Data.DevilFruit.Value).MousePos.Value =
                                                        v.HumanoidRootPart.Position
                                                    if bai.z and v.Humanoid.Health > 0 then
                                                        game:service('VirtualInputManager'):SendKeyEvent(true, "Z",
                                                            false, game)
                                                        wait(.1)
                                                        game:service('VirtualInputManager'):SendKeyEvent(false, "Z",
                                                            false, game)
                                                    end
                                                    if bai.x and v.Humanoid.Health > 0 then
                                                        game:service('VirtualInputManager'):SendKeyEvent(true, "X",
                                                            false, game)
                                                        wait(.1)
                                                        game:service('VirtualInputManager'):SendKeyEvent(false, "X",
                                                            false, game)
                                                    end
                                                    if bai.c and v.Humanoid.Health > 0 then
                                                        game:service('VirtualInputManager'):SendKeyEvent(true, "C",
                                                            false, game)
                                                        wait(.1)
                                                        game:service('VirtualInputManager'):SendKeyEvent(false, "C",
                                                            false, game)
                                                    end
                                                    if bai.v and v.Humanoid.Health > 0 then
                                                        game:service('VirtualInputManager'):SendKeyEvent(true, "V",
                                                            false, game)
                                                        wait(.1)
                                                        game:service('VirtualInputManager'):SendKeyEvent(false, "V",
                                                            false, game)
                                                    end
                                                end
                                            end
                                        elseif percent > bai.zhangshaxian and v.Humanoid.Health > 0 then
                                            if game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                "Human-Human: Buddha") then
                                                if game.Players.LocalPlayer.Character.HumanoidRootPart.Size.Y >= 6 then
                                                    game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false,
                                                        game)
                                                    wait(.1)
                                                    game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false,
                                                        game)
                                                end
                                            end

                                            bai.SelectToolWeapon = bai.SelectToolWeaponOld
                                            spawn(function()
                                                repeat
                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                                        v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
                                                    wait()
                                                until v.Humanoid.Health <= 0 or not v.Parent or not bai.autosjiguoshi
                                            end)

                                            local health = v.Humanoid.Health
                                            local maxhealth = v.Humanoid.MaxHealth
                                            local percent = (health / maxhealth) * 100
                                            if percent > bai.zhangshaxian and v.Humanoid.Health > 0 then
                                                game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 600))
                                            else
                                                bai.SelectToolWeapon = game.Players.LocalPlayer.Data.DevilFruit.Value
                                                wait(1)
                                            end
                                        end
                                    until v.Humanoid.Health <= 0 or not v.Parent or not bai.autosjiguoshi

                                end
                            end
                        elseif game.ReplicatedStorage:FindFirstChild(Ms) then
                            tp(CFrameMon)
                        else
                            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if not string.find(v.Name, "Boss") and v.Humanoid.Health > 0 and
                                    (v.HumanoidRootPart.Position - CFrameMon.Position).Magnitude <= 1000 then
                                    PosMon = v.HumanoidRootPart.CFrame
                                    repeat
                                        wait()

                                        local health = v.Humanoid.Health
                                        local maxhealth = v.Humanoid.MaxHealth
                                        local percent = (health / maxhealth) * 100
                                        if percent <= bai.zhangshaxian then
                                            bai.SelectToolWeapon = game.Players.LocalPlayer.Data.DevilFruit.Value
                                            tp(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1))
                                            PositionSkillMasteryDevilFruit = v.HumanoidRootPart.Position
                                            spawn(function()

                                                if (v.HumanoidRootPart.Position -
                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <
                                                    50 then
                                                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                        "Dragon-Dragon") then
                                                        if bai.z and v.Humanoid.Health > 0 then
                                                            game:service('VirtualInputManager'):SendKeyEvent(true, "Z",
                                                                false, game)
                                                            wait(.1)
                                                            game:service('VirtualInputManager'):SendKeyEvent(false, "Z",
                                                                false, game)
                                                        end
                                                        if bai.x and v.Humanoid.Health > 0 then
                                                            game:service('VirtualInputManager'):SendKeyEvent(true, "X",
                                                                false, game)
                                                            wait(.1)
                                                            game:service('VirtualInputManager'):SendKeyEvent(false, "X",
                                                                false, game)
                                                        end
                                                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                        "Human-Human: Buddha") then
                                                        if bai.z and v.Humanoid.Health > 0 and
                                                            game.Players.LocalPlayer.Character.HumanoidRootPart.Size ==
                                                            Vector3.new(7.6, 7.676, 3.686) then
                                                        else
                                                            game:service('VirtualInputManager'):SendKeyEvent(true, "Z",
                                                                false, game)
                                                            wait(.1)
                                                            game:service('VirtualInputManager'):SendKeyEvent(false, "Z",
                                                                false, game)
                                                        end
                                                        if bai.x and v.Humanoid.Health > 0 then
                                                            game:service('VirtualInputManager'):SendKeyEvent(true, "X",
                                                                false, game)
                                                            wait(.1)
                                                            game:service('VirtualInputManager'):SendKeyEvent(false, "X",
                                                                false, game)
                                                        end
                                                        if bai.c and v.Humanoid.Health > 0 then
                                                            game:service('VirtualInputManager'):SendKeyEvent(true, "C",
                                                                false, game)
                                                            wait(.1)
                                                            game:service('VirtualInputManager'):SendKeyEvent(false, "C",
                                                                false, game)
                                                        end
                                                    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                        game.Players.LocalPlayer.Data.DevilFruit.Value) then
                                                        game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                            game.Players.LocalPlayer.Data.DevilFruit.Value).MousePos
                                                            .Value = v.HumanoidRootPart.Position
                                                        if bai.z and v.Humanoid.Health > 0 then
                                                            game:service('VirtualInputManager'):SendKeyEvent(true, "Z",
                                                                false, game)
                                                            wait(.1)
                                                            game:service('VirtualInputManager'):SendKeyEvent(false, "Z",
                                                                false, game)
                                                        end
                                                        if bai.x and v.Humanoid.Health > 0 then
                                                            game:service('VirtualInputManager'):SendKeyEvent(true, "X",
                                                                false, game)
                                                            wait(.1)
                                                            game:service('VirtualInputManager'):SendKeyEvent(false, "X",
                                                                false, game)
                                                        end
                                                        if bai.c and v.Humanoid.Health > 0 then
                                                            game:service('VirtualInputManager'):SendKeyEvent(true, "C",
                                                                false, game)
                                                            wait(.1)
                                                            game:service('VirtualInputManager'):SendKeyEvent(false, "C",
                                                                false, game)
                                                        end
                                                        if bai.v and v.Humanoid.Health > 0 then
                                                            game:service('VirtualInputManager'):SendKeyEvent(true, "V",
                                                                false, game)
                                                            wait(.1)
                                                            game:service('VirtualInputManager'):SendKeyEvent(false, "V",
                                                                false, game)
                                                        end
                                                    end
                                                end
                                            end)
                                        elseif percent > bai.zhangshaxian and v.Humanoid.Health > 0 then
                                            if game:GetService("Players").LocalPlayer.Character:FindFirstChild(
                                                "Human-Human: Buddha") then
                                                if bai.z and v.Humanoid.Health > 0 and
                                                    game.Players.LocalPlayer.Character.HumanoidRootPart.Size ==
                                                    Vector3.new(7.6, 7.676, 3.686) then
                                                    game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false,
                                                        game)
                                                    wait(.1)
                                                    game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false,
                                                        game)
                                                end
                                            end

                                            bai.SelectToolWeapon = bai.SelectToolWeaponOld

                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                                v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
                                            wait()

                                            local health = v.Humanoid.Health
                                            local maxhealth = v.Humanoid.MaxHealth
                                            local percent = (health / maxhealth) * 100
                                            if percent > bai.zhangshaxian and v.Humanoid.Health > 0 then
                                                game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 600))
                                            else
                                                bai.SelectToolWeapon = game.Players.LocalPlayer.Data.DevilFruit.Value
                                                wait(1)
                                            end
                                        end
                                    until v.Humanoid.Health <= 0 or not v.Parent or not bai.autosjiguoshi

                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)
spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if bai.autofram == true or bai.autosjiguoshi == true then
            CheckQuest()
            pcall(function()

                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == Ms then
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                        local freeze = Instance.new("BodyVelocity", v.HumanoidRootPart)
                        freeze.Velocity = Vector3.new(0, 0, 0)
                        freeze.P = 100000
                        v.HumanoidRootPart.CFrame = PosMon
                        v.Humanoid.JumpPower = 0
                        v.Humanoid.WalkSpeed = 0
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)

                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        v.Humanoid:ChangeState(11)

                    end

                end
            end)
        end
    end)
end)
function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end
if NewWorld then
    spawn(function()
        while wait(.2) do
            if bai.autoraid then
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                    end
                end

                if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                    if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1")  then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", bai.selectraid)
                    end
                    if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or  game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip")  then
                        fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                    end
                end
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if bai.autoraid and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
                        pcall(function()
                            repeat wait(.1)
                                if setsimulationradius then
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                end
                                v.HumanoidRootPart.Transparency = 70
                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                v.HumanoidRootPart.CanCollide = false
                                if v.Humanoid.Health > 0 then
                                    v.Humanoid.Health = 0 
                                elseif v.Humanoid.Health == 0 then
                                    v.Humanoid.Health = v.Humanoid.MaxHealth
                                else
                                    v.Humanoid.Health = 0 
                                end
                            until not bai.autoraid or not v.Parent or v.Humanoid.Health <= 0
                        end)
                    end
                end
                spawn(function()
                    while wait(.2) do
                        pcall(function()
                            if bai.autoraid then
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end) 
                    end
                end)
                if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then
                    if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") then

                        tp(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))

                    elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") then

                        tp(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))

                    elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") then

                        tp(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))

                    elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") then

                        tp(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))

                    elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then



                    end
                end
                local args = {
                    [1] = "Awakener",
                    [2] = "Check"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                local args = {
                    [1] = "Awakener",
                    [2] = "Awaken"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end)
elseif ThreeWorld then
    spawn(function()
        while wait(.2) do
            if bai.autoraid then
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                    end
                end
                if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                    if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1")  then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", bai.selectraid)
                    end
                    if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or  game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip")  then
                        fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                    end
                end
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if bai.autoraid and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
                        pcall(function()
                            repeat wait(.1)
                                if setsimulationradius then
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                end
                                v.HumanoidRootPart.Transparency = 70
                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                v.HumanoidRootPart.CanCollide = false
                                if v.Humanoid.Health > 0 then
                                    v.Humanoid.Health = 0 
                                elseif v.Humanoid.Health == 0 then
                                    v.Humanoid.Health = v.Humanoid.MaxHealth
                                else
                                    v.Humanoid.Health = 0 
                                end
                            until not bai.autoraid or not v.Parent or v.Humanoid.Health <= 0
                        end)
                    end
                end
                spawn(function()
                    while wait(.2) do
                        pcall(function()
                            if bai.autoraid then
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end) 
                    end
                end)
                if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") or game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then
                    if game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5") then

                        tp(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland5"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))

                    elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4") then

                        tp(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland4"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))

                    elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3") then

                        tp(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland3"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))

                    elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2") then

                        tp(game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland2"):FindFirstChildWhichIsA("Part").CFrame*CFrame.new(0,20,0))

                    elseif game:GetService("Workspace").Map.RaidMap:FindFirstChild("RaidIsland1") then



                    end
                end
                local args = {
                    [1] = "Awakener",
                    [2] = "Check"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                local args = {
                    [1] = "Awakener",
                    [2] = "Awaken"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end)
    else
        notify("白","你无法使用袭击，请你到2或者3海再使用",15)
end
game:GetService("RunService").Heartbeat:Connect(
	function()
		if bai.autofram or bai.autosjiguoshi then
			if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
				game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
			end
		end
	end)
spawn(function()
    while task.wait(.2) do
        if bai.autofram == true or bai.autosjiguoshi == true then
            EquipWeapon(bai.SelectToolWeapon)
        end
    end
end)
local CombatFrameworkROld = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
local CombatFrameworkR = getupvalues(CombatFrameworkROld)[2]
local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
CameraShakerR:Stop()
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            CombatFrameworkR.activeController.hitboxMagnitude = 55
            if bai.fastacttack == true then
                if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") then
                    CombatFrameworkR.activeController.timeToNextAttack = 3
                elseif game.Players.LocalPlayer.Character:FindFirstChild("Electro") then
                    CombatFrameworkR.activeController.timeToNextAttack = 2
                else
                    CombatFrameworkR.activeController.timeToNextAttack = 0
                end
                CombatFrameworkR.activeController.attacking = false
                CombatFrameworkR.activeController.increment = 3
                CombatFrameworkR.activeController.blocking = false
                CombatFrameworkR.activeController.timeToNextBlock = 0
                game.Players.LocalPlayer.Character.Humanoid.Sit = false

            end

        end)
    end)
end)

spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            if bai.fastacttack == true then
                click()
            end

        end)
    end)
end)

if OldWorld then
    Island = {
        ["初始岛"] = CFrame.new(1071.2832, 16.3085976, 1426.86792),
        ["初始海洋"] = CFrame.new(-2573.3374, 6.88881969, 2046.99817),
        ["中部城镇"] = CFrame.new(-655.824158, 7.88708115, 1436.67908),
        ["丛林"] = CFrame.new(-1249.77222, 11.8870859, 341.356476),
        ["海盗村"] = CFrame.new(-1122.34998, 4.78708982, 3855.91992),
        ["沙漠"] = CFrame.new(1094.14587, 6.47350502, 4192.88721),
        ["冰冻村庄"] = CFrame.new(1198.00928, 27.0074959, -1211.73376),
        ["马林福特"] = CFrame.new(-4505.375, 20.687294, 4260.55908),
        ["斗兽场"] = CFrame.new(-1428.35474, 7.38933945, -3014.37305),
        ["天空1楼"] = CFrame.new(-4970.21875, 717.707275, -2622.35449),
        ["天空2楼"] = CFrame.new(-4813.0249, 903.708557, -1912.69055),
        ["天空3楼"] = CFrame.new(-7952.31006, 5545.52832, -320.704956),
        ["监狱"] = CFrame.new(4854.16455, 5.68742752, 740.194641),
        ["岩浆村"] = CFrame.new(-5231.75879, 8.61593437, 8467.87695),
        ["水下城市"] = CFrame.new(61163.8516, 11.7796879, 1819.78418),
        ["喷泉城"] = CFrame.new(5132.7124, 4.53632832, 4037.8562),
        ["赛博格之家"] = CFrame.new(6262.72559, 71.3003616, 3998.23047),
        ["Shank 的房间"] = CFrame.new(-1442.16553, 29.8788261, -28.3547478),
        ["黑帮岛"] = CFrame.new(-2850.20068, 7.39224768, 5354.99268)
    }
elseif NewWorld then
    Island = {
        ["初始岛"] = CFrame.new(82.9490662, 18.0710983, 2834.98779),
        ["玫瑰王国"] = game.Workspace["_WorldOrigin"].Locations["Kingdom of Rose"].CFrame,
        ["黑暗区域"] = game.Workspace["_WorldOrigin"].Locations["Dark Arena"].CFrame,
        ["明哥大厦"] = CFrame.new(-390.096313, 331.886475, 673.464966),
        ["明哥房间"] = CFrame.new(2302.19019, 15.1778421, 663.811035),
        ["绿色地区"] = CFrame.new(-2372.14697, 72.9919434, -3166.51416),
        ["咖啡馆"] = CFrame.new(-385.250916, 73.0458984, 297.388397),
        ["工厂"] = CFrame.new(430.42569, 210.019623, -432.504791),
        ["罗马竞技场"] = CFrame.new(-1836.58191, 44.5890656, 1360.30652),
        ["幽灵岛"] = CFrame.new(-5571.84424, 195.182297, -795.432922),
        ["幽灵岛2"] = CFrame.new(-5931.77979, 5.19706631, -1189.6908),
        ["雪山"] = CFrame.new(1384.68298, 453.569031, -4990.09766),
        ["冷和热"] = CFrame.new(-6026.96484, 14.7461271, -5071.96338),
        ["岩浆边"] = CFrame.new(-5478.39209, 15.9775667, -5246.9126),
        ["诅咒的船"] = CFrame.new(902.059143, 124.752518, 33071.8125),
        ["霜冻岛"] = CFrame.new(5400.40381, 28.21698, -6236.99219),
        ["被遗忘的岛屿"] = CFrame.new(-3043.31543, 238.881271, -10191.5791),
        ["索阿普岛"] = CFrame.new(4748.78857, 8.35370827, 2849.57959),
        ["低空突袭"] = CFrame.new(-5554.95313, 329.075623, -5930.31396),
        ["迷你天空"] = CFrame.new(-260.358917, 49325.7031, -35259.3008)
    }
elseif ThreeWorld then
    Island = {
        ["初始岛"] = CFrame.new(-287, 30, 5388),
        ["九头蛇岛"] = CFrame.new(3399.32227, 72.4142914, 1572.99963, -0.809679806, -4.48284467e-08, 0.586871922,
            2.42332163e-08, 1, 1.09818842e-07, -0.586871922, 1.0313989e-07, -0.809679806),
        ["房间Enma/Yama&Secret寺庙"] = CFrame.new(5247, 7, 1097),
        ["九头蛇岛别墅"] = CFrame.new(5245, 602, 251),
        ["世界树"] = CFrame.new(2443, 36, -6573),
        ["海上城堡"] = CFrame.new(-5500, 314, -2855),
        ["豪宅"] = CFrame.new(-12548, 337, -7481),
        ["漂浮的海龟"] = CFrame.new(-10016, 332, -8326),
        ["闹鬼城堡"] = CFrame.new(-9509.34961, 142.130661, 5535.16309),
        ["花生岛"] = CFrame.new(-2131, 38, -10106),
        ["冰淇淋岛"] = CFrame.new(-950, 59, -10907),
        ["蛋糕岛"] = CFrame.new(-1762, 38, -11878),
        ["圣诞岛"] = CFrame.new(-1083.08093, 5.79677963, -14144.5029)

    }
end
if OldWorld then
    Island1 = {"初始岛", "初始海洋", "中部城镇", "丛林", "海盗村", "沙漠", "冰冻村庄",
               "马林福特", "斗兽场", "天空1楼", "天空2楼", "天空3楼", "监狱", "岩浆村",
               "水下城市", "喷泉城", "赛博格之家", "Shank 的房间", "黑帮岛"}
elseif NewWorld then
    Island1 = {"初始岛", "玫瑰王国", "黑暗区域", "明哥大厦", "明哥房间", "绿色地区", "咖啡馆",
               "工厂", "罗马竞技场", "幽灵岛", "幽灵岛2", "雪山", "冷和热", "岩浆边",
               "诅咒的船", "霜冻岛", "被遗忘的岛屿", "索阿普岛", "低空突袭", "迷你天空"}
elseif ThreeWorld then
    Island1 = {"初始岛", "Hydar岛", "房间Enma/Yama&Secret寺庙", "Hydar岛别墅", "世界树", "海上城堡",
               "豪宅", "漂浮的海龟", "闹鬼城堡", "花生岛", "冰淇淋岛", "蛋糕岛", "圣诞岛"}
end
spawn(function()
    while wait(.2) do
        if bai.autonew then
            local MyLevel = game.Players.localPlayer.Data.Level.Value
            if MyLevel >= 700 and OldWorld and bai.autonew then
                bai.autofram = false
                if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") ~= 0 then
                    if Workspace.Map.Ice.Door.Transparency == 1 then
                        if (CFrame.new(1347.7124, 37.3751602, -1325.6488).Position -
                            game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 250 then
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
                                local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Key")
                                wait(.4)
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                            end
                            tp(CFrame.new(1347.7124, 37.3751602, -1325.6488), true)
                            if (CFrame.new(1347.7124, 37.3751602, -1325.6488).Position -
                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1347.7124,
                                    37.3751602, -1325.6488)
                            end
                        elseif game.Workspace.Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") and
                            game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency ==
                            1 and
                            (CFrame.new(1347.7124, 37.3751602, -1325.6488).Position -
                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then

                            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if CheckBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and
                                    v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name ==
                                    "Ice Admiral [Lv. 700] [Boss]" then
                                    repeat
                                        wait()
                                        if (v.HumanoidRootPart.Position -
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude >
                                            300 then
                                            tp(v.HumanoidRootPart.CFrame, true)
                                        elseif (v.HumanoidRootPart.Position -
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <=
                                            300 then

                                            EquipWeapon(SelectToolWeapon)
                                            fastacttack = true
                                            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                local args = {
                                                    [1] = "Buso"
                                                }
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(
                                                    args))
                                            end
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                                v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 1)
                                            click()
                                        end
                                    until not v.Parent or v.Humanoid.Health <= 0 or AutoNew == false
                                    fastacttack = false
                                end
                            end

                        end
                    else
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") or
                            game.Players.LocalPlayer.Character:FindFirstChild("Key") then
                            tp(CFrame.new(1347.7124, 37.3751602, -1325.6488), true)
                            if (CFrame.new(1347.7124, 37.3751602, -1325.6488).Position -
                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1347.7124,
                                    37.3751602, -1325.6488)
                                local args = {
                                    [1] = "DressrosaQuestProgress",
                                    [2] = "Detective"
                                }
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                wait(0.5)
                                if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
                                    local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Key")
                                    wait(.4)
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                                end
                            end
                        else
                            tp(CFrame.new(4849.29883, 5.65138149, 719.611877), true)
                            if (CFrame.new(4849.29883, 5.65138149, 719.611877).Position -
                                game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4849.29883,
                                    5.65138149, 719.611877)
                                local args = {
                                    [1] = "DressrosaQuestProgress",
                                    [2] = "Detective"
                                }
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                wait(0.5)
                                if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
                                    local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Key")
                                    wait(.4)
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                                end
                            end
                        end
                    end
                else
                    local args = {
                        [1] = "TravelDressrosa" -- OLD WORLD to NEW WORLD
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
        end
    end
end)
function Teleport()
    while wait(.2) do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end
local veryImportantWaitTime = 0.5
task.spawn(function()
    while task.wait(veryImportantWaitTime) do
        pcall(function()
            for i, v in pairs(game.CoreGui:GetDescendants()) do
                pcall(function()
                    if string.find(v.Name, "ErrorMessage") then
                        if string.find(v.Text, "Security kick") then
                            veryImportantWaitTime = 1e9
                            Teleport()
                        end
                    end
                end)
            end
        end)
    end
end)
task.spawn(function()
    while true do
        wait(.2)
        if bai.zidongzhuanqian == true then
            local hasChar = game.Players.LocalPlayer:FindFirstChild("Character")
            if not game.Players.LocalPlayer.Character then

            else
                local hasCrewTag = game.Players.LocalPlayer.Character:FindFirstChild("CrewBBG", true)
                if hasCrewTag then
                    hasCrewTag:Destroy()
                end
                local hasHumanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                if hasHumanoid then
                    local Chest = game.Workspace:FindFirstChild("Chest4") or game.Workspace:FindFirstChild("Chest3") or
                                      game.Workspace:FindFirstChild("Chest2") or game.Workspace:FindFirstChild("Chest1") or
                                      game.Workspace:FindFirstChild("Chest")

                    if Chest then
                        game.Players.LocalPlayer.Character:PivotTo(Chest:GetPivot())
                        firesignal(Chest.Touched, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    else
                        Teleport()
                        break
                    end
                end
            end
        end
        task.wait()
    end

end)
spawn(function()
    while wait(.2) do
        pcall(function()
            if bai.autojiansuiguo == true then
                for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v:IsA("Tool") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                        v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait(.2) do
        if bai.fanwei then
            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                if bai.fanwei and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then
                    pcall(function()
                        repeat wait(.1)
                            if setsimulationradius then
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            end
                            v.HumanoidRootPart.Transparency = 1
                            v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                            v.HumanoidRootPart.CanCollide = false
                            if v.Humanoid.Health > 0 then
                                v.Humanoid.Health = 0 
                            elseif v.Humanoid.Health == 0 then
                                v.Humanoid.Health = v.Humanoid.MaxHealth
                            else
                                v.Humanoid.Health = 0 
                            end
                        until not bai.fanwei or not v.Parent or v.Humanoid.Health <= 0
                    end)
                end
            end
        end
    end
end)
local bailib = loadstring(game:HttpGet "https://raw.githubusercontent.com/IIIlllIlIIIllllllIIIllllllIII/.-/main/Silent%20ui%20lib%20-obfuscated.lua")()
local win = bailib:new("白--bf")
local Tab1 = win:Tab("自动功能", "10882439086")
local Tab5 = win:Tab("自动打袭击(F)", "10882439086")
local Tab = win:Tab("传送功能", "10882439086")
local Tab2 = win:Tab("加点功能", "10882439086")
local Tab3 = win:Tab("其他功能", "10882439086")
local Tab4 = win:Tab("设置", "10882439086")
local Section = Tab:section("其他功能", true)
local Section4 = Tab:section("岛屿", true)
local Section1 = Tab2:section("自动加点", true)
local Section2 = Tab1:section("选择武器", true)
local Section3 = Tab1:section("自动功能", true)
local Section5 = Tab3:section("其他功能", true)
local Section6 = Tab1:section("自动升级果实", true)
local Section7 = Tab4:section("设置", true)
local Section8 = Tab5:section("自动功能", true)
Wapon = {}

for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:IsA("Tool") then
        table.insert(Wapon, v.Name)
    end
end
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if v:IsA("Tool") then
        table.insert(Wapon, v.Name)
    end
end
local cswq = Section2:Dropdown("选择武器", 'Dropdown', Wapon, function(Value)
    bai.SelectToolWeapon = Value
    bai.SelectToolWeaponOld = Value
end)
Section2:Button("刷新武器", function()

    Wapon = {}
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(Wapon, v.Name)
        end
    end
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(Wapon, v.Name)
        end
    end

    cswq:SetOptions(Wapon)
end)

Section3:Toggle("自动升级", 'Toggleflag', false, function(v)
    if bai.SelectToolWeapon == nil then

        return notify("白", "请你选择武器", 4)
    end
    if v then
        NoClip(true)
        bai.fastacttack = true
        bai.autofram = true
    else
        NoClip(false)
        bai.fastacttack = false
        bai.autofram = false
    end
end)

if OldWorld then

    Section3:Toggle("自动前往2海", 'Toggleflag', false, function(v)
        bai.autonew = v
    end)
end
Section3:Toggle("自动赚钱", 'Toggleflag', false, function(v)

    game:service 'ReplicatedStorage'.Remotes.CommF_:InvokeServer("SetTeam", "Pirates");

    if v == true then
        bai.zidongzhuanqian = true
    else
        bai.zidongzhuanqian = false
    end

end)
Section6:Slider('斩杀线', 'Sliderflag', 17, 1, 30, false, function(s)
    bai.zhangshaxian = s

end)
Section6:Toggle("自动升级果实", 'Toggleflag', false, function(v)
    if bai.SelectToolWeapon == nil then

        return notify("白", "请你选择武器", 4)
    end
    if v then
        bai.fastacttack = true
        bai.autosjiguoshi = true
        UseSkillMasteryDevilFruit = true
    else
        bai.fastacttack = false
        bai.autosjiguoshi = false
        UseSkillMasteryDevilFruit = false
    end
end)
Section6:Toggle("使用x键", 'Toggleflag', true, function(v)
    bai.x = v
end)
Section6:Toggle("使用z键", 'Toggleflag', true, function(v)
    bai.z = v
end)
Section6:Toggle("使用c键", 'Toggleflag', true, function(v)
    bai.c = v
end)
Section6:Toggle("使用v键", 'Toggleflag', true, function(v)
    bai.v = v
end)
Section:Button("传送到1海", function()
    local args = {
        [1] = "TravelMain"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Section:Button("传送到2海", function()
    local args = {
        [1] = "TravelDressrosa"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Section:Button("传送到3海", function()
    local args = {
        [1] = "TravelZou"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Section4:Dropdown("岛屿", 'Dropdown', Island1, function(Value)
    bai.daoyu = Value
    tp(Island[bai.daoyu])
end)
local PointStats
Section1:Textbox("加点数量", 'TextBoxfalg', "1", function(txt)
    PointStats = txt
end)
Section1:Toggle("近战", 'Toggleflag', false, function(v)
    while v do
        wait()
        local args = {
            [1] = "AddPoint",
            [2] = "Melee",
            [3] = PointStats
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

    end
end)
Section1:Toggle("生命", 'Toggleflag', false, function(v)
    while v do
        wait()
        local args = {
            [1] = "AddPoint",
            [2] = "Defense",
            [3] = PointStats
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

    end
end)
Section1:Toggle("剑", 'Toggleflag', false, function(v)
    while v do
        wait()
        local args = {
            [1] = "AddPoint",
            [2] = "Sword",
            [3] = PointStats
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

    end
end)
Section1:Toggle("枪", 'Toggleflag', false, function(v)
    while v do
        wait()
        local args = {
            [1] = "AddPoint",
            [2] = "Gun",
            [3] = PointStats
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

    end
end)

Section1:Toggle("水果", 'Toggleflag', false, function(v)
    while v do
        wait()
        local args = {
            [1] = "AddPoint",
            [2] = "Demon Fruit",
            [3] = PointStats
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

    end
end)
Section5:Toggle("快速点击", 'Toggleflag', false, function(state)
    if state then
        bai.fastacttack = true
        while true do

            task.wait(0.2)
            if state == true then
                click()
            end

        end
    else
        bai.fastacttack = false
    end
end)
Section5:Button("打开果实背包", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true

end)
Section5:Toggle("自动捡水果", 'Toggleflag', false, function(v)
    if v then
        bai.autojiansuiguo = true

    else
        bai.autojiansuiguo = false
    end
end)
Section7:Toggle("使用死亡传送", 'Toggleflag', false, function(v)
    if v == true then
        bai.usefasttp = true
    else
        bai.usefasttp = false
    end
end)
 Section8:Dropdown("选择类型", 'Dropdown', {"火焰","冰","地震","闪闪","黑暗","弦","隆隆","岩浆","佛"}, function(Value)
    if Value=="火焰" then
    bai.selectraid = "Flame"
    elseif Value=="冰" then
    bai.selectraid = "Ice"
elseif Value=="地震" then
    bai.selectraid = "Quake"
elseif Value=="闪闪" then
    bai.selectraid = "Light"
elseif Value=="黑暗" then
    bai.selectraid = "Dark"
elseif Value=="弦" then
    bai.selectraid = "String"
elseif Value=="隆隆" then
    bai.selectraid = "Rumble" 
elseif Value=="岩浆" then
    bai.selectraid = "Magma" 
elseif Value=="佛" then
    bai.selectraid = "Human: Buddha" 
    end
end)
Section8:Toggle("自动袭击", 'Toggleflag', false, function(v)
    if v == true then
        bai.autoraid = true
    else
        bai.autoraid = false
    end
end)
Section8:Toggle("自动杀死附近的怪", 'Toggleflag', false, function(v)
    if v == true then
        bai.fanwei = true
    else
        bai.fanwei = false
    end
end)
spawn(function()
    local gg = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg, false)
    gg.__namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method) == "FireServer" then
            if tostring(args[1]) == "RemoteEvent" then
                if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                    if UseSkillMasteryDevilFruit then
                        args[2] = PositionSkillMasteryDevilFruit
                        return old(unpack(args))
                    end
                end
            end
        end
        return old(...)
    end)
end)
