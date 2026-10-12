# Functional Requirements Document (FRD)

## Purpose

Translates each business requirement (BR-01 to BR-07) into concrete, testable system behavior.

## Functional Requirements

| ID | Requirement | Related BR |
| --- | --- | --- |
| FR-01 | The system shall provide a web form where a customer enters an Order ID and submits a return request without agent involvement. | BR-01 |
| FR-02 | The system shall require the customer to select a return reason from a predefined dropdown before the request can be submitted. | BR-02 |
| FR-03 | The system shall reject a return submission with no reason selected, showing an inline validation message. | BR-02 |
| FR-04 | The system shall validate that the entered Order ID exists in the Orders table before accepting the request. | BR-02 |
| FR-05 | The system shall auto-generate a unique refund reference number (format `RF-<OrderID>-<sequence>`) on successful submission. | BR-03 |
| FR-06 | The system shall display the refund reference to the customer and include it in a confirmation email. | BR-03 |
| FR-07 | The system shall aggregate return records by Product Category, Region, and Reason and expose them to the reporting layer. | BR-04 |
| FR-08 | The system shall calculate return rate as (Returned Orders / Total Orders) per category, region, and reason, refreshed at least daily. | BR-04 |
| FR-09 | The system shall timestamp every return record with the request date and retain records indefinitely. | BR-05 |
| FR-10 | The system shall notify the Warehouse queue with Order ID, Product, and Reason as soon as a return is logged. | BR-06 |
| FR-11 | The system shall move a return through defined status stages (Submitted, Inspected, Refunded) without re-entry of Order ID or reason at each stage. | BR-07 |

## Return Reason Codes (proposed)

The raw dataset has no reason field today, so this is a new data element. Proposed starting set for the dropdown in FR-02:

- Wrong item shipped
- Item damaged or defective
- Not as described
- No longer needed
- Found a better price
- Arrived too late
- Other

## Notes

- FR IDs map to BR IDs one-to-one or many-to-one; the RTM in [06_RTM_RAID_UAT.md](06_RTM_RAID_UAT.md) rolls this up further.
- FR-10 assumes a Warehouse notification queue exists or is added as a light integration, pending the scope confirmation noted in the BRD.
