-module(banking).

-export([parse_bank_info/1, print_banks_report/2, sum_original/1]).

-record(log_entry, {bank_name, customer_name, loan_request, granted}).

%% Function: parse_bank_info/1
%% Description: Parses bank information and returns a list of log entries.
%%              Each log entry represents a loan request.
parse_bank_info(BankInfo) ->
    lists:map(fun({CustomerName, LoanRequest}) ->
        #log_entry{bank_name = BankInfo, customer_name = CustomerName, loan_request = LoanRequest, granted = false}
    end, BankInfo).

%% Function: print_banks_report/2
%% Description: Prints a report of banks and their granted loan amounts.
%%              Log represents the list of all bank transactions.
%%              Banks represents the list of unique bank names.
print_banks_report(Log, Banks) ->
    lists:foreach(fun(Bank) ->
        io:format("~s Bank~n", [Bank]),
        io:format("------------------------------~n"),
        print_bank_details(Log, Bank),
        io:format("------------------------------~n")
    end, Banks).

%% Helper Function: print_bank_details/2
%% Description: Prints loan details for a specific bank.
print_bank_details(Log, BankName) ->
    BankTotal = find_bank_balance(Log, BankName),
    io:format("Bank Balance: ~p~n", [BankTotal]).

%% Helper Function: find_bank_balance/2
%% Description: Calculates and returns the total loan amount granted by a specific bank.
find_bank_balance(Log, BankName) ->
    lists:sum([Entry#log_entry.granted || Entry <- Log, Entry#log_entry.bank_name == BankName]).

%% Function: sum_original/1
%% Description: Calculates and returns the total loan amount requested by all banks.
sum_original(Banks) ->
    lists:sum([Entry#log_entry.loan_request || Entry <- Banks]).

