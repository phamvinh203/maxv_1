<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY Identity "PFReceipt">
  <!ENTITY ext "73">
]>
<dir table="m73$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Chọn phiếu nhập" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Phiếu nhập từ ngày" e="Date From"></header>
      <footer v="Ngày nhập từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Phiếu nhập đến ngày" e="Date to"></header>
    </field>
    <field name="loai" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Hóa đơn trong nước, 2 - Nhập khẩu, 3 - Khác" e="1 - Domestic Invoice, 2 - Import, 3 - Other"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_kh" filterSource="master" allowNulls="false" operation="10">
      <header v="Mã nhà cung cấp" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="false">
      <header v="Số phiếu nhập" e="Receipt Number"></header>
      <items style="AutoComplete" controller="PFInvoiceLookup" reference="stt_rec_ct"/>
    </field>
    <field name="stt_rec_ct" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 230"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11100: [loai].Label, [loai], [loai].Description"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011: [so_ct].Label, [so_ct], [stt_rec_ct], [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SN0UN3w1cDWrLJM1eK2lupn3N3nlNR8V8Y64QrcGzW4</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3cvpUDF1guFYHHiMEwyq+T3uKwR84As3T9EhkW2qJoskwPGijJSABRjPkpeJ1AYMjg==</encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Ub/rydLvKFZDMPY1RJY0L8KyO8SSFX+335uEiJnm2Ji</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3cvpUDF1guFYHHiMEwyq+T3uKwR84As3T9EhkW2qJoskwPGijJSABRjPkpeJ1AYMjg==</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7RrLvJfo2uGnts+5rTaC80yAz2ndUAGkMc0o7w7pQsEu</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3cvpUDF1guFYHHiMEwyq+T3uKwR84As3T9EhkW2qJoskwPGijJSABRjPkpeJ1AYMjg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>xOjKwaiKWV//tOG4SJbwTtr9Dx4JBd7q5n1NQkLDOc6iOrz+Q0NyeLPR6xwiGsBocqY7gtgbGzedAdMZI717vuQ5zJ4E2THe3hnVKgx6A80aOnwG2zaq7qywM8Ym76sYoU9ng/F8uFzjiY0G990OVKUalB+WQP2RrFwXKNRyDFNZt5kjowwRn160GlnCElOFXKi+yiv5U0c/qN/jGas/0U1YCh4sx37/8u4664WrMyBgK9+aPE5KsjgPlV/p6xhMqvj+HUIXDO9TZ6wbGVf3zRsqHt084TJNOYWrXzxtIvadsQAbfTrOg8VG7nEhJgPeP4TzQfANdEqie3nZtG36yBcv2wElUVYYYVqISOxt7LzTArPQnYAW3q0JdeDrwrfs1XhtiWDtS7ATNA7u9Hv2WdtJIXtXtKHZAMqTYzbkc8bnLp+Jed1cD8+yTTCOG/PD28WjLI/PbTe1CWgL8aUwIDCcDClLH4iSfc/tm9oH0tGtDVCo8j6ipap1Y13a8+M5ezXw79jzCPCQHeDPOHZz8miPuqR0D8K0nHBDa2H40yrGBNhFVj/vGQh2KEyB/fKvMsKju3jFvxQl0eHL0dLbthZ572tnDCf/1xTgVANQgyTLLUFyvh5msFRA/JZX+hHbinlzgC4wiCidhLHZRwO+wj5gxzoHEbjWpCFW7Xi69HYNfc1lGFKD6tFrRZYeRB9WhWiDY1cnXC2069K75FRem9uOplooKgppJ0pQXLAPwDy/Dtj5UR1SWnqhjcNkMvZ9zJ1tuHxvHNgCE8Tp2YwB2Q==</encrypted>]]>&ext;<![CDATA[<encrypted>xtY8dxqYdSvBw9lKXkF4KW5NDeoy8OWG9P+c/pOjxnUtnPwlmajxgsuVM5TdK3FP7+XqeTHsi+xOf4zlE+98zQziKgxZDc/JyTskkNaRkkZCSJMZlW1p95ExLD2Vst0YGIEgtAqVF3uzh6O7NWcOz3+UbKbLjUwYkZQXZFR08LwEjrbJwaNZzZA1Ja0KFUlzEqwYtmRWbOqHeCCMXeY3xzg27qo35OMGmX6V0S+/w94CyRplCesQAYGLAYZ3ygHOZbdODlPUpFxzSa2GhS5L2xuJh7bbzFAXx4QrGXbecCt1/X1aFXB9kXpYcBtdxzmKGyAATUzKqK7V9+4JY7ACxNRQN2eeQqUDaa1OZfL0MMLk8wiCW/E4Yq0g1pw8R/HWplV8xBceXrkk6LzrHffZiYpVxHgRdlylzeMg0klM7E8XykClKkz3NPMx0WxjTrXuH29FLxE958dF/o/DgiWZVTvitgmnAOGbMmgoDbEEJgalGkJM2fLuHURAJqyPugVwEgBxH71gcyIFXIW9/MNY9BO5SjiV3CpqgBmv+67nffSIsoPAVqOIn4b9Hhbw9STxJsQdlIDIopUFiwXwlM1gMl8IibIbs7zVacRmimM3CjjS3kho0D8agpgsMn+9KjlCeEVrc/YErBplLCJ6MLv4qZGFciq2+eqoV0ZUY5Ym9lbVWTJvvCdxM8bFRarJbt/YZAbz+Aab7t4WsaDmU4x+4kO9N60fnpR5mJh7FNHlLvc=</encrypted>]]>&Identity;<![CDATA[<encrypted>uk5pc35DBFoxG2zFBEO2ZrpyS4+EEu9wn6sg34l1osHCzVWj/mtXKevhSjOiAA1du0xYvkA9EGT66Fb0vnP2U/TM9NydQt9BiWWwvx+Ct4k48xsh3hte3K+rjcbRaK+jWp6OGPUdoNd3CESqL06Wb/z2ypRu9jUBY9fKSjwl6MdMAyQHmAxhYHcDTMv379yCoWOqU1cTEuIFzGc4qWnhVg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxs4Nt7MSIEsnM0ToyBWvgfyczUvLt9+JtABUgeXDkoW</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3UU0H7WdFatSlDVt7FgZAZuYyPDSX5GCF4pqIbXs5btSYTlxAhIsT3zY3afQtXRsRKKqN6pxHuWnLfadSry7ARCtG9QZGCQnzU1Ddj4dvOLb</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3S9woFmylORlfoJYguxfbB2gbRHBZ2yN++lUfSAZOrDJr5u1zYMRc4dn7617b+6lUSzVCVNqlvpnQGT4sGM1s7PWpVmSYsQ5CTNSjoAoWvEJcTzSpuJDvsECU7e0ykZz8w==</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3emAAvRAWXb5axeB4vYqwXnkxzjwVRTW4KFLQMJHMTNsKziX3ZdOsrVK4CerCBQl0Luonc3UnmaLKpffbe5lypo=</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3WyemJVVQNagCBJW9G5iFTVY2rl7uUdnkGiEIxiJFhLeZhxM6ILVFAtDSu9RSRE9krCj9+t8Il4PtdSlTx7pxZAQUZx1ZX+yoXwc+MjRQZiwQUTZWQr8FMLTiWCTeeXqTmhD9Xc88get4al6I0+DCnc=</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3fc0k5a+VuefIW/zPX4oOjZA39fOwtXz5r3o6E/C1CpMDnDpKSqabCGrYkOTTXZLjf/eD7z0aDjTjtc6lN39LQg=</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3WyemJVVQNagCBJW9G5iFTXu6eXxG7XRzLjFHeuv3aFZxnRd/6CaSSRoYQ3d1qWGZoBczHXcI3kYbkaz0I3zq7sD5d9VYRuQ8FKNrEAdhjNY</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3emAAvRAWXb5axeB4vYqwXntraU1CaEYqk9WyjDUds+szRy831prjIz+r8OirpiXduAinWR8o5SBoG+6GytYH78=</encrypted>]]>&Identity;<![CDATA[<encrypted>ap3mIgDc5Ml8kLmqv3HabMCYZrqtILjkku/fnQ5pxAtrcui3zaxeUXeGZLgfj8RuLb7Yx61Vci01TIhD0xvjxck05ztlL1IkPvcaUg7lInhst+A/Qnh6sD48e3T6crCvaScFjcBmadpA4nOb9JRNgp18CxhlWXaEimu42LfK4y7iQnocmZbnKz2iD+RvKlwnKEmEGdIeGl2R6lxAem5bwbs93HTEqNXH2cz7xnkp2u2VKmzDaRl8CuRpU1vJezGUHasz4OD46G50tVDmJmr3VQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>Oh/n4uqYr7K7PWHKGW1sDDxZA9jVF+Y08Xtn9KepddIld3/PaMIgS5FulHKA236jB77igMZImc1uT+ahoxmi6MUZGXtoDBM6yn0CDWLUTAC3VVcEk2XpCh5kXl/dMN2nS1XbtE5uBuly8IrHTs6cvft7Ek90SDaHWmmKr/ymJZtjtBOEsDe0J+mUd+e172Bx82SfOE7GmaMIQ/EqiZC+7TR10ZzUM0fzSHdnFCUDTrGiSw3+I0dh7rD9sWpUDMbi9zlw1gr8a+Y5NMjBEE7piptXSzIz5FlWu9uBN05Vr36VojTQEqr6P1hXKSPbrEdh7NI5KkQajGOAt+SAXhu+GELr1/rQkobONy6lCDN8wb/ihV369z/Jc04n9HPwQc2MHICZWrjAprPDZA58CC/LbBYPEg6s6Do14N7/RhUnQdU3ETvCJw1iAA8D991fV2rt</encrypted>]]>&Identity;<![CDATA[<encrypted>mRI5eCo0w9n6EVwpJRJN+O2GUHeSUtAjkeHGnfk/sF26bpgt2v4cIzZgplZ+tSVCEUzCC/crG7zKLRIOsvcGZanXihgK2pjMSxh1KbMN7naLey12SXFsDFmsbJhD6LSRBXVSPKOmfx8ZYATjiY2Sz5K6VoNsFdTbA2zzfaoH8m5EIl/+jEL2MgrYaUBNiuY5</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3VS5S9Jf++YQL44lJ9QsTOKCRphiCqfff6Hg7J35F266UkI82uEHFhqD0EjYITl+6A==</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3UzK0nu7Ot5xx3D+dKPw9uvadmR1TQJaOhnlQOkjFkq1nh2mcTnBNmqsuhQL3HNcIQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3W7jmjwuxSqeOoCXyGt8HINDTOq4FrO7kI0D0QlnbXQ+LsgI0ZsTHRH9pb6qfGSM3kSfsKZGLWR8Eglw/xMVxvA=</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3fHLh6ySS+DPLHgwlYfAkUcI8Uk7EvVg+qe1xndv0msmXYfwuHFeubl12CwnzZoSIg==</encrypted>]]>&Identity;<![CDATA[<encrypted>nponjFcJJQydMna7XN/adiJnFqeZYb5FKfAD+dMTIBd93OnmxcERdRJMXPQ3kMs9rYCCDwoGy+cHeBHbCLvoQQ==</encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>