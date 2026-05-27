<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnhcc" code="ma_nh" order="loai_nh" xmlns="urn:schemas-moka-com:data-dir">
  <title v="nhóm công cụ" e="Tool &#38; Supply Group"></title>
  <fields>
    <field name="loai_nh" isPrimaryKey="true" dataFormatString="1, 2, 3" clientDefault="Default" align="right" allowNulls="false">
      <header v="Loại nhóm" e="Group Type"></header>
      <footer v="Loại nhóm: 1, 2 hoặc 3" e="Group Type:1, 2 or 3" />
      <items style="Mask"/>
    </field>
    <field name="ma_nh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã nhóm" e="Group Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nh" allowNulls="false">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="ten_nh2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="1110: [loai_nh].Label, [loai_nh], [loai_nh].Description"/>
      <item value="110: [ma_nh].Label, [ma_nh]"/>
      <item value="1100: [ten_nh].Label, [ten_nh]"/>
      <item value="1100: [ten_nh2].Label, [ten_nh2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>xsmpsO67LYmsKEzPhsNg/l+ijThpuMPqrNvsND9s91i5JoYusvYanhJJGR0D0fGNyullnU1I46/GxHfJ0j3uD5w6S0iKKBGjWDtQmr9V0NxCTSMX+3CUEm3D6VooilMSyRb5gTwuH2Q5HXM1PyDlTUJCuodBdKgb4NkUxCXNQXMYIs/uaZtmdxGuGdXuQe/xpOR7/7M643v8pHxj7r5Eb+JkhfCVR90cMDbu+oqo5BM=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>xsmpsO67LYmsKEzPhsNg/l+ijThpuMPqrNvsND9s91i5JoYusvYanhJJGR0D0fGNyullnU1I46/GxHfJ0j3uD5w6S0iKKBGjWDtQmr9V0NxCTSMX+3CUEm3D6VooilMSsTIa2dCVUl2C1tfN4gfuEBHHYLQu9h2v26vDo9JmGcgYGWhr6u4DGCvUpNkpXKiYO2GSNnTFM5Z08YAXnZxrj/wLIwbeHyWGZRJ9EQqBCXg=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>xsmpsO67LYmsKEzPhsNg/l+ijThpuMPqrNvsND9s91i5JoYusvYanhJJGR0D0fGNyullnU1I46/GxHfJ0j3uD5w6S0iKKBGjWDtQmr9V0NxCTSMX+3CUEm3D6VooilMSlawdyDTdFdcBEdhBOE8GEp44GFo7eebeD6fN6LgdQczj5leNwPbiaCeugvxlRBsjpnLxFW4McnJZkKonL9R0HSC1fIw0O/LIXWeTK8SNcBISxt0pO2hOZhfIfq1fYGAACUwEY3Qpw5aoou5dZVXtqH1IyvdzzX8rRrz5c/QgwIhZE62MYD2iup1vREEUNlCKGpI3+lC1I+rtB3OrlS66SBRqX4T6MYdMKqyvHklSvar3slzGdPi6jDftfJWdXMx19tSkbHzStBdhu0aEgzzgwr17cb4izzH23/+YxnkEQoduWAab49OKFSWSTVh9/AZVdh3Rt10mDHU39prv9hYcD26g+kO+c4MRxdkpYDKYdTdl4CgROP23YpRLjAGxMtoCQNFBoetxsCnhwravlxrq3YEyTN1qG8AXLzT4NtJoPEUeuQi47+1+ofRKhY/t89mhpw7uRePDknQBUBkzmNU0QTV1+2Mj4BcKTyv5Di9OhmgYvzLK+ZmmTHcO3x7LObWIwBrpsMvykNgBQvUWe95eEQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>xsmpsO67LYmsKEzPhsNg/l+ijThpuMPqrNvsND9s91i5JoYusvYanhJJGR0D0fGNyullnU1I46/GxHfJ0j3uD5w6S0iKKBGjWDtQmr9V0NxCTSMX+3CUEm3D6VooilMSyRb5gTwuH2Q5HXM1PyDlTXsbDQrAqVR0uFGDeDtnXA/5Skg8+OM4L3tHboo8KbP5v8pIUPCQFabShKRpZ/9rTaHIlmFsIZ49S9Kj/Ua67zYJCL4hkZDVqIYRmA8kWouuwv9lt/43jCOC2kN+D+hUvl+vqac+f7vYb4SZet/pt3Q1x+8DITqL8IJWsygS+a63kJmaBDyLk/v3xCjbSfm9KXEtNIa6cxcxEN/+agISSX1RlKQZ8lTjMUqrdLvw4i1ggccFuSPPZ1VADZFleAIsakVQ3pe6qd/xlnlugR5JU5Yk5HBJS5pVJbkFKNd5qAVMl8hGtHwgIBxnEUJcIFqXCg==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>xsmpsO67LYmsKEzPhsNg/l+ijThpuMPqrNvsND9s91i5JoYusvYanhJJGR0D0fGNyullnU1I46/GxHfJ0j3uD5w6S0iKKBGjWDtQmr9V0NxCTSMX+3CUEm3D6VooilMSyRb5gTwuH2Q5HXM1PyDlTY33Rm6N6dhSquW4XD9jvgdFR21DmWYv/fjm+IlQaWEd4C7Hh2CP3+zplYLCSVTvkMUA3tMJIeFjKzxpK5thtHwP+EiWtDp1i0vqH01V6QBKsQRanOucsW31FRsMhTqpo5o+IZ+aMc8ODs9755Vk2znOnWAcVLBdRL6yb7jkf2OiXgu3BN/1z9MsSBBN4DK/85dnLM79fQgAX4RXaoLiPaIGmacpAIsDA1hm8/msp3sB7hXvTO2iHBJIr6jyIHrKOoRHTAybFbq2B8C534RIFqYCVjBVDgEEMJHPpqrxDJHWNupVMLweeDVH1ck0G4KGdnOuJ3eNDFPfkAYQf5nDkKldkz+4UmUFI+L6hZqjfrHGiYFQpXZuyo0y3MuEGDwqtQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>xsmpsO67LYmsKEzPhsNg/l+ijThpuMPqrNvsND9s91i5JoYusvYanhJJGR0D0fGNyullnU1I46/GxHfJ0j3uD5w6S0iKKBGjWDtQmr9V0NxCTSMX+3CUEm3D6VooilMSlawdyDTdFdcBEdhBOE8GErbtB1GkWlpAMWjaYvHCd3kApIixc37HmSlfacsQ7AFlOJMnU06+s9XlN0JmlCDan2GegpLJ2JM0oM+282uBSRQ1YHkCyf+/RUIMwmc2eYp6</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>xsmpsO67LYmsKEzPhsNg/l+ijThpuMPqrNvsND9s91i5JoYusvYanhJJGR0D0fGNyullnU1I46/GxHfJ0j3uD5w6S0iKKBGjWDtQmr9V0NxCTSMX+3CUEm3D6VooilMSrZXvcKzfKXLFOhh6Bf+QbKnydfod+Tiy/eBjffh2b8fKebazvfa1ddOBw8TJhR9RiUXaSB30pmgIXfld8rtCZnqOnwhARx1UxtWjvfzhNdDTkHmMc2cTmpo1tHvDNLuwJo4ZtYckZhiInZ1a3NB/EQmmk2XP681S9A8OJr5FZhQIzfXsTDVlC+9/QuKSNG+Ub04dFnbQdMfQ9ciVOQRMRmtZFeJ9DHwiHV2/NzaIjfP6o1k8LqyivWJNydybbPWcPcZVy+WqkJ9OOU1IRzml4XjpoMY5U7wYvxadRhRyN2NVMX7AdTZYPkAMa+ZFu44ZjFOOTrRSG0wx3uSwNZC+coBxDq1/PhsyyefFhtpSJ4eWJxqrS4jaF2kE75Vbf2wP</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>