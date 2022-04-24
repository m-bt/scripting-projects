board = {}
board.arr = {}
board.rows = {}
board.isFilled = false

function board.setup()
    for x = 0, 9 do
        board.arr[x] = {}
        for y = 0, 19 do
            board.arr[x][y] = 1
        end
    end

    for i = 0, 19 do
        board.rows[i] = {
            filled = false
        }
    end
end

function board.scan()
    for y = 19, 0, -1 do
        local sum = 0
        for x = 0, 9 do
            if board.arr[x][y] > 1 then
                sum = sum + 1
            end
        end
        if sum == 10 then
            board.rows[y].filled = true
            board.isFilled = true
        end
    end
    
    if board.isFilled == true then
        game.onFill()
    end
end

function board.move()
    for i = 19, 1, -1 do
        if board.rows[i].filled == true then
            for y = i, 1, -1 do
                for x = 0, 9 do
                    board.arr[x][y] = board.arr[x][y - 1]
                end
            end
            board.rows[i].filled = false
        end
    end

    board.isFilled = false
end

function board.save()
    local _board = {
        arr = board.arr,
        rows = board.rows,
        isFilled = board.isFilled
    }
    return _board
end

function board.load(save)
    board.arr = save.arr
    board.rows = save.rows
    board.isFilled = save.isFilled
end

return board
