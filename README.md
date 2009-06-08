# Currency select

Provides a simple helper to get an HTML select list of currencies.

The value of the selected item is the ISO 4217 currency code for the selected currency.

This plugin is modified from the 'country and region select'  plugin on GitHub. (http://github.com/ihower/country_and_region_select/tree/master).

## Example

<%= currency_select :model, :currency, ["British Pound", "US Dollar"] %>

(In the above example, 'British Pound' and 'US Dollar' are priority currencies, meaning they appear at the top of the list of currencies.)