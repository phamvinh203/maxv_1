<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnv" code="ma_nv" order="ma_nv" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="nguồn vốn" e="Capital"></title>
  <fields>
    <field name="ma_nv" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã nguồn vốn" e="Capital Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nv" allowNulls="false">
      <header v="Tên nguồn vốn" e="Description"></header>
    </field>
    <field name="ten_nv2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110: [ma_nv].Label, [ma_nv]"/>
      <item value="1100: [ten_nv].Label, [ten_nv]"/>
      <item value="1100: [ten_nv2].Label, [ten_nv2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ewFYas9MIo+SLrBnlTxMhoXKjAgYjs5aib2PDp+yiCYJrx28FMkATlfpclN9stZRA9iOhT6wDAmzcMYj4J5HZU=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3koYQdMyzQV+ev/MbOf/AK1BVOHHU3ZI7DfIEpsL7jSaIaUjOC2pLJX9e1NgSDxnMmQApBvQxGd9UYBp7W6Amuww=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>3XkovI8YwnxgFGTUd3voEDh2yod2dMPSvOg8k3UQfnEp/EM35Hszz9xJQyfKWkjC4GfCTBiPgt28tL+pfaX/6+RX4DGt2Wn0G3KD8udKk5zDuB74IVGQFIlxI23hHmElwJLoWaOo2az+sF0UInpJflBwzK8wzNh70WMTAoH0rCFHAhIDAqyGrjmFnyh3vPRbqjCiAl8jEZvfWmLeT6+2Cfj+thep/2EY9v9F+OGOn2TM/ocq+8am2J20a+9f7eMdO9dMHORRERtlyi7MMaNT60KatOzPZ/qNmvYR03w7gr48F1j/9gpQIvz4TiMg8FPqzTpo/AuDil0yXtT7TJcQelLLKPka/dZ34GEkzoaoR+fYrDY74SGz6q4GkyXSkLDy4UCxDtQLOm0Z7Wj86z07uCtKPpsyrK7MywUE2S9171s4npJ5rSCHJKhylqkLzlUvU4MjGejZ+J/s3DSuu4uiOPO0O5PrJugilkD2EjGjEQGSPbVN5Uim2tN0OENfnoatfSS7LubqfAfbrna6r3DFX6Wsjrb8xdinOVPNA26dhPw=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>4NcBEKLRAdzlJfp3qw+SdKtBNOntD99e9B1TF72vzyw24VxEen0Jt4uqC8+/1EHik69fj5dqjc9uPxTN1y1WYXmLXedAK4kTUCbAJ2BXOmQDutgkwYhyRX6zORV23cW6PjG16aSglp5bufKKQDAvL6WSWajgsD7iqNdaLVwx8rp0VRc/NUZlMGklDrAFTpCo/F9B2MkYvb62X359BuicZMcu6lu8tpniutiIlEecVC3gzZt7juoF6KzHkJCRQZVSVcxNTdmMyND5LJeZucWJlQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>f2IgEeKxZguFwRflxAzlnlninZ0UIAlS1PJSxjenL2ivTsfZ95KErgZAk3R+V9pW6/6XyJd+QTOVpgqwtAucYAwbH34597qbqBLBd1umLbB8ys94pe6pz96fjNziSFKmeXVhA5kcrgcUpYDdQmZ0553ZKUCz+PiTpEYm0Gx9RMTSz1VB9MBteeAbLQKE74gVMsYKGb2gyIAqfAmGqqMA4UCPaG7BnzGB3nm8rp/RPpXSQJTN34bdr7pAJ9RpCthtaOwfKvjvb3WlG+nd2bryVO782CeinxenJ17KRzjIgsuVg2+5/F1LTDR/a4jPa+5c</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlYnrTX8LokC/pSfWRKeDKWNmeUNYhI5M1lqBBS2FJ39U</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>ZTpDeVDfBh66BJ7xxCgXhLd48ZH9THwBzkjnqg/IBx4lJz2oOepT2SdZTLkyOawyGx930Mgq2m6ovfzL6q9TQ6tGQIsh0vH53LX7EidKo65nyq9uUB3J9GDj4xirLNTFas1Dkk0odjGrMdxXuOB8AP7utPwFBrj9xWgvVzHEH1AK2lA85ZhV0IRrS/iL6PbTCcLAvvj+lHZVLyepFk3kv1sM7KAkJD0MkwMF04aqamyXYUGplmDkU9JAMfG2qUJbEeAug6+DbmMgyzS4X3S+4gVHSV5ENaFXvz5AuZwp/4qsjl8c8ijxmga7tvLWfd7DJP8rreloMV2DWRRQC0Tohibq9Sy7HXJkqXV2wNZcQK0=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
