<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "INBCTK1">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Xem chi tiết vật tư" e="View Item Detail"></title>
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
        <![CDATA[<encrypted>XM5XwRYk0zCyFBFLwEL8QDRSt7geaIo4FKdOBKr0uP5iz9SQFnjlwp+vU3I1DPF2B18WoXTCTpBfK+bVtUs15jQvhm4PyI9i5OG4dRfD0nwXKqSyzI+2ChF0W8tKHiTQPkq1l2BPevfjftdTy0u5oL9BrM7nCd5pyqddCqZ7ICB45Y7W1VIL1PfSSLeMwJxAumr4g0xqK6OkfwU6ei3/Chz87sPyJgOfN/6+D6fbP+ciUThBVsGm83KIDD0UeFFlm8R30szi/Ze0ICoR8HYuOIF0pcWH3QJu4/cbT1VB+tbPPFNCkKvRA5oNpBohpcMg4gLkKYSw4PJSrGDbgF7ghtOPFalonqGB1xcHZC0cblP69NtbCRx5J5x+Mb4AuAmk90sgDs+NaM71b86wQxkBxUYYMrDpv4pdrlcc9nik9oCTvfhfurZz6pLQdaj24SebFjc7FeMoUcp3zVbNYldORSn/H6OB1A7TkjUT0/7VfnzE2FhbKRqV7ktHSO0MvE5PqxFfBDP5clpamVZE+zwP5O+vNfkvgwbxO714zYGk1bojvSbMEWQnfsMMOknzT0Ibc9QnaYO540VvniJdRwdsYCmTolxDUD0e3dIH+81coEszjudwlCneaHw+yxSw+om4G4pkdAaKWumw2l8MPtB6B3wVXIPZct0Ok42iSt0rjXDXaYZGocvvJ5MulIVviyRvTt9HH2iZViL0r3Y1yde9TSmilCfFzTwi+ATrXhNCF9Nn/+FZTEB11WCOg5DswtWa80DpSZLRRRwSd/H6aEz13VkXHbbxw96z7Sx5A1bafTAwBNzHP+x+f9pV/rFGIPn08zmbtnTow6mfFdEpz8JL7ts5aol+3B03wasD+atmdqXMuigrFVlcWWbHRd6wmXok1L/hck4/3tmVggo2gM4KQ1K3h1qtB9R7WM8H1dn8hPYu3NZLAagbkspbpciXtW/avqk5r+n6w5m+BQQtqH2/lklZgex58EzuJ+xYlQaPN4rJWcel+SG7K9SjHubfiTy1uWBxpqy1GCCBRaWOlDkcLelS25KFcl1+CzAyYINCAzpuyo+Z+0+zbyGZDz7xzCgAu0dlFOD+5NDAYue1wW8dQNCO252k34Ee74rBsP/yVxaJxsaLToIspbytOPLcGLXs</encrypted>]]>&Form;<![CDATA[<encrypted>KO6A3EvU7pVMe3x07Ru0eFw5JDJtOTvJBWdoe/7P/2S2VmvwlOdHLbGDuu39wTeP2ZYAQU5IBCboQ5jGKI1k/duvw1PHuZ9w3BZ6tFqxVcjaKqz2XAPbC3MDl7wcI2AvvYhZ2TIpltKhWrEOIJRYA8e1Nsn2zAvTJj1FtJRQjZ8LCch4ZS5sJIETy6PWb6Ly0Xt07XmKHalAzW+OXMzrg6ZVKAL0Xq+vXGJq6zGjPkq+R/gtGUV513WDbJiBbBviYpypBFVQ0yIa5Wf7s9TAw6yb6Cjvco+0KuUJrMpkYoYVBWoIVBzxZP4bDUtK9ZjKar7KbuZ6Bp82wd1wfl/wDlKybW2S/TFtpjwgHN38ygDHv9nymXemN8VH/VtfB75e</encrypted>]]>

      </text>
    </command>
  </commands>

  <script>
    <text>
	&ScriptQueryFilterString;
      <![CDATA[<encrypted>JMnxzpc8qsPxKAqJJBy7+3/nMlM7toiyCczRl1q+tp4PLJSoGmcO+YBtn1hg4KiWLTnzZRsrnSBGHVac2Ne+5SbcIPGpqjVnJRo8r19UgXlChhBwPNwGXY3SnTAgshquW3Fh9FthGWg+9IOezIm7nUi0YsyfblTbn7WDBVfqj0hxecEspA0cmTuyDchAAMUR3S79IfkKZj6OtqEOMmkuJbedsCM8gIsNPVX26Pl9fg0UbSj5YPp9BhD3ZoABwhNB6BE1FPB/q1JA2vMFOz9+z3OHDmDgLvVklOydtonVyJcztCXeWZ2WXCJD4t87wD1mvirUoKK+pWREOhleWErw7ui6lSrxr+4znClj7pg0aFnXDfwcj+4mhDQhVblAD9nWbehIdyEHmdtkCeNSdWCudOCnzrsdTERxoWv5todJarMv645HNGW4eIAb3FW+hmL2mPiPbRif3eZuYA/vhtvS2TqVUM8cApfkX3XWbUaWHeTb8UR7WpxzM0qoXAgQ4LlrYzztcSxUmY9pYbIZb402EDnWlfD1x0m1SFMrhFZUVcatqT3hZmXPrC2qh34h8dd5MEGHJf6BEwPzrTMG4eMECsefZmQfru1AJy6TDTBf6hNEG9CcNZG62kcupm7UQolfnBSYIv+JXnQTYob3ULtdtqYliYziid54RtaJRr+4OyDXDpbpd1KJga9lJ9zC5HCNJPzwW/8tFolxkHrsBFZzmzwvF19JG4tTfAK9cp7Mcfo+le/MmGeB1asSIpfYV5KHFnlGVdI3vV9PY5Xn0rtmPowgQlhOgXgH6g1DK5qo673kl3cWwaK1E4EwkMHojL3sBGl35c0ik1y9rmXnfmXVCA==</encrypted>]]>
    </text>
  </script>

</dir>