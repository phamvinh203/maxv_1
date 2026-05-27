<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLNKC3">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Xem chi tiết" e="Xem chi tiết"></title>
  <fields>
    <field name="query">
      <header v="" e=""></header>
      <footer v="Đang thực hiện..." e="Working..."></footer>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 300, 130, 0"/>
      <item value="1001: [query].Description, [query]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>PCjuNla6+shMjC4tqDOQ8LDlm4isXsK1xsybsyHhzbFfNaLVPk027IyJL9SVNZPiNGdnlK1J5HUrjxF7uQNJ34RNesEDq2AVnVJvg76DptKrCsuz9ZL04KpH2oxoxknjd4G8KIiUIjPQOS5tBUioKt2SCcT1koP+91cj4XYi/w8za+UJe9vJz64qrpC3lwe5kneMODlFIYGy8Tg8TxrgVOvxXkPFLMVT6OT0SRXiJZO3Z1y0y4q9of/0qjifFpQvfqRbm92uBRf2cS+PQFMMrNG+1wssRyxdhxvZfhjoO3Ka2vIcuhxBpKwG7YiFIcB4JF5fpr+LO7a6i2tkjU9OTwSn0OSX4sM/APjsrDre1U2hDtw/sdNhY7bbwqcODDjRGvWa21gP9BJFsEy1DNkfDucAU+PLWw40ZLZYeeq5Zd33y4XulWzBfjIFjttDDgoELwn5C6CT+xEzwS1rB4hxUmVyDnr6PNudfFFYnRsnGRiiRWoRayYNHiwU7Tc0fBzDNGPtsNcUvPpmDmMm1Nb/zO0KF+OVG97WHByncXxIMYd9qEsWDtlNi8cPeYjMxSDKlHX4n5mf7tcD0R0EmTqF+IOpPeDaK8F5J+dFQOH6nZkSauRaXDdEkQcCUu6lrWnBreo2gt6iC94zX/BJ6vfjYjpZ3dBgXCGLKGooZJCEJOuJC9sm6dn9Qg6NvB/+P9BfzDYSonbyzR8IqXh6r53nl2VX8XxvNQaG1W5HzchEsUAakNZuEhWIkV6bqWRzpA146xSotz7ngYGevbrZQJSDXg==</encrypted>]]>&Form;<![CDATA[<encrypted>KqEHVmj1CEym/uC+q9cPtXhDDAoFoHBWSR+GA+sP+yitcq7fU1giDbh3QA4edRB/+AJ/gbuHaIUALpUc529JC2/PwXFOiLfmv0jAc9LndIAKjBxL1tLCHF0tYhatMOCHdI1uRDZn1HH/ax+/IWk/dJpRkGU87OKXz+DY7pHOfvJ5Dv2lL72Sy8RmLISG62sMPCk0r7lZFDBbcbyyaSs+TXPPhCyKrLasvH9QQq+Fkl65VwR5NxrkqPe9DLW8SplpJkSAYVtauECAaqNOcbliRSSq1SDhr75JUqhzef0AEVzRLRu+itcP/s1bdt4PBBRq</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>1gp16Y/BjG5yC7nqTAl0aIhYyszB0go2jcwjueoS+W+T/trpNPBYybdOsfqvWxvycYIPBBKy9VglTkibJm1McaDlJ4EptEP4RZ2DNAz4XSEAThGTJqsLsEo8jOkrWPipg01QFTzEnpeORtJ4nq7HPhE1oTszgxKo5mKt9owbJF1OjhYHxLzdUS68YAlJ2CnxPVTAYoTKjXJ+MczyDy4DCen0I3HI0SiVcDwIakNSjBnBvqVfUUGaFbSOu+i0tKyDKkOWMgfj1uO7Dd+7e9nmmW18VajodFQGzoH5z/6F05hdrV8D8UEl7t9q4AH19xI4CFg6qpLXbmXMIgsQpIrpgVP91GWDBa7vaIH2jh7cMw3pyLoTMsa+GLNH8QU6XWp+CiF85RPcWZeOZPB1tBegSWafCZoVaiwUbI7+dYqSAV1PLJC/XynLjf6Cuq57XmEMuu8g6eL2YgAeXPf6f3oHr74U9wlqcEPYB++KQ/puh+laFRx4p3CPKZTaqQUk31YD2lbghKlYXd6s1ZcnXRfFxTKWc0u5Km9lkpIa878UYE/3ufqUrnH1dQCwFrpGMWFzGEBIRQ1BsS/ZUbFXuUfJqArOH1atwZmTjobRwETzLzFj+0Ebo0up6qrvIRK6YF3N7x192zwovR4ZT1X2bgEy/1UGnXCJx/f/FW388ZgfQRXlb2pXBDUKLFetQPR8q2AAr8glGgJnwUBx6MtTxaMCLQqgxmyvRnuRFTn1Cm+oVb5xIRX11aiGm9xRFd3hRLiQwiH6cgO+QoEagIc6ld+Y6aEqJeL+LnJ6At4wEbLcaEGcd++nXhikSrRot+8gFxhL</encrypted>]]>
    </text>
  </script>

</dir>