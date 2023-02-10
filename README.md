# Cohort-Retention
Cohort Analysis | Customers Retention

Hello! My name is Nhien Le, and this is a SQL practice project in my portfolio using a financial transactions dataset with the topic of cohort analysis of customer retention.

### Context
'Telco Card' is the most product in the Telco group (accounting for more than 99% of the total),
and the company wants to evaluate the quality of user acquisition in 2019 by the retention metric.
Therefore, I would use SQL to retrieve appropriate data table for this cohort analysis.

---
### Dataset Description
**Paytm** is an Indian multinational financial technology company. It specializes in digital payment system, e-commerce and financial services. Paytm wallet is a secure and RBI (Reserve Bank of India)- approved digital/mobile wallet that provides a myriad of financial features to fulfill every consumer’s payment needs. Paytm wallet can be topped up through UPI (Unified Payments Interface), internet banking, or credit/debit cards. Users can also transfer money from a Paytm wallet to recipient’s bank account or their own Paytm wallet.

Below is a small database of payment transactions from 2019 to 2020 of Paytm Wallet. The database
includes 6 tables:
- fact_transaction: Store information of all types of transactions: Payments, Top-up, Transfers, Withdrawals
- dim_scenario: Detailed description of transaction types
- dim_payment_channel: Detailed description of payment methods
- dim_platform: Detailed description of payment devices
- dim_status: Detailed description of the results of the transaction

---
### Result
<img src="image/Cohort retention table.png" alt="Cohort retention table" width="600"/>

<img src="image/Retention chart.png" alt="Retention chart" width="300"/>
