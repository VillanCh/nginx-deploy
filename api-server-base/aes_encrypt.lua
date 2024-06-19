local aes = require "resty.aes"
local str = require "resty.string"

-- 从环境变量获取 AES 密钥和 IV
local key = "76d8749b07b4ce66"
local iv = "fedcba9876543210"

-- 检查密钥和 IV 是否为空
if not key or not iv then
    ngx.log(ngx.ERR, "AES key or IV is not set")
    return ngx.exit(500)
end


local function aes_encrypt(data)
    local aes_128_cbc_md5 = aes:new(key, nil, aes.cipher(128, "cbc"), { iv = iv })
    return aes_128_cbc_md5:encrypt(data)
end

-- 主要处理函数，用于处理响应体
function encrypt_body()
    chunk = ngx.arg[1]
    eof = ngx.arg[2]
    ngx.ctx.buffer = ngx.ctx.buffer or ""

    if chunk then
        ngx.ctx.buffer = ngx.ctx.buffer .. chunk
    end

    if eof then
        local encrypted_data = aes_encrypt(ngx.ctx.buffer)
        if encrypted_data then
            ngx.arg[1] = str.to_hex(encrypted_data)  -- 将加密后的数据转换成十六进制并返回
        else
            ngx.log(ngx.ERR, "Failed to encrypt data")
            return ngx.exit(500)
        end
    else
        ngx.arg[1] = nil  -- 清空当前 chunk
    end
end

-- 在 Lua 中，文件末尾的返回语句是必需的
encrypt_body()