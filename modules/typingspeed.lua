vim.cmd "autocmd InsertEnter * lua last_insert_state = TypingSpeedStart()"

vim.cmd "autocmd InsertLeave * lua last_typing_speed = TypingSpeedEnd(last_insert_state)"

-- cant get vim.cmd to capture the output of the //gne
-- function TypingSpeedStart()
    -- chars_string = vim.cmd([[%s/\S//gne]])
    -- i, j = string.find(chars_string, " ")
    -- chars_int = tonumber(string.sub(chars_string, 1, i))
    -- print('starting count', chars_string)
    -- return {start_time = os.clock(), start_chars = chars_string}
-- end

-- function TypingSpeedEnd(last_insert_state)
    -- time_typing = os.clock() - last_insert_state.start_time
    -- print(time_typing)
    -- chars_string = vim.cmd([[%s/\S//gne]])
    -- print("ending count", chars_string)
    -- i, j = string.find(chars_string, " ")
    -- chars_int = tonumber(string.sub(chars_string, 1, i))
    -- chars_typed = chars_int - last_insert_state.start_chars
    -- print(chars_typed)
    -- words_typed = chars_typed / 5
    -- print(words_typed)
    -- minutes_typing = time_typing / 60
    -- print(minutes_typing)
    -- wpm = math.floor(words_typed / minutes_typing)
    -- print(wpm)
    -- return wpm
-- end


-- working but slightly inaccurate
last_typing_speed = 0

function TypingSpeedStart()
    return {start_time = os.clock(), start_chars = vim.fn.wordcount().words}
end

function TypingSpeedEnd(last_insert_state)
    time_typing = os.clock() - last_insert_state.start_time
    words_typed = vim.fn.wordcount().words - last_insert_state.start_chars
    minutes_typing = time_typing / 60
    wpm = math.floor(words_typed / minutes_typing)
    return tostring(wpm)
end
