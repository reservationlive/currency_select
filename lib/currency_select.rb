# CurrencySelect
module ActionView
  module Helpers
    module FormOptionsHelper
      # Return select and option tags for the given object and method, using
      # currency_options_for_select to generate the list of option tags.
      def currency_select(object, method, priority_currencies = nil, options = {}, html_options = {})
        InstanceTag.new(object, method, self, options.delete(:object)).to_currency_select_tag(priority_currencies, options, html_options)
      end
      
      # Returns a string of option tags. Supply a currency name as +selected+ 
      # to have it marked as the selected option tag. You can also supply an
      # array of currencies as +priority_currencies+, so that they will be
      # listed above the rest of the (long) list.
      #
      # NOTE: Only the option tags are returned, you have to wrap this call
      # in a regular HTML select tag.
      
      def currency_options_for_select(selected = nil, priority_currencies = nil)
        currency_options = ""

        if priority_currencies
          currency_options += options_for_select(priority_currencies, selected)
          currency_options += "<option value=\"\" disabled=\"disabled\">Please select...</option>\n"
        end

        return currency_options + options_for_select(CURRENCIES, selected)
      end
      # All the currencies included in the currency_options output.
      CURRENCIES = {
        "AUD" => "Australian Dollar",
        "NZD" => "New Zealand Dollar",
        "USD" => "US Dollar",
        "EUR" => "Euro",
        "GBP" => "British Pound",
        "JPY" => "Japanese Yen",
        "AFA" => "Afghanistan Afghani",
        "ALL" => "Albanian Lek",
        "DZD" => "Algerian Dinar",
        "ADF" => "Andorran Franc",
        "ADP" => "Andorran Peseta",
        "AON" => "Angolan New Kwanza",
        "ARS" => "Argentine Peso",
        "AWG" => "Aruban Florin",
        "ATS" => "Austrian Schilling",
        "BSD" => "Bahamanian Dollar",
        "BHD" => "Bahraini Dinar",
        "BDT" => "Bangladeshi Taka",
        "BBD" => "Barbados Dollar",
        "BEF" => "Belgian Franc",
        "BZD" => "Belize Dollar",
        "BMD" => "Bermudian Dollar",
        "BTN" => "Bhutan Ngultrum",
        "BOB" => "Bolivian Boliviano",
        "BWP" => "Botswana Pula",
        "BRL" => "Brazilian Real",
        "BND" => "Brunei Dollar",
        "BGL" => "Bulgarian Lev",
        "BIF" => "Burundi Franc",
        "XOF" => "CFA Franc BCEAO",
        "XAF" => "CFA Franc BEAC",
        "KHR" => "Cambodian Riel",
        "CAD" => "Canadian Dollar",
        "CVE" => "Cape Verde Escudo",
        "KYD" => "Cayman Islands Dollar",
        "CFP" => "Central Pacific Franc",
        "CLP" => "Chilean Peso",
        "CNY" => "Chinese Yuan Renminbi",
        "COP" => "Colombian Peso",
        "KMF" => "Comoros Franc",
        "CRC" => "Costa Rican Colon",
        "HRK" => "Croatian Kuna",
        "CUP" => "Cuban Peso",
        "CYP" => "Cyprus Pound",
        "CSK" => "Czech Koruna",
        "DKK" => "Danish Krone",
        "DJF" => "Djibouti Franc",
        "DOP" => "Dominican R. Peso",
        "NLG" => "Dutch Guilder",
        "XEU" => "ECU",
        "XCD" => "East Caribbean Dollar",
        "ECS" => "Ecuador Sucre",
        "EGP" => "Egyptian Pound",
        "SVC" => "El Salvador Colon",
        "EEK" => "Estonian Kroon",
        "ETB" => "Ethiopian Birr",
        "FKP" => "Falkland Islands Pound",
        "FJD" => "Fiji Dollar",
        "FIM" => "Finnish Markka",
        "FRF" => "French Franc",
        "GMD" => "Gambian Dalasi",
        "DEM" => "German Mark",
        "GHC" => "Ghanaian Cedi",
        "GIP" => "Gibraltar Pound",
        "GRD" => "Greek Drachma",
        "GTQ" => "Guatemalan Quetzal",
        "GNF" => "Guinea Franc",
        "GYD" => "Guyanese Dollar",
        "HTG" => "Haitian Gourde",
        "HNL" => "Honduran Lempira",
        "HKD" => "Hong Kong Dollar",
        "HUF" => "Hungarian Forint",
        "ISK" => "Iceland Krona",
        "INR" => "Indian Rupee",
        "IDR" => "Indonesian Rupiah",
        "IRR" => "Iranian Rial",
        "IQD" => "Iraqi Dinar",
        "IEP" => "Irish Punt",
        "ILS" => "Israeli New Shekel",
        "ITL" => "Italian Lira",
        "JMD" => "Jamaican Dollar",
        "JOD" => "Jordanian Dinar",
        "KZT" => "Kazakhstan Tenge",
        "KES" => "Kenyan Shilling",
        "KWD" => "Kuwaiti Dinar",
        "LAK" => "Lao Kip",
        "LVL" => "Latvian Lats",
        "LBP" => "Lebanese Pound",
        "LSL" => "Lesotho Loti",
        "LRD" => "Liberian Dollar",
        "LYD" => "Libyan Dinar",
        "LTL" => "Lithuanian Litas",
        "LUF" => "Luxembourg Franc",
        "MOP" => "Macau Pataca",
        "MGF" => "Malagasy Franc",
        "MWK" => "Malawi Kwacha",
        "MYR" => "Malaysian Ringgit",
        "MVR" => "Maldive Rufiyaa",
        "MTL" => "Maltese Lira",
        "MRO" => "Mauritanian Ouguiya",
        "MUR" => "Mauritius Rupee",
        "MXP" => "Mexican Peso",
        "MNT" => "Mongolian Tugrik",
        "MAD" => "Moroccan Dirham",
        "MZM" => "Mozambique Metical",
        "MMK" => "Myanmar Kyat",
        "ANG" => "NL Antillian Guilder",
        "NAD" => "Namibia Dollar",
        "NPR" => "Nepalese Rupee",
        "NIO" => "Nicaraguan Cordoba Oro",
        "NGN" => "Nigerian Naira",
        "KPW" => "North Korean Won",
        "NOK" => "Norwegian Kroner",
        "OMR" => "Omani Rial",
        "PKR" => "Pakistan Rupee",
        "PAB" => "Panamanian Balboa",
        "PGK" => "Papua New Guinea Kina",
        "PYG" => "Paraguay Guarani",
        "PEN" => "Peruvian Nuevo Sol",
        "PHP" => "Philippine Peso",
        "PLZ" => "Polish Zloty",
        "PTE" => "Portuguese Escudo",
        "QAR" => "Qatari Rial",
        "ROL" => "Romanian Leu",
        "RUB" => "Russian Rouble",
        "WST" => "Samoan Tala",
        "STD" => "Sao Tome/Principe Dobra",
        "SAR" => "Saudi Riyal",
        "SCR" => "Seychelles Rupee",
        "SLL" => "Sierra Leone Leone",
        "SGD" => "Singapore Dollar",
        "SKK" => "Slovak Koruna",
        "SIT" => "Slovenian Tolar",
        "SBD" => "Solomon Islands Dollar",
        "SOS" => "Somali Shilling",
        "ZAR" => "South African Rand",
        "KRW" => "South-Korean Won",
        "ESP" => "Spanish Peseta",
        "LKR" => "Sri Lanka Rupee",
        "SHP" => "St. Helena Pound",
        "SDD" => "Sudanese Dinar",
        "SDP" => "Sudanese Pound",
        "SRG" => "Suriname Guilder",
        "SZL" => "Swaziland Lilangeni",
        "SEK" => "Swedish Krona",
        "CHF" => "Swiss Franc",
        "SYP" => "Syrian Pound",
        "TWD" => "Taiwan Dollar",
        "TZS" => "Tanzanian Shilling",
        "THB" => "Thai Baht",
        "TOP" => "Tonga Pa'anga",
        "TTD" => "Trinidad/Tobago Dollar",
        "TND" => "Tunisian Dinar",
        "TRL" => "Turkish Lira",
        "UGS" => "Uganda Shilling",
        "UAH" => "Ukraine Hryvnia",
        "UYP" => "Uruguayan Peso",
        "AED" => "Utd. Arab Emir. Dirham",
        "VUV" => "Vanuatu Vatu",
        "VEB" => "Venezuelan Bolivar",
        "VND" => "Vietnamese Dong",
        "YUN" => "Yugoslav Dinar",
        "ZMK" => "Zambian Kwacha",
        "ZWD" => "Zimbabwe Dollar"
      } unless const_defined?("CURRENCIES")
    end
    
    class InstanceTag
      def to_currency_select_tag(priority_currencies, options, html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        value = value(object)
        content_tag("select",
          add_options(
            currency_options_for_select(value, priority_currencies),
            options, value
          ), html_options
        )
      end
    end
    
    class FormBuilder
      def currency_select(method, priority_currencies = nil, options = {}, html_options = {})
        @template.currency_select(@object_name, method, priority_currencies, options.merge(:object => @object), html_options)
      end
    end
  end
end