-module(money).
-export([start/1]).

-record(customer, {name, objective, total_loan}).
-record(bank, {name, funds}).
-record(log_entry, {bank_name, customer_name, loan_request, granted}).

start(Args) ->
    CustomerFile = lists:nth(1, Args),
    BankFile = lists:nth(2, Args),
    {ok, CustomerInfo} = file:consult(CustomerFile),
    {ok, BankInfo} = file:consult(BankFile),
    Customers = extract_customers(CustomerInfo),
    Banks = extract_banks(BankInfo),
    io:format("** The financial market is opening for the day **~n"),
    io:format("Starting transaction log...~n"),
    {FinalCustomers, FinalBanks, Log} = master_loop(Customers, Banks, []),
    print_log(Log),
    print_report(Log, FinalCustomers, FinalBanks),
    io:format("The financial market is closing for the day...~n"),
    ok.

extract_customers(CustomerInfo) ->
    lists:map(
        fun({customer, Name, Objective}) -> #customer{name = Name, objective = Objective, total_loan = 0} end,
        CustomerInfo).

extract_banks(BankInfo) ->
    lists:map(
        fun({bank, Name, Funds}) -> #bank{name = Name, funds = Funds} end,
        BankInfo).

master_loop([], Banks, Log) ->
    {[], Banks, lists:reverse(Log)};
master_loop([Customer | RestCustomers], Banks, Log) ->
    Bank = choose_bank(Banks),
    {Customer1, Bank1, TransactionLog1} = request_loan(Bank, Customer, Log),
    case Customer1#customer.total_loan >= Customer1#customer.objective of
        true -> master_loop(RestCustomers, [Bank1 | Banks], TransactionLog1);
        false -> master_loop([Customer1 | RestCustomers], [Bank1 | Banks], TransactionLog1)
    end.

choose_bank(Banks) ->
    BankIndex = rand:uniform(length(Banks)),
    lists:nth(BankIndex, Banks).

print_log(Log) ->
    lists:foreach(
        fun(Entry) ->
            BankName = Entry#log_entry.bank_name,
            CustomerName = Entry#log_entry.customer_name,
            LoanRequest = Entry#log_entry.loan_request,
            Granted = Entry#log_entry.granted,
            io:format("? ~s requests a loan of ~p dollar(s) from the ~s bank ~n", [CustomerName, LoanRequest, BankName]),
            io:format("$ The ~s bank approves a loan of ~p dollar(s) to ~s ~n", [BankName, Granted, CustomerName])
        end, Log).

print_report(Log, Customers, Banks) ->
    io:format("~n*** Report ***~n"),
    io:format("Customers:~n"),
    print_customers_report(Log, Customers),
    io:format("Banks:~n"),
    print_banks_report(Log, Banks),
    io:format("Total objectives: ~p~n", [sum_objectives(Customers)]),
    io:format("Total received: ~p~n", [sum_received(Log)]),
    io:format("Total original funds: ~p~n", [sum_original(Banks)]),
    io:format("Total loaned: ~p~n", [sum_loaned(Log)]).

print_customers_report(Log, Customers) ->
    lists:foreach(
        fun(Customer) ->
            CustomerName = Customer#customer.name,
            CustomerObjective = Customer#customer.objective,
            CustomerReceived = find_customer_received(Log, CustomerName),
            io:format("- ~s: objective ~p, received ~p~n", [CustomerName, CustomerObjective, CustomerReceived])
        end, Customers).

print_banks_report(Log, Banks) ->
    lists:foreach(
        fun(Bank) ->
            BankName = Bank#bank.name,
            BankLoaned = find_bank_balance(Log, BankName),
            BankOriginal = Bank#bank.funds,
            io:format("- ~s: original ~p, loaned ~p~n", [BankName, BankOriginal, BankLoaned])
        end, Banks).

find_customer_received(Log, CustomerName) ->
    lists:foldl(
        fun(Entry, Total) ->
            case Entry#log_entry.customer_name of
                CustomerName -> Total + Entry#log_entry.granted;
                _ -> Total
            end
        end, 0, Log).

find_bank_balance(Log, BankName) ->
    lists:foldl(
        fun(Entry, Total) ->
            case Entry#log_entry.bank_name of
                BankName -> Total + Entry#log_entry.granted;
                _ -> Total
            end
        end, 0, Log).

sum_objectives(Customers) ->
    lists:sum([Customer#customer.objective || Customer <- Customers]).

sum_received(Log) ->
    lists:sum([Entry#log_entry.granted || Entry <- Log]).

sum_original(Banks) ->
    lists:sum([Bank#bank.funds || Bank <- Banks]).

sum_loaned(Log) ->
    lists:sum([Entry#log_entry.loan_request || Entry <- Log]).

request_loan(Bank, Customer, TransactionLog) ->
    RemainingLoan = Customer#customer.objective - Customer#customer.total_loan,
    LoanAmount = rand:uniform(my_min([50, RemainingLoan, Bank#bank.funds])),
    Customer1 = Customer#customer{total_loan = Customer#customer.total_loan + LoanAmount},
    Bank1 = Bank#bank{funds = Bank#bank.funds - LoanAmount},
    TransactionLog1 = [#log_entry{bank_name = Bank#bank.name, customer_name = Customer#customer.name, loan_request = LoanAmount, granted = LoanAmount} | TransactionLog],
    {Customer1, Bank1, TransactionLog1}.

my_min([]) ->
    0;
my_min([H | T]) ->
    lists:foldl(fun(X, Min) -> case X < Min of true -> X; false -> Min end end, H, T).
