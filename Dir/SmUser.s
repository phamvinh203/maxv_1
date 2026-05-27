<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir table="userinfo2" code="name" order="name" database="Sys" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="thông tin người sử dụng" e="User's Information"></title>
  <fields>
    <field name="name" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Người sử dụng" e="User"></header>
      <items style="Mask"></items>
    </field>
    <field name="comment" allowNulls="false">
      <header v="Tên người sử dụng" e="User Name"></header>
    </field>
    <field name="cpass" allowNulls="false" external="true" defaultValue="''">
      <header v="Xác nhận mật khẩu" e="Confirm Password"></header>
      <clientScript><![CDATA[<encrypted>no+EqBbLHNT1fYFKOGioHcM/ZX594B4wl1LvgU96Aggth1HTLZToygou0idbZGB1F5Xk3ZBXJm+Ia3mUne7yxw==</encrypted>]]></clientScript>
    </field>
    <field name="view_pass" allowNulls="false" external="true" defaultValue="'*******' + char(255)" categoryIndex="1">
      <header v="Mật khẩu" e="Password"></header>
      <clientScript><![CDATA[<encrypted>no+EqBbLHNT1fYFKOGioHcM/ZX594B4wl1LvgU96Aggth1HTLZToygou0idbZGB1F5Xk3ZBXJm+Ia3mUne7yxw==</encrypted>]]></clientScript>
    </field>
    <field name="view_pass2" allowNulls="false" external="true" defaultValue="'*******' + char(255)" categoryIndex="1">
      <header v="Nhắc lại mật khẩu" e="Retype Password"></header>
      <clientScript><![CDATA[<encrypted>no+EqBbLHNT1fYFKOGioHcM/ZX594B4wl1LvgU96Aggth1HTLZToygou0idbZGB1F5Xk3ZBXJm+Ia3mUne7yxw==</encrypted>]]></clientScript>
    </field>

    <field name="pwd_type" type="Byte" clientDefault="Default" categoryIndex="1">
      <header v="Ràng buộc" e="Password Level"></header>
      <items style="DropDownList">
        <item value="2">
          <text v="Tối thiểu 6 ký tự" e="At Least 6 Characters"/>
        </item>
        <item value="3">
          <text v="Bao gồm số và chữ" e="Consisting of Numbers and Letters"/>
        </item>
        <item value="4">
          <text v="Có tối thiểu một chữ hoa" e="At Least 1 Upper-case Letter"/>
        </item>
        <item value="5">
          <text v="Có ký tự khác ngoài số và chữ" e="Consisting of Other Characters Except Numbers and Letters"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="pwd_daychange" type="Decimal" dataFormatString="#00" clientDefault="Default" categoryIndex="1">
      <header v="Số ngày đổi mật khẩu" e="Password Expire Days"></header>
      <items style="Numeric"/>
    </field>
    <field name="pwd_nextlogin_yn" type="Boolean" align="left" clientDefault="Default" categoryIndex="1">
      <header v="Phải đổi mật khẩu lần tới" e="Required to Change Password Next Time"></header>
    </field>
    <field name="pwd_useold_yn" type="Boolean" align="left" clientDefault="Default" categoryIndex="1">
      <header v="Cho phép trùng mật khẩu cũ" e="Allow Reusing Old Password"></header>
    </field>

    <field name="restrict_yn" type="Boolean" align="left" defaultValue="0" categoryIndex="1">
      <header v="Được phép phân quyền cho cấp dưới" e="Enable to Assign Right for Junior Users"></header>
    </field>
    <field name="restrict_users" categoryIndex="1">
      <header v="Nhân viên cấp dưới" e="List of Junior User"></header>
      <items style="Lookup" controller="UserGroup" reference="ten%l" key="admin &lt;&gt; 1 and user_yn &lt;&gt; 0 and name &lt;&gt; '{$%c[name]}' and dbo.ff_ExactInlist((case when '{$%c[name]}' = '' then '''' else '{$%c[name]}' end),restrict_users) &lt;&gt; 1 and status = '1'" check="admin &lt;&gt; 1 and user_yn &lt;&gt; 0 and dbo.ff_ExactInlist('{$%c[name]}',restrict_users) &lt;&gt; 1" information="name$userinfo.comment%l"/>
    </field>
    <field name="ten%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="dien_thoai" categoryIndex="9">
      <header v="Điện thoại di động" e="Mobile Phone Number"></header>
    </field>
    <field name="e_mail" categoryIndex="9">
      <header v="Thư &lt;span class=&quot;LabelDescription&quot;&gt;(Email)" e="Email Address"></header>
    </field>
    <field name="d_language" categoryIndex="9">
      <header v="Ngôn ngữ ngầm định" e="Default Language"></header>
      <items style="DropDownList">
        <item value="v">
          <text v="Tiếng Việt" e="Vietnamese"/>
        </item>
        <item value="e">
          <text v="Tiếng Anh" e="English"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="alz_yn" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="9">
      <header v="Phân tích dữ liệu" e="Data Analysis"></header>
      <footer v="1 - Sử dụng, 0 - Không" e="1 - Use, 0 - None"></footer>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="9">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
    <field name="user_yn" type="Decimal" hidden="true" readOnly="true" clientDefault="1">
      <items style="Numeric"></items>
    </field>

    <field name="id" type="Decimal" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="admin" type="Int16" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="pass" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="chkpass" type="Int32" external="true" hidden="true" readOnly="true" defaultValue="0" allowContain="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="chkdup" type="Int32" external="true" hidden="true" readOnly="true" defaultValue="0" allowContain="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="pwd_update_yn" type="Int16" external="true" hidden="true" readOnly="true" defaultValue="1" allowContain="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="220">
      <item value="120, 25, 5, 70, 100, 100, 130"/>
      <item value="1100011: [name].Label, [name], [id], [user_yn]"/>
      <item value="110001: [comment].Label, [comment], [admin]"/>
      <item value="11000: [cpass].Label, [cpass]"/>

      <item value="11000: [view_pass].Label, [view_pass]"/>
      <item value="1100011: [view_pass2].Label, [view_pass2], [pass], [chkpass]"/>
      <item value="1100001: [pwd_type].Label, [pwd_type], [chkdup]"/>
      <item value="110: [pwd_daychange].Label, [pwd_daychange]"/>
      <item value="-11000: [pwd_nextlogin_yn], [pwd_nextlogin_yn].Label"/>
      <item value="-11000: [pwd_useold_yn], [pwd_useold_yn].Label"/>
      <item value="-11000: [restrict_yn], [restrict_yn].Label"/>
      <item value="1100001: [restrict_users].Label, [restrict_users], [pwd_update_yn]"/>

      <item value="11000: [dien_thoai].Label, [dien_thoai]"/>
      <item value="11000: [e_mail].Label, [e_mail]"/>
      <item value="110000: [d_language].Label, [d_language]"/>
      <item value="111000: [alz_yn].Label, [alz_yn], [alz_yn].Description"/>
      <item value="111000: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="120, 25, 5, 70, 100, 100, 130">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="9" columns="120, 25, 5, 70, 100, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7e2hYlCCHZjzjAVFkQ/6QspDeBzIxTrBlcW9+k/+w668tzur57fVHLz0dfsdGIpkyBpgQuBONLvUc1myNy42IAJLmlLXyQbcn2HFf9+GgqMFDuVYmKQsnULZzAbOOvryeG3512XYQNwAtFyWZPOE3uU=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>FVYSqnAssNnMh/vqvNpriLfLfD+vK9qiQlDsLmaLjLTj7B/DKkvbVte+FqRYp3DfgY708lkjZdFDYum/QjZrtK1LeV/Ylerm9+GOc+4qp+EuXdC1k4WciBtSABSxuvUPxSEdUUg3UVJZvifQDmibXFWl8SAaTQLRtqpoIWv3ltuZpREcygr4OUUDiUqJirAPTBAzL5qOU2pN/ovsyBW0vgFK4streLu25G93qPjJAjmgMtgpMega+LokVdg88vni4qpqjJouny/jnMGOqBma7BiZB5E+shIPrfv6BEw0MBnZ5whvMsfP7Z/x1p3vyPE2</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7VOpfgOoiGWLcrOkxAyj9FfBr+8cqHYVJXxioTxaqynbLeMz7pApiGsvtxMe00SwfquRW3gkXbTEkeMc80SiZ4A=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7dDX1TUS6SjT6HFTfl+bMpHcc4F+RUp8RZDd7iTGevPWIgbcdy8yYJO6G+cBktrBXylLsL/Vdm8NdBSi4JWby1A=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>3n0MVlnw18k+y1Z93xMpWvuHkwflh8Nx2+0NUF2f4npGbkvGnZzNX9TULB7TFNjPvhNz3q/VhgSKW2Vt9u3uApiXbZFUOVF7GerVlDYqxs+GxOtf2qzIFzmpTzG6V92b7OrP/gzBxHVp56+nrTCAy5hg7rgejI3gNu04K5y3bs18HIuw7k9nf1O/yqUTHRvLM7zxDzSGPGecqZShBIl0ZkGjZrWngX63z6/lBqemINb5qOmAxypmxwcBnkUONvMZ0LCQ02GSN6DFnRLREIR8Xn660ZBWWH+7xLRzq6BfhkKOsjo3GeKOxLi1YOvwT6NjioJ75ucjyrcKD3wapfbF01c4yStV+pMhaK/j7u6uhVH/VhHg2jd6dDkPXU41jMYVizm86/L2FhNk1LLMl2/DOhy6jf8JiLvpdTZfYPR89LI15Ox/mfRL0xfTR2f7rdfS6WIP7tVbaUDtxEp8tKZDkKKnc+A4PIKsNQ9c+kU0oM6dqwmYBd4FQshXFiutfHCegi6Wg/4UQgSdyEIULXNNd1IfxjOvXh10ji9m9iC3UxIqTmOXT1Bd84enaGr/Fv11FKUH2I/iYFFZ2U05/dcO1Jy4u14+qScglOpxVz9FpxSbZuMqYJsdIx6FF51zsXgV</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>souwzPWX74DA3DTgoa+HAK1vSYC1JLv6VZ09XZ/GpjmUfqb5ouXrtWzR0lGx7I9lZ5ptdFAo/wEH1hVr7bIzuAd7oI5+qUs1qK8CtT9nnS8IAcDTutHX0Po6wT54hvXgxTwtJTXy6mvJfv2ecaMda8Gp8edt5Wml6IpSasocDRGp+YflKjGKcaOkwRX6BR1PiuWR+zIuaUg/cTUEnexrErUZ3Tn1/Udg46CMX4Ex0YuRvJ1b27QL9j7VD6fdA3hSqtwGxlIeO+unPOkRSHxjvGKd35yoWxk6eaJB0e3/w4w9dhEatqNyXgXmlOMsFb7GuRLRkwUWcbIY7mQvIMFvwGvAD+qMYKlFpx/hjgNErDbniJeD3qYDOlIX7MfucSfvQSv3VTLE0Hy7aWt7fHWqwQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>6B7ctFOz810dAE61qBs2rD82vFO9WDIxRnY7dGilV6SL3WMIa/4M7bik7ONrsmpG1wqV+X58Z6nlyUcUWDI7kJkjC6aWLMFGs6h6W9XOQDMz3xH4zxXRDS2XJw/7I2cjDjv/hOjN01FKraiw4IWCePdr5mwyFUp5q0FDFYmPgoIORwP5f1uNaf2x3KfWJJpxrcBPgvnMMDzNo3Ujvhi/TwJpphDvBxH1qf4AkroI0HJIcAK2IWJhVGk2XaMpPSr95sIecPDzcQ2XLxnaJblgk7fOu8uHs9Uq/rVo/EZUm/1Bh0pNPjNhj4U8w/Iy6uk+gT2QUaZSFiLbDxnGc/akkc6qluCVXeNGk2GoVi6VT0WLSYFFQd/jhsxh0/UWytYgAU/YiOjcou16IXsSRSMLpg==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>UcBBzF6DGTaRjdLVCH6ndEaFF1u4g4XAE0wcbfVKoxO93PbHc+V3T7i+jNYYGtdvsHLOPqCz/TEQL8ZX1gxspLKN/xhIznkz2tyiluzMDc/vY7xl63uVhb27V4cr2BwVb73uzjGbaQrxRpNSdgj+dmhQAVLZgsZD4v5JluwOxGuWubL7klJXvfJFN6StwIAQChKlR+c3FQVlZqgtG04UwW98vmJZNq3Ujm1HzNNfpnqr2cYoYX3JL+7OMCR+d9mdy39WS6E+CLRfPkvBwSfiHxvtruwwRuxOek5Baq7FvQZ0I4AtUNO9BWQTwCo44CaR+luAnWCX1FYqMWLyG3R6kbSA0u10YbI0js1xcaBXiRw6+vQCndfcYzdIoCcVhYuextz+4nsErNOic4LxTcq8SQGrEpw8MipEIL0S2udIbpl5cHSVr0SJsGMb3/vlnq9yRxsCxjmq90XJYKmqLJDBDJhaYGve3pTkwHRIGTEioex/5fPnd1McWiY8VJPgWJ8OrmZzjbiHLPriXodCdrED6AXyarx60UR1MQgIvHU0pjVxFz8xdkGsbM1JTsUrm39mYBwgbLsCzgxlCdMgSefhfPX7bizIf5x2AbzRfs6O5J0sthgWEor3oagud7GHKazHqDrePq+ypE9oorTsPvXIlPCKUMYwKc4ylh4cD7hANEB5vSsaX1ABgJhbTc/2BoHDcPgxWLAh/SS12Un4f901aw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9Y+cIioFfYYpGubbQAgIa3MjLBfN/po+Q9j/5zvIHqe/3UHr5KoEEsAkJge/GvmLdBW7dwiz0Y3k8kdv3gyk/zQgxV8blIGl7BfBujKtNgIDLqnR92ruB8ESXTP+WXMRjUJQQ4+QvWf/FrRfzfdbryDs4lqfxM1ueTqeUwCjG6kW9Y5jH/DuviHgV7ynYq2DDmuHjL11LzuhQiALVHxDxg4K7XARS96n0GI1qvFp/35Cx/E9sEUjDUMZp0AC2vAO2EZ641Qiz4EzNzAJRcLwWRLE+lfPqAfyjSWWb0VY5ebaFYBgzXftQ6rvLX0gZjzv0+C6Xh4Wv7BZ+d3PnTjQf2G2MscIyiIvBdV2P4JAzV7tHCKirZyq6cLHciIQ0zwjCXLQFb8iV3gu5i1Z2E5xxQ==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>sflaSIfs9pmtwhW+rLc9U63IH9UIXpQ8kELnXxKF6llCGm2LVpnThtROxu2eq9YkNyb3xmKYSeqOymiLDhupLU437cBS5ho86MUk1myYhhdrX2YlG55jmXHFcAMQ2pB2Uwdjw8Ke4w7wkuGM5Ow9GLDLeW3js/ds1M5sB+1XBk4b6q6bSC8DQ6bl6WWuRrOfSPTI5N65hu7pwZxEVJkarg==</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>UlRsG4NK5fb6cIdGpT62MERYZ5Smhkt/5q3Yvo4yem7I1w6NKL+ZWKLHkZGLcsjEhKi6sSUclms9n2FERbO43ODUeQU5Cxi30t5mXaEpLGjUZBxeBhyY2JxUAkEiAYuxxvetX1CqWfMqrYb76vsFdzR5IdDLHxKCZbjleYQxOCBniMF167Ln8Yzood7Fwx3xlM9TrDSUMfJdk39UaPEDKIRXjov4B4G6DePaCc0kD8c=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>glHcBa3TlQLZ/zqp+VHb9ktuPLUtATBtRv+t0GRFJRTCx0onalRwuQzEHwAidZW71Jlvrk+GLJpK6vdZrThcT2aeA+l3ALIUZLDX+vUveKIXA7E6ykoqL2GRyGrbOXBYthyy9pwgr5+9biQoMLVb7s9gn1MJe/gdIwk+IklIUDCqJg3G2q81sVqK0JvoacqE0B/hjTSA/x/rmt4GTYwam5Bvjd/Wf+WpvhCccWeRx9e25ebyzbcD0rn1r6QJU8XFiBMqz5Wp+rQUf5rbmQL+SSRyO6Ph1aM6UY0sYrUzsCcuOTc2utl0t5WPvjwioigcS4+mEJEWc61e6B0afp961GUX5GkvqRDKOfXH3ovU1WoZM/PtbqVk83Mr2Be9U3p3gKybzaV0ZY90rPAeNPx6jrKeHE5ybDiD7/LKonxiClK9PhBN878GkVhe/dLNkUbOxW+C9QmFoVmT0vcBCSHELHgAdZq/KF0uGqE+X/pb2NNS64a1wDVWdJ3KI6HPUoBwBAHy/YKJ2DBxYyD4YNUiIvBjpiFrvZxDfZWTdN5yAdIpCpcEKyzIgbQlJ/Opy+unWrLWGzcjQ42dKxozj53vWFmm9KKVkUBQ6zTBVSi6zj9BkM/y/4I6SHaD264WdWSUMciI846t9LLRD0Z9YB9AcX4686dg05uzEpgpREsXvKsLL8/WQvOcRwo3BpXkPF15uKgLeFxrggvyA2AOslqrA573U1BNBIJlv0RdGNCdSGvcbL2/grPs0ljd8KRgyWPW6P3qaKg6hfR1rlh/FAEsR0fJ75l+q0AGxLpYCYnifHorI9ZNLFQyZSEGKnp1EC0gfAy+uLEmfhKmX7gm/xWMV+/2IJDqICBakmGU8HYGM0yVsCqSX8x65xIUAfU+PVtb+XaJW5FOMqHvYQAsieJ2NgGBZG/45THISsvmRx/BvQRswcvnxNmq6GKmuETxdv7K9UNYl4H5xkFeqYghWgMmUkjoNAeCY04Y3+IFjU87T+L2QPSUWAkt8dFWxSkqcqzURHf8CcdRp2/ukohAKBXnnqxDbA/y91/1RB2Rvoj/fIzJZ90c95rxKJexC5FEZ5y44Mzy1H/c0IGvcrfZnRDRpHQNFWC1q/buUol8kv+JKJ7OAHGb1SSCmfhV31UTzcmVhzUe8aGhApuQEuVMcdUeOa9HWRWkhiISZT8aecdZRRWYM61K9iHe4ogG7yTGT4DYiJAXzJ4BPKwtCgVHmAv6IQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>cRgMVc4yd6R8g4YMR+KADmATzRrHDEeXfgtamE/RVsjtB9CN0MFznWwZQ+K7bmlewHN96+yfCqi2KDetckIi5WZiNz0rEQPgT/Ypeye1pizeWqXuiaGwPATUIVM0XjrnFIaguieS1zkH2fcMHjIASLXwPMkFaUmCtedZM0u0Ch7+VFASj2e4wdaDXkJY9L3dn0LSu2Q3thyLJuiFDAfd+leYB7q4mSdP/4022wVq0Ucrrc5tzFrH+4z9cBgRBzsEbtltHz/DtV3w1ijufmBfUsrGHCHhis2C3nL2RCyyXmXsyl9dqC1P91/Hp/DJ/5TcUQF45iKecPzJix8fQhrSLfg5AE8aKZmBJuWPHj8XTpXp3rIEd20H+2z21+lqawVApYMNZEY4U8F4jsuif1hJwYaMCVzoB5l6yJ+hBPIZWTFSKzcU38MHWq9ooHQRewgqWAc/AOKc0Kv5RClRC8bQ3Sqzw2zriVIcvxhM5LBLZmAn/+CkjKBS/kZ3x5Eqp82mmhdsQA3yi09AcA/uNIUnEn6LYXnRru+yw4PVPKu/UJU9c3BVsavK176V2MH+bdVtQhy0f1TmEbWhh65Vcik3z6WqWqk4mx/HxDRtL1x1wKHtL25dWx4X4uA5L1r3iSTY5y/b52nhpYa+hiY8EpbNWEait5QgWJUMWBq1Ld2DH7PWvG3NY2pZ6jhwbIq/BdHMgCtNHxgane9c9lhbPFNXLr5xoup+84hKXrQ2VX3iyY5r91TFmffExbAykfJtucRtw34TC/gu5gebWL0GomSWXay+7EOKvVbi0Z7fFqcKBKhyEmXZwDcvuEmjmRBBjXJEcNaFP1O7kQVNtOaODjUhLF9uiRtHunXZx/pzNL788pfoZ8p+uyLWssVbiY56HtpvrFCzrGsQxOadZ4jlfFuOo0fYKMlUjgcL6EtqjVC07Y0nbZUjgBe5s+9rGzBBS8uZ</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>dk4frtdR/F5JaohhB7Ke49QCkyRRFbVlcfiX0Ls6HlE4+/qoLRN1GSYafYLNxTbnoX8YhQ9jpe51deEjzXI90zcHq7dPtVjyYjZm8ng9qSZjZxhL59q5utOH8F1I3C0y0gXg96iUC3bxkREJFVvqQrd/MuEoWcTl60SLUq+a+U4t2OQQ6N7XZ0fN9FH6FehH+7/+tE536uyb3+qHn2weCULx7mklieR9fejKqg9lAl+dWOeLrKewqwpsIh81oQtHaOkB0TwB28H6FXYFIekjfA==</encrypted>]]>
    </text>
  </css>
</dir>
