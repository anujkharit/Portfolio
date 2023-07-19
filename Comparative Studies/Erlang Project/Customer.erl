-module(customer).
-export([parse_customer_info/1, print_customers_report/2, sum_objectives/1, sum_received/1, sum_loaned/1]).

-record(customer, {name, objective, total_loan}).
-record(log_entry, {bank_name, customer_name, loan_request, granted}).



parse_customer_info(CustomerInfo) ->
    [parse_customer_records(Customer) || Customer <- CustomerInfo].

parse_customer_records({Name, Objective, TotalLoan}) ->
    #customer{name = Name, objective = Objective, total_loan = TotalLoan}.

print_customers_report(Log, Customers) ->
    io:format("Customers Report:~n"),
    io:format("--------------------------------~n"),
    lists:foreach(fun(Customer) -> print_customer_info(Customer, Log) end, Customers).

print_customer_info(Customer, Log) ->
    Received = find_customer_received(Log, Customer#customer.name),
    Loaned = sum_loaned(Log),
    io:format("Customer: ~s~n", [Customer#customer.name]),
    io:format("Objective: ~.2f~n", [Customer#customer.objective]),
    io:format("Total Received: ~.2f~n", [Received]),
    io:format("Total Loaned: ~.2f~n", [Loaned]),
    io:format("Net Balance: ~.2f~n", [Received - Loaned]),
    io:format("--------------------------------~n").

find_customer_received(Log, CustomerName) ->
    lists:sum([Entry#log_entry.granted || Entry <- Log, Entry#log_entry.customer_name == CustomerName]).

sum_objectives(Customers) ->
    lists:sum([Customer#customer.objective || Customer <- Customers]).

sum_received(Log) ->
    lists:sum([Entry#log_entry.granted || Entry <- Log]).

sum_loaned(Log) ->
    lists:sum([Entry#log_entry.loan_request || Entry <- Log, Entry#log_entry.granted]).
