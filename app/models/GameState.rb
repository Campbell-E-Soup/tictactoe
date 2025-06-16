class GameState
  attr_accessor :grid, :won, :current_player

  def initialize(grid: nil, won: 0, current_player: 1)
        @grid = grid || Array.new(3) { Array.new(3, 0) }
        @won = won
        @current_player = current_player
  end

  def to_h
    { 
        won: @won,
        grid: @grid,
        current: @current_player
    }
  end

  def self.from_h(hash)
    new(
        grid: hash['grid'],
        won: hash['won'],
        current_player: hash['current']
    )
  end

  def switch_player
    case @current_player
        when 1
            @current_player = 2
        when 2
            @current_player = 1
    end
  end

  def check_winner
    xVictory = false
    oVictory = false
    emptySpaces = 0
    #horizonal checks
    (0..2).each do |y|
        xs = 0
        os = 0
        mt = 0
        (0..2).each do |x|
            case @grid[y][x]
                when 0
                    mt += 1
                when 1
                    xs += 1
                when 2
                    os += 1
            end
        end
        emptySpaces += mt
        if (xs == 3)
            return 1
        elsif (os == 3)
            return 2
        end
    end

    #vertical checks
    (0..2).each do |x|
        xs = 0
        os = 0
        mt = 0
        (0..2).each do |y|
            case @grid[y][x]
                when 0
                    mt += 1
                when 1
                    xs += 1
                when 2
                    os += 1
            end
        end
        emptySpaces += mt
        if (xs == 3)
            return 1
        elsif (os == 3)
            return 2
        end
    end

    #diag checks
    (0...2).each do |j|
        xs = 0
        os = 0
        mt = 0
        (0..2).each do |i|
            x = j == 0 ? i : 2 - i
            y = i
            case @grid[y][x]
                when 0
                    mt += 1
                when 1
                    xs += 1
                when 2
                    os += 1
            end
        end
        emptySpaces += mt
        if (xs == 3)
            return 1
        elsif (os == 3)
            return 2
        end
    end
    return emptySpaces == 0 ? -1 : 0
  end

  COLORS = [
    "secondary",
    "danger",
    "primary"
  ]

  PLAYERS = [
    "NOBODY", #you should never see this
    "X",
    "O"
  ]

  ICONS = [
    "fa-solid fa-fw",
    "fa-solid fa-xmark",
    "fa-solid fa-o"
  ]
end