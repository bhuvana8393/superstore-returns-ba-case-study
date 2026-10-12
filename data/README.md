# Data

This project uses the **Superstore Sales** sample workbook with three sheets:

| Sheet | Rows | Contents |
| --- | --- | --- |
| Orders | 8,399 | Order line items: dates, sales, profit, region, product category and sub-category |
| Returns | 572 | Order ID and Status ("Returned") only |
| Users | 8 | Region and manager |

The workbook is not included in this repository. Download the sample from its original source and place it in this folder as `Sample - Superstore Sales (Excel).xlsx`.

## Data notes

- One order can contain several line items, so return rate is calculated per unique Order ID.
- An order can include products from more than one category or region, so category order counts add up to more than the total number of orders.
- Every Order ID in Returns exists in Orders.
- The Returns sheet has no reason, return date, or refund amount. That absence is the main gap this project addresses.
- The Users sheet contains duplicate region rows (a second manager listed for each region), which this analysis does not use.
