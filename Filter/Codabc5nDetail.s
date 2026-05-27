<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CODABC5N">
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
        <![CDATA[<encrypted>vGy2IM8VsdXUrl2paztByKdWLmsNUAyO7AwdySg+WaXn3klPEljQvnbKW8klYlc2+WY9c3yXlsO2oRnMg2V7rum25JAC5GYgk/y6bG8yOUmWQqCLXthKMZm2YHtSs+tEDqcYhAQbbcJhUNpJ7n1hIOxG/v4FcEW4OX5lke995Vg+7TJc8wg43WYfaF+EyvRc7QpPj3lrF/dF1BAlojtAHCYXtKbqCnFstTQorXPuKwrD/1j2ubbDaFKlqgCg+4cF/y0tuWprr3iw9BOoc8bIvtdqGUDtcXtdeKugi8KMDvwyeZ/43QerC1vvBl3zImAMr7waOz8k42zu5aB/wIFl1m8H4RZtl4A/5Rssc7ANTBQVCASuIxJNxu+SD5vriQAj/YUwpVstB6BDOlrKBGzw9ZtcfuZmWR+DNI39/58gd7JcIagQxGJRtmpo8PKhchnEZsmDibgw+bIIW7CXRUG2TYiaDLMVYZv/qK+hQ7V84R9e9t2zIkFZizaPj4jIX17klCNBCiTEsrX8LaSYxNwY2+N5JZHqkc75j0oWaqNbsUdbWFj051p/XfFzyMVBrRaJ28QgKiYOcBxBnPxcklWWJhciA6XHxENRrjs5mcoQrP9bkTqc4yZpHBPUXJBcmPJl/7swtzK4x6BTMH/D48bnYQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>AliqqqORqh0TsTFJvhUM/yK0PiRyiUZrcC0n2Qt+XuRZgoh161vgiu82nlnu481Land/48PeMCYihc2MPMHjMfJMIopYQl3lO3eyuiVIPrCFWnHoFMDu/YFgLj0eZiZY1jQcKP9oIq9ybG/GFMzgko3ycZ+0/Gpa1gUyGrMRos2ZY8yiF1SgiQZSJDd1aS2WReWIKN7EN9sOuaCyCW8BOq+ZS19obufoJjhok8dCq6ZUTVT5lVuU4GyaU3dJLgCG50ucqLK9X/wZGAAMW3dJKhY3nqjyINahvxq0ZxtJRr2nu4PNlCw/CPKVaZJXFEp2D7DaLSfapb/RWnUSe0A9TBmL8OCEEGa0ZVyytlpAlshntJe3mGNW+k2TZu3THKJJNvwbbnRyD6WBeeSL5KqbEMA+PsFDc6tNldSvKpocMFI5f7DTQP26Iuf81plJq8r0L92qdvGpKg7jPrnmqJZgiR+zn/5Jfjrw+ZpP53edzelQMrAmr1kp9bVrLyp4I5CSassp2Y0IU0uimjMCXnHQ+lvPZS26O+Qc1fjqU8Aj7pwa0P8HY8WhrlluvXKsp6pYdVxyl+Q9tWl1WNleWML/rDCt6fu5X/t+fvO7wFeAyvRG8BrlzhZYqcAy/Si6Ix+vgurcYF8b58ftgNHBn7EBNs0WridrYWCKE2GSoKAUz0D0xFjCc2fuzBMnBy1PjhiuCKdKcdb99VV2OXIRN+iNUeJ6GVDUYg55/R8or1OP6TSKqunbK18DzrFYCRDHXQ6LBndjfXWXhYeTPFVVsEuGWvNA7CfN+264s+xAuorsTD8=</encrypted>]]>
    </text>
  </script>

</dir>