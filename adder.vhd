library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
    Port (
        A     : in  STD_LOGIC;      -- First input bit
        B     : in  STD_LOGIC;      -- Second input bit
        Cin   : in  STD_LOGIC;      -- Carry input
        Sum   : out STD_LOGIC;      -- Sum output
        Cout  : out STD_LOGIC       -- Carry output
    );
end FullAdder;

architecture Behavioral of FullAdder is
begin
--Sum and carry output calculations
    Sum <= A XOR B XOR Cin;         -- Sum calculation
    Cout <= (A AND B) OR (Cin AND (A XOR B)); -- Carry output calculation
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RippleCarryAdder is
    Port (
        A      : in  STD_LOGIC_VECTOR (3 downto 0);  -- 4-bit input A
        B      : in  STD_LOGIC_VECTOR (3 downto 0);  -- 4-bit input B
        Cin    : in  STD_LOGIC;                      -- Carry input
        Sum    : out STD_LOGIC_VECTOR (3 downto 0);  -- 4-bit Sum output
        Cout   : out STD_LOGIC                       -- Carry output
    );
end RippleCarryAdder;

architecture Behavioral of RippleCarryAdder is

    signal C : STD_LOGIC_VECTOR (4 downto 0);  -- Carry signals

begin
    C(0) <= Cin;  -- Initial carry input

    -- Full Adder Instances
    FullAdder0: entity work.FullAdder port map (A(0), B(0), C(0), 
    Sum(0), C(1));
    FullAdder1: entity work.FullAdder port map (A(1), B(1), C(1), Sum(1), C(2));
    FullAdder2: entity work.FullAdder port map (A(2), B(2), C(2), Sum(2), C(3));
    FullAdder3: entity work.FullAdder port map (A(3), B(3), C(3), Sum(3), C(4));

    Cout <= C(4);  -- Final carry out

end Behavioral;
