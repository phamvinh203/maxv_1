<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CODABC5">
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
        <![CDATA[<encrypted>qyIAhK2TpheXTJ+z6suuM73Ct2uCDnZUEZU3tc++zHxNtfoT1UoMcO9r1a3KYt9bSs/948at8R5Hs9gnGsf2VUDPzYtF2qkz7n72KJcWzoL/gqMBQu3iXN1MfUShyH0X10evVBxsNfrpUumN623MZr1xEpdmWV7dQhbt+T/f8kSlvt4oDFe0I17LvWFpv8riQyHqGSa7xVSACqmhGLU/Ih0BTRfpMnrwXLBKO7PAapbORhcRaCqnJw5h5UE/EfHKXXxEdPt4y9LkiG5W8OszCC+QoL3LWuyaLyViQmD6spjUTp0vzuyJfnlTOgGczQBkPjHFA7QfeGjfN0fLRGCE+eyQKBHdSh1pXoydDz7xNm8AmSotbHz5r0m/VokK0zQinjK+2dtstYX+TeIhs1zW/eoMLPozf/R9Gp6tweB8+DO2e1HmjHXkVGNMTej9/uOerJleI5TGXvhG6xkeKWpyCl3PwLcykgeKJsdqJhkPI0VKPpWNJgUowm03gcZP51dRSdVZzXXDSZIBJrFn7Asqtuhw/QMVnakVwWbD7NGpB9Hx5+0m789jIC0bSSjQg5p+o0xOn8MrDoQJT0Q0U7h5bIuBkQpAhNYj4AGVc0e4hXr4XsyATV2r7qsnlBsuA7+k2eZNhW9jEP8pNXf0J34TLw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>AliqqqORqh0TsTFJvhUM/6x8r0wfWQUaBzLlOs6hNhWqJHI23RLGkiIY+E68Oyi6Mj/HKFCFjVAJ+pw8W9dayyrzW/7PmVn5Rvaa1C9IRAecK9M2iBetJl16ccXNG1N/PCwRo1IJkhsFSfv3F/xFxfzyDK3zHZQvizOL/TBlIB3XNTbauo4ljLGwFGUyknHIcQuG3t/s/6Mvio6PnIQ5d5Me/K8+P3tNmyl8iqkM7bsLm0RNRWFX4Au8b0GDCkxxBjBh1bVHysfQLEvtA+f/F25O7/1i01AqCX1Wdm4o5QgEt+6q+BbKlvb9uYEFoX7N99uXroYTTLmAzFrcW8tBpeo/JHX7K3s+SA88nodjI/ub8qbJVitxfPEzoPa+GKB1uBs0TeX07ogSPkz40xcSCe1EQTVD4tax6sPsIRzDvaVUb79lSr1rKZFQV1zaT5+VIXaNZJP6wv/dHCMefSWzYbnyrQtbQRtLNSp/vA+zESB8HyzHZAi3GivRFLBJABQYncdg5SfQVD4Lb7zK0BYzFq2oHeK50FYCOPFIZIlTIj3+ioMw7BHppIUu0UQU07LYk4XxZRimnYWmmsqyMh/0sxLL8Ax5zuP8eyrbKgxv2CFHapLIX74d3oqXE1oCT4/BMvBmBI83jb0bq8aUwDRnZABkdF9Se+7d3G8uBb4/u1r1WBP6AhjCKbioc5EoSzo1bVvCjVUZ2jmxKCOOy5IBpKL611bbOdV1dbkOaIiQBU1JUIYPTOlLQXw8fD3fsXXho25zksezO9jwAv4pk5fI8fnOgDYhf8y7Pkt1KXkhULc=</encrypted>]]>
    </text>
  </script>

</dir>