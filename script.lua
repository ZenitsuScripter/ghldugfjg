-- ========== TESTE DE SENHA ==========
print("=== INICIANDO TESTE DE SENHA ===")

local function verificarSenha()
    local antiCache = "?cache=" .. tostring(tick())
    local url = "https://raw.githubusercontent.com/ZenitsuScripter/SDF/main/hhhhjjjjj" .. antiCache
    
    print("Buscando senha em:", url)
    
    local success, senhaGitHub = pcall(function()
        return game:HttpGet(url, true)
    end)
    
    if not success then
        print("❌ ERRO ao baixar:", senhaGitHub)
        return false
    end
    
    print("✅ Senha baixada com sucesso!")
    print("📏 Tamanho bruto:", #senhaGitHub)
    print("📝 Primeiros 80 caracteres:", senhaGitHub:sub(1, 80))
    
    -- Remove caracteres invisíveis
    local senhaLimpa = ""
    for i = 1, #senhaGitHub do
        local char = senhaGitHub:sub(i, i)
        local byte = string.byte(char)
        if byte >= 33 and byte <= 126 then
            senhaLimpa = senhaLimpa .. char
        end
    end
    
    print("📏 Tamanho limpo:", #senhaLimpa)
    print("📝 Primeiros 80 limpos:", senhaLimpa:sub(1, 80))
    
    -- Senha local
    local senhaLocal = "X9#mK2@pL8vN!qW5jR&yF7uT$hG3xB0cD6nS*zI4aE1oM~Y^wQ+V}K8rP|L2fJ5gH@T9uN#C3xW7bA&mS0vD!E6yR$I4pQ~Z1kF+M2nO|G8lH}j"
    
    print("📏 Tamanho senha local:", #senhaLocal)
    print("📝 Primeiros 80 local:", senhaLocal:sub(1, 80))
    
    -- Comparação
    if senhaLimpa == senhaLocal then
        print("✅ SENHAS IGUAIS - ACESSO LIBERADO!")
        return true
    else
        print("❌ SENHAS DIFERENTES - ACESSO NEGADO!")
        print("🔍 Diferença detectada")
        
        -- Mostra onde está a diferença
        for i = 1, math.max(#senhaLimpa, #senhaLocal) do
            local c1 = senhaLimpa:sub(i, i)
            local c2 = senhaLocal:sub(i, i)
            if c1 ~= c2 then
                print("❗ Diferença na posição", i, ":", c1, "vs", c2)
                break
            end
        end
        
        return false
    end
end

-- Executa o teste
local resultado = verificarSenha()
print("=== RESULTADO FINAL:", resultado and "✅ PASSOU" or "❌ FALHOU", "===")

if resultado then
    print("🎉 Script pode carregar normalmente!")
else
    print("🚫 Script seria bloqueado!")
end
