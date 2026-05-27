<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY defaultTable "COCP1">
  <!ENTITY defaultForm "COCP1">
]>

<dir table="dmmaubc1" code="ma_maubc, form" order="ma_maubc, form" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc mẫu báo cáo" e="Filter Condition"></title>
  <fields>
    <field name="ma_maubc" categoryIndex="1" allowNulls="false" defaultValue="&defaultTable;" clientDefault="&defaultTable;" hidden="true" readOnly="true">
      <header v="Mã mẫu báo cáo" e="Report Code"></header>
    </field>
    <field name="ten_ma_maubc%l" categoryIndex="1" readOnly="true" external="true" defaultValue="Default" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="form" allowNulls="false" defaultValue="&defaultForm;" clientDefault="&defaultForm;">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="AutoComplete" controller="ReportForm" reference="ten_form%l" key="form in (select form from dmmaubc1 where ma_maubc = '{$%c[ma_maubc]}')" check="form in (select form from dmmaubc1 where ma_maubc = '{$%c[ma_maubc]}')" information="form$ReportForm.ten_maubc%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa48/EVfKu/nBIlvVoc5tgv/Fxhah8xBhWZC0AHJU7W7I50OUuKua0/7oupP7bnYacog==</encrypted>]]></clientScript>
    </field>
    <field name="ten_form%l" categoryIndex="1" readOnly="true" external="true" defaultValue="Default">
      <header v="" e=""></header>
    </field>

    <field name="loai" external="true" dataFormatString="1, 2, 3" clientDefault="2" align="right" allowContain="true" defaultValue="Default">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Tạo mẫu, 2 - Sửa mẫu, 3 - Xóa mẫu" e="1 - New, 2 - Edit, 3 - Delete"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa48/EVfKu/nBIlvVoc5tgv/Ea6YSdWtucg3mz5FtGE4cmbrw4BEyNpsC/PGHE/fmcpg==</encrypted>]]></clientScript>
    </field>

    <field name="ten_maubc" categoryIndex="1">
      <header v="Tên mẫu báo cáo" e="Report Name"></header>
    </field>
    <field name="ten_maubc2" categoryIndex="1">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="xoa_yn" categoryIndex="1" type="Boolean" external="true" allowContain="true" defaultValue="true">
      <header v="" e=""></header>
      <footer v="Xác nhận xóa mẫu báo cáo" e="Confirm delete"></footer>
      <items style="CheckBox"/>
    </field>

    <field name="h_line1" categoryIndex="9">
      <header v="Thông tin" e="Information"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Thông tin&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Information&lt;/div&gt;"></footer>
    </field>
    <field name="h_line12" categoryIndex="9">
      <header v="Thông tin khác" e="Other Information"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Thông tin khác&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Other Information&lt;/div&gt;"></footer>
    </field>
    <field name="h_line2" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line22" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line3" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line32" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line4" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line42" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line5" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line52" categoryIndex="9">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="157">
      <item value="120, 20, 80, 100, 220, 10"/>
      <item value="110100: [form].Label, [form], [ten_form%l]"/>
      <item value="111000: [loai].Label, [loai], [loai].Description"/>

      <item value="110001: [ten_maubc].Label, [ten_maubc], [ma_maubc]"/>
      <item value="11000-: [ten_maubc2].Label, [ten_maubc2]"/>
      <item value="-1100-: [xoa_yn], [xoa_yn].Description"/>

      <item value="1-1: [h_line1].Desciption, [h_line12].Desciption"/>
      <item value="1-1: [h_line1], [h_line12]"/>
      <item value="1-1: [h_line2], [h_line22]"/>
      <item value="1-1: [h_line3], [h_line32]"/>
      <item value="1-1: [h_line4], [h_line42]"/>
      <item value="1-1: [h_line5], [h_line52]"/>
      <categories>
        <category index="1" columns="120, 20, 80, 100, 220, 10">
          <header v="Thông tin chung" e="General Information"/>
        </category>
        <category index="9" columns="271, 8, 271">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>/QPraNaNBxbuDWx+yDIi6Q9RsKBFRyrGA8qT+PZmr+6YV2IIZzmPXOcsLDvrKVlSHEx2h3zUQwA/cbBFXskBhohosEorTBWRVHmN12RjorZuy63NJMEyDEfmzvV7IHdH9VMD70VFuNETksFx8kDVtAyGhGA7+Sb74vy5PQ5dYnlMmlsKwWfa2BcrQORlHh7kWjiWKz9jMU3WqC1oYqUOE+De2nImFlkxiRlul6BNe4Suvr6DJ2+7waCJ2qYZxUfYqhsMfTXwOyYNsoCZaqSEl8ftgdaGYgdRI+tMVwTrLx0=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>CanMsx44z4/xd8R4OvPj5jHPNDFtXTYlZegmBpkBydWsgbS1hVCMmLmnAvhotnmx3I85wfOuHiMqQ+vmTRgqi8pZFsuhitnEDG1JgpcqeXrdm6gcznH59qVo8Pd2SfxQ23Z87+URYzJVXzs6uaD58uPmEeukZHmcT+T7xsb6G2A/1lqR2Kc0BVWN+lcYEWW6lmciDxjFcY4U9pkH96D9fUC1hiORgTseYvS3XNuiTKh6c6sz+yGSNwRPasxeeqdFpRhPc7brXsW2A9E6aK9TGXRXrw6YQU3TCG06th1jdFis0JJeki3P/wDODmB+3e5x</encrypted>]]>&defaultForm;<![CDATA[<encrypted>ZYJdYgZIxtjyeZbfMk76lHppupjQOz/LJgyHR496nv8=</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN208nr8ddUOkdV+VIPiouWE+Npt/BygzU+deCoHyHy2MUu1t17sBWApdTAeaOfFfW5SK25Cwy8n2fi/Le22V72eHwMlyqRZSzkk0OXo+4tLPCNBV9O4VqjKCGd8NQElE+JbSyLdI71ao1f5NJwgP0Wdvsjx+ZLxWzlC64/NTpSeX</encrypted>]]>&defaultTable;<![CDATA[<encrypted>6LDgt5e3p4D1+jZsKXdkwm3+XdwWbkjZBSDjmaYbsVN0RhUGfQBM2YK0dc5V3gKkmZlNmFCuS4zCc3i0/yl7Z4wNQe6gMlxR7UhyYoye1BXLdgalPNyLnNYSgFfYRGO9cIH/0N1EEvnHAJxzkV8zN7dtCmEFNy625ZrE5nJncgrHV51vIBHqG2oxlh1JPBA9iV0QhQexS7E1WA9F78mNg+EidbuYs1s/UaGvB1o1P8K20zM919bhygh6kXNihvvP1959usIGf6tqHc+ZJk+C1uOnsbdzgPaNSC4RgYfd84s/bZ+FJQgqBk9xOJONhQ5LWnqmifJqKz9sPa5zF7M8CvZvhsKfFKY6M7McT7b0ED2KbEu6T/3eYZdB/ym5c6wCGSUgT+R8ncyjyTM6g072sKM7U7As19XD8yiAtatZk0nDDbSUwuKkwbgHffsXizjM/KQ0/7D+Bw7SJENWrl/qY3H5yyosLQJNP1WRPNtEpT2DMfpyKWLTHCHJdgYmPys7AhI6NC2sLcNmeZ8Cpx27JL/CiFPCHbL8z4RWDgSVrJCoWORh2tWkdXC3MzoEhQhertKBpwP74ro/D/LSFZCAfY6u1+UMbKLEdBhlyoG7GycB4JqO5YALazyIi9Qi96Gg1wji5EY4+fOF2S4PIrZ0w1GhBof4oizUvQl83eXicAWDg5iIj04spiORe5jSG0g7UVToCNFw7hrqzynUe6JFJdg7VogaH1HEkxRpX2rHhpQCJZ4l39bo2FXKKRZc1zli6lMeCl3Za0a54KqifcaLCcLCq3f8+dYMCVJUkCqq1BoCO6/w1qQjzk0R0KWvHXY58iANoWinWuC+Zwf1H7rIug7UEJpF1TEpZQxkjFQZxD2lOijmt+G9xE/ipe6kgU5U64bBXuNgL6ObFaGdeFSMnMBXWIT/oF+U4v5JvJ4NlbYsKnpZnH3CWadOK9RiRuFIPjX33E0OnzBCFQbpxlhp4uwfFi5kppwe3BrDjoY/Q+TEat3iFtU+6lSLpK6G6X+AMM589aNp1WSWvTJSvn/qW1I7NqkRt9FDyOUAugjWVmsOeK7FaTZM3aC6piwGLPGuohNx5NAv1JrPx7UKkVcgMxGUOv0uGXIuBWJR6dARWsaK+E/sdY2SoDtBi5W1T1PHrtvNnZfMy2OKowvsS+UbpQ==</encrypted>]]>&defaultTable;<![CDATA[<encrypted>SIoRqfcWGdnHjb3HcQr5gLo6L0hSMicok4SvnEM7yBo+BoTn/DRgUdSXa6Gn//GPYzI63ZHr/wNeq8atMpuaczE4+sSUHoslGkl1J2U8Li4=</encrypted>]]>&defaultTable;<![CDATA[<encrypted>jO9omhthnZAcnXutIOUjDUB9c314HrGvIru+3ZXvnSWXJiaj+xA85fBaxy94yQblcxAzwxFXu9S2H2DNPoUh4GmSBVL9p9C0f6SodHcXxepoHiXGRSR7ZF3YLlzvWPfHb/aHIY+pgs0KTkKSx7ab9iXoW0smHyJcd0/Nm/qNVV67Q5tRjATIvlRE0ogTA0VP</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>tQUFWY+fmZQbc7/cJuy2ltYi3Jrlo3GrLyHt7DZgGHGKWLfRzVuZrJZreTLeqVBG8EtAf/wIhIKpthFBorIqJHSjx2D6outedY+v4e6I3QItugcg+jqCYGB6BnTSWOoLUss8U3kVVFzqP9BuhuDNv6btFrX2bdsveF+bH+ZTYX+lx9SP2jkzVKmDOL3ghZ41qYupgDfu+UMBWKpIC3uMNPabAgVJfL35qo2JML2xhPn+91pwtveQd8CDwQ3JJR4m+IoRSqr+2UO/ZKRb5u6n8KCpl3mw8ZV/UO+VXhmOAMgwZchNfRNZ3owk3ZnWiVIbq/x0Y5UFqBcXjAVLgdVX5DY1EEn57wLz12JpVwr216/WIaet0ChTqpqA3CBXd7yWl0FLT+KhbQB/TcXN1wq9tFkMb7FKoJoY4hchulvr+KfaZnPT4NGD5gLq1/PxhV3mK45i7urW6BsMWsXhQ5rAVGOolgmphMIDYKA83mLNkXkPCtJGBLvgr24R/TkRmidfVOuOzCYCr0jtXwcN1d5Nx6bXKJCTF24GffOM5gICdFwi+wG9N3wQbMCRaslAqewTd7KQG+XW1wP6alYvp5B69pbDkqAQn//h+2NIIaPEeEXcBWptQOcbJUzTdjSSbLGPT7JTQ4T7WeVtpjWlMTaywKIpWiHPSOPpGtv4VaDCYsy691lzon8vSyfqUEH8ceKY2120kNakme2whVsJ6AMAlLPFnXQ/Afb2JAiGFBsXDCpGQPLrit4fNOOeZuJCv5o+VzD5XDMxEGExvWVEzA4yu7vXxxR906nh2KfgyiWT9KO+9dIG7CvtBtaKWGYiAoi6kmzoEY1xI+Zm8YaCPZSMWpD4yRgAU2b6z0K9GObbpD5hDpDMZAaRPfO3VQyG2pAlPI7QsJcNYRTD0zqVtp2wpouTBvMUyRbZI3pV8dwLUP3ct757oaSZJB54VlodHHHngDt0nVkPR3h1rsekaLxsJVLMgVu+MVDJ/JbiujlvA7y19oJn2s3wNzy8ZlD0d+eEX5u/ppGQwVvTCb0OWj4p2mskj+3ZAkHCsnZ9B44o9hXPjcfjggVg+3OQWX0LkPbuQg0O7ogqRBU9VLNMDDg9+H7irWWknq8L/8FWhW0fq+AMPPLyuEFKJwwdVTXX9RQaYfAjav1TSCVEHLLyHUWj1Fs/dmcQLcAOhGXquiypEboLx13on9Cfj62elq6wtTGO</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="ReportForm">
      <text>
        <![CDATA[<encrypted>IY51D5dcpJtC9p+hph56gIkC1xfFrle2WB+2e/2nLprOy9hxjj4nMYEEypWw/u8T7kZHDUJKHMIHRvwqSOk+A9q56oPSgzv/+RhupFEIJ6jOJqvxPUEeDYh0dYaO56UhpMOo7uQl8vOt3VSougfHfGYugI6deXKzfzNo+Grau5o1tGDqYPgmO7xAqXhm9+qP</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>4MvSlYt1KryJh9p3EYdigax6+PZQLyAdjxI/FUw+i9HHDGIDqEkgfNgQYVxVBoZ1MaG19bXlOZXuwZXlxjbU78Gcq3c1kbnUY6sEwQJ4IGwtvO+Qk26lV6ZxcZjmGbQj</encrypted>]]>
    </text>
  </css>
</dir>
