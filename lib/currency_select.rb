# CurrencySelect
module ActionView
  module Helpers
    module FormOptionsHelper
      # Return select and option tags for the given object and method, using
      # currency_options_for_select to generate the list of option tags.
      def currency_select(object, method, priority_currency = nil, options = {}, html_options = {})
        InstanceTag.new(object, method, self, options.delete(:object)).to_currency_select_tag(priority_currency, options, html_options)
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

        if priority_currency
          currency_options += options_for_select(priority_currencies, selected)
          currency_options += "<option value=\"\" disabled=\"disabled\">Please select...</option>\n"
        end

        return currency_options + options_for_select(CURRENCIES, selected)
      end
      # All the currencies included in the currency_options output.
      # CURRENCIES = ["Afghanistan","Åland Islands","Albania","Algeria","American Samoa","Andorra","Angola",
      #         "Anguilla","Antarctica","Antigua and Barbuda","Argentina","Armenia","Aruba","Australia","Austria",
      #         "Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin",
      #         "Bermuda","Bhutan","Bolivia","Bosnia and Herzegovina","Botswana","Bouvet Island","Brazil",
      #         "British Indian Ocean Territory","Brunei Darussalam","Bulgaria","Burkina Faso","Burundi","Cambodia",
      #         "Cameroon","Canada","Cape Verde","Cayman Islands","Central African Republic","Chad","Chile","China",
      #         "Christmas Island","Cocos (Keeling) Islands","Colombia","Comoros","Congo",
      #         "Congo, The Democratic Republic of the","Cook Islands","Costa Rica","Côte d'Ivoire","Croatia","Cuba",
      #         "Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt",
      #         "El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Falkland Islands (Malvinas)",
      #         "Faroe Islands","Fiji","Finland","France","French Guiana","French Polynesia",
      #         "French Southern Territories","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guadeloupe","Guam","Guatemala","Guernsey","Guinea",
      #         "Guinea-Bissau","Guyana","Haiti","Heard Island and McDonald Islands","Holy See (Vatican City State)",
      #         "Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran, Islamic Republic of","Iraq",
      #         "Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya",
      #         "Kiribati","Korea, Democratic People's Republic of","Korea, Republic of","Kuwait","Kyrgyzstan",
      #         "Lao People's Democratic Republic","Latvia","Lebanon","Lesotho","Liberia","Libyan Arab Jamahiriya",
      #         "Liechtenstein","Lithuania","Luxembourg","Macao","Macedonia, Republic of",
      #         "Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Martinique",
      #         "Mauritania","Mauritius","Mayotte","Mexico","Micronesia, Federated States of","Moldova",
      #         "Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Myanmar","Namibia","Nauru",
      #         "Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger",
      #         "Nigeria","Niue","Norfolk Island","Northern Mariana Islands","Norway","Oman","Pakistan","Palau",
      #         "Palestinian Territory, Occupied","Panama","Papua New Guinea","Paraguay","Peru","Philippines",
      #         "Pitcairn","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russian Federation",
      #         "Rwanda","Saint Barthélemy","Saint Helena","Saint Kitts and Nevis","Saint Lucia",
      #         "Saint Martin (French part)","Saint Pierre and Miquelon","Saint Vincent and the Grenadines","Samoa","San Marino",
      #         "Sao Tome and Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore",
      #         "Slovakia","Slovenia","Solomon Islands","Somalia","South Africa",
      #         "South Georgia and the South Sandwich Islands","Spain","Sri Lanka","Sudan","Suriname",
      #         "Svalbard and Jan Mayen","Swaziland","Sweden","Switzerland","Syrian Arab Republic",
      #         "Taiwan","Tajikistan","Tanzania, United Republic of","Thailand","Timor-Leste",
      #         "Togo","Tokelau","Tonga","Trinidad and Tobago","Tunisia","Turkey","Turkmenistan",
      #         "Turks and Caicos Islands","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom",
      #         "United States","United States Minor Outlying Islands","Uruguay","Uzbekistan","Vanuatu","Venezuela",
      #         "Viet Nam","Virgin Islands, British","Virgin Islands, U.S.","Wallis and Futuna","Western Sahara",
      #         "Yemen","Zambia","Zimbabwe"] unless const_defined?("CURRENCIES")
      
      CURRENCIES = [] unless const_defined?("CURRENCIES")
    end
    
    class InstanceTag
      def to_currency_select_tag(priority_currencie, options, html_options)
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
      def currency_select(method, priority_currency = nil, options = {}, html_options = {})
        @template.currency_select(@object_name, method, priority_currencies, options.merge(:object => @object), html_options)
      end
    end
  end
end