<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
]>

<grid table="dmcltg" code="stt_rec" order="stt" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Bút toán chênh lệch tỷ giá" e="Exchange Rate Transaction"></title>
  <subTitle v="Kỳ %s1 năm %s2, mã nt %s3 - tỷ giá %s4." e="Period %s1 year %s2, currency code %s3 - exchange rate %s4."></subTitle>
  <partition table="dmcltg" prime="dmcltg" inquiry="" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="stt_rec" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="tag" type="Boolean" width="60" external="true" aliasName="cast(0 as bit)" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
    <field name="stt" type="Decimal" width="100" allowFilter="true" align="right" readOnly="true">
      <header v="Số thứ tự" e="Ordinal No."></header>
    </field>
    <field name="ten_bt" isPrimaryKey="true" width="300" allowFilter="true" readOnly="true">
      <header v="Tên bút toán" e="Description"></header>
    </field>
    <field name="tk" width="100" allowFilter="true" readOnly="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="tk_cltg" width="120" allowSorting="true" allowFilter="true">
      <header v="Tk chênh lệch" e="Difference Acct."></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="tag"/>
      <field name="stt"/>
      <field name="ten_bt"/>
      <field name="tk"/>
      <field name="tk_cltg"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ksHDWCkHEtt+iNpyzh+LEKBKdSHSq2KxZh+kM06qUrCjf0VOcf5QGfSwrPTfWxXDu/kuR50cuFvCXRk3YVxuVus=</encrypted>]]>
      </text>
    </command>

    <command event ="Scattering">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjsTx4aoKFC/0LzfM++Agf3Fpu6I4lq+rJk2T/lWJ989igNkrtMHCGTP0xuDcKUyOpwzZw+5PofBKEnfxnInsRo=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ku0s+MPpSw+4BviHGbpGdzmfyHR4o7kMFkgcV8IF788NeGSFsV3oPRikiY+QT/tRUqEgJ7LJBBOv5piVkre9bso=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>jMenRoYbMGnrAIm9PfqZrr/KoDXsy7aF+6927c55PSG+p64wwxgmXtYDyq6drSq7kVhF055EGO0ncU5Ubw0kR7+7+LwXP10KT/97D2L1+lStOkAPW4b1VwErSgIRquMrvM3JLcjbCa9m7TqP25DlhC6yezOsd0wm7oGIDEzypF1TI6sa3Wntr9mHmoPaid2rwh/5c1cz95aRwIhwGnmj2rSXUVa/KvRZNqhyvUuA7CA6gmIBH07BTLHxiQ9ePMKsTN4+wrw/Ssyqt5YKPXlGR2sZfm20uA9Ai6Y2LieLyzKfHuU/CuDOZTPILl0zav/ei9+oW5nxqv6dZteYreb6GyMbkexmhlifjySXY4+Xv/6cNrWpryrcwsHGFKpESS46nkoYOnetw0mX+AoFTaz8Jsb7XbHyCCULV9/cAUeQvPHAvVOF1gNcDfMMYs5KxP9boM2a7+8wihzWovIzKKfabywQrXDKIvkRz/R16U7nEu1FcYuElk2xBRM9dgfPpS1S8oOgbqU3y3zsNmwzIkO3NzouCDArQ91a9b76KenK1voqqCHyo8uAMOfwWpoObGPSU2DRL/pF/6CfmvhIrksfgw9wEJnTscgYkruXvmmQAdjZmphw3MJEv4cPeyCT0cNLTa8vn6T2YE5dq5w0SNRMqN67H1CXI6KpC5tTmddangeZ8KNkCsx3866K3wduB7PbJzCBfj8pJ1XuXVtdiOefmJTYwiTK9JEmTxkw2ABBQ55lQHdSuJHxFJlr5YpLp5qnovMFHUBHDJlB81PM0z0eahAZNMPrAsviVGwqw8LHFM4I+gQ65Xpf4uCYFJh6E8ckzmtbpCW1GFRrv6DLq9TbkzhlZ0VKcQnh+PBQFoXshfPxt9CsQgbws2Ozw0xvKTH+1c4ZAhuMn4I+KqnMTn4++cJxBvn4oIPuGfPrda8xMDkWgUhxu0Cj79zi8uL3tKSjTcs23ALAJkkWje0J8WENnODvtb8STsQ+EV+LrkRtytiPPftuO477WJU7JPk/KBwba86Y2LsVpiBNsrZ2qHF2BGKghOinExIqApKROI+fYdR8qICIJ9KYKS33NbFBvx5tdPDtWCI4FhS13ShCRBAXOH9Gk4V715IHh2QdS9Wv9cR4xnjYyv/gd7OyDv1i0viIrWi+nwiaMXlBmHPmrIaL+HELgMiJi0BDXMH6Kg9NHK+mgjrHjrliKlclvP9CEWw7VliBeLVInrjpQoM/STfJmeEhl5wSEDOfqw1kwp3zReNdv9iVxsfdzZV6k6Y89R3kmS9eSW/+d8yRqK2ct94c542rMQU3S3rwaW356pAagsb/YG8tLHAecs06E6GnpcUwEqtENPPwP0SeYakJj4kpTWHNbBpzOLVoxby3yQTEFSOgztaya0n6G5zmwEysWIwUXWmy2B6XBmMmaxW30XCrxok8jROb9yg6HRVNz53Ti/bf6u6kh3wmF2XkHTTWjqboqX3a6WOoz+aw+iVbpi9y5mwGhX93DGy98uYT5Owq0Xn4PJKH8CVAlRLOPWprVEPDrxz611jDZfT37ywSeMrrQE7EZPAvkqyt5I9pWAIjvDDdl1k0z0ZGfs8xseUmuOSVsHNMLKQmluXjpiHfTAXZXEjFSzLpMJAoDuPBFcZbJM6hPo8sojf+iaI+YkoP6sIVWQnlH6G5pNTVbjaxTRUxHuGvz0ui8EkkfiTKVqjHDd1chnq5/XxSdwCzj01K5Ab7m1fFWAXNulyd/FRUAy/yu0Nm9szoa0pp30uZ5xAi3fdCZNzWObJcylnmnRqSYokTuVDchBtFolyibCCW+28rJ5GF9wn9E+s8qmiE55Ni7RQ=</encrypted>]]>
    
    </text>
  </script>

  <response>

    <action id="Create">
      <text>
        <![CDATA[<encrypted>ZKF1BTHRIynIE3cXE/UzjXRf6jeHrbThzriXnwCIRAXegYOYqtGvSToNHPPptfJySA5kccX1mItSHxgzMkuP220vKJvjKnCzhx06PQxR3JmWG/EWmoiz5tAcdNIt/IzNT/pw9RFIwxuVzDio7mLoojwPG3d66+Pb3mcKXFetQtXiymUvxeZtc3jg531OAc01CmMzNLYbOXwwKOZAnmHiukf+qb88evlXaWWyqJcYbaRNXobjW7xdjy0m+iNW/TKG</encrypted>]]>
      </text>
    </action>

    <action id="Truncate">
      <text>
        <![CDATA[<encrypted>fWiXWZkl5DsX89AikdlNqVwh+FSCME2uICa3QY0o/TVgx597uK7oO54mDNxSbMufO+39+egV9aFsS0CA0AXqpAWcRZ7BhT2+Hzlp7LUF7Ud6ZoRMctxCIlz1FZBYmmRsfCHIhkN0F0fVU91lIwLcPoFMHV2J8IbTnnXzujrXaT34NJ6WeRaiKiVStH/Whg1m9KH3h5/spyMWw5flYDmZxfiOBO7XXN3z9muEaE2rtUmEslRnLMzC8uo+zhk0yBUd</encrypted>]]>
      </text>
    </action>

  </response>

  <css>
    <text>
      <![CDATA[<encrypted>aj7MSALopNrDuRtgQ38Flktlvv/hBphTYlxk1PoS6qFFGHbHdvzlf+PUai1eINKPW14rN3yApxaw14jUx4wAGMcI02+w4UoOQXTsdhhB5iCZODquyHz3iKvQ6GA6IIAaToq7AyfKENm1+1Kz0WXOpDSqfHxeCCppsV/hAX5QNSE=</encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Create">
      <title v="Tạo bút toán" e="Create"></title>
    </button>
    <button command="Truncate">
      <title v="Xóa bút toán" e="Delete"></title>
    </button>

    <button command="Search">
      <title v="Chọn kỳ" e="Filter"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
