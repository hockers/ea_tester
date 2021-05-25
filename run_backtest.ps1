# Specifies deposit amount to test (in dollars).
# export BT_DEPOSIT="10000" #@param ["100", "1000", "2000", "10000", "20000", "100000"] {allow-input: true}
$env:BT_DEPOSIT = "10000"

# Specifies range of days in each month to test. Default: 1-31.
# export BT_DAYS="1" #@param ["1", "1-2", "1-7", "1-15", "16-31", "1-31"] {allow-input: true}
$env:BT_DAYS = "1"

# Specifies range of months in each year to test. Default: 1-12.
# export BT_MONTHS="1" #@param ["1", "1-2", "1-6", "6-12", "1-12"] {allow-input: true}
$env:BT_MONTHS = "1"

# Specifies range of years to test. Default: 2019.
# export BT_YEARS="2020" #@param ["2020", "2019", "2018", "2017"] {allow-input: true}
$env:BT_YEARS = "2020"

# Specifies timeframe to use for the test.
# export BT_PERIOD="M30" #@param ["M1", "M5", "M15", "M30", "H1", "H4", "D1"]
$env:BT_PERIOD = "M30"

# Specifies spread to test in points. Default: 10.
# export BT_SPREAD=10 #@param {type:"slider", min:0, max:50, step:1}
$env:BT_SPREAD = "10"

# Specifies number of digits after decimal point for the current symbol prices. Default: 5.
# export BT_DIGITS=5 #@param {type:"slider", min:4, max:5, step:1}
$env:BT_DIGITS = "5"

# Specifies type of backtest data being tested.
# Values: 0 (default) - Every tick, 1 - Control points, 2 - Open prices only.
# export BT_TESTMODEL="0" #@param ["0", "1", "2"]
$env:BT_TESTMODEL = "0"

# Specifies EA to backtest (filename, URL or pattern).
# EA_VERSION="v1.003" #@param ["v1.003", "v1.002", "v1.001", "v1.000"]
# export TEST_EXPERT="https://github.com/EA31337/EA31337-Libre/releases/download/${EA_VERSION}/EA31337-Libre-${EA_VERSION}.ex4" #@param {type:"string"}
$env:EA_VERSION = "v1.003"
$env:TEST_EXPERT = "https://github.com/EA31337/EA31337-Libre/releases/download/$($env:EA_VERSION)/EA31337-Libre-$($env:EA_VERSION).ex4"

# Specifies version of MetaTrader to use for the test.
# export MT_VER="4.0.0.1320"
# export MT_VER="5.0.0.2878"
$env:MT_VER = "4.0.0.1320"

# Advanced settings.
# export RUN_ON_EXIT="kill_display" # We need to kill display at the end of the test (to avoid cell hangs).
# $env:RUN_ON_EXIT = "kill_display"

# Backtest troubleshooting.
#export OPT_DRY_RUN=1 # Uncomment to run backtest without running the actual test.
#export OPT_TRACE=1 # Uncomment to enable trace messages.
# $env:OPT_TRACE = "1"

# Run the backtest.
# run_backtest -O /content/_results -C -V -t | tee -a backtest-stderr.txt # 2>backtest-stderr.txt
# run_backtest -e TestEnvelopes -v | tee -a backtest-stderr.txt

# Run backtest in Docker
# docker run ea31337/ea-tester run_backtest -e TestEnvelopes -v

# Test 1
$start = Get-Date
docker run ea31337/ea-tester:EURUSD-2019-DS run_backtest -v -e $env:TEST_EXPERT
$end = Get-Date
Write-Output "Start: $start End: $end"

# Test 2
$start = Get-Date
docker run ea31337/ea-tester:EURUSD-2020-DS run_backtest -v -e $env:TEST_EXPERT
$end = Get-Date
Write-Output "Start: $start End: $end"