<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="a" />
        <signal name="b" />
        <signal name="c" />
        <signal name="s" />
        <port polarity="Input" name="a" />
        <port polarity="Input" name="b" />
        <port polarity="Output" name="c" />
        <port polarity="Output" name="s" />
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
        </blockdef>
        <block symbolname="and2" name="XLXI_1">
            <blockpin signalname="b" name="I0" />
            <blockpin signalname="a" name="I1" />
            <blockpin signalname="c" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_2">
            <blockpin signalname="b" name="I0" />
            <blockpin signalname="a" name="I1" />
            <blockpin signalname="s" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="608" y="1104" name="XLXI_2" orien="R0" />
        <instance x="592" y="976" name="XLXI_1" orien="R0" />
        <branch name="a">
            <wire x2="544" y1="848" y2="848" x1="464" />
            <wire x2="544" y1="848" y2="976" x1="544" />
            <wire x2="608" y1="976" y2="976" x1="544" />
            <wire x2="592" y1="848" y2="848" x1="544" />
        </branch>
        <branch name="b">
            <wire x2="528" y1="912" y2="912" x1="464" />
            <wire x2="528" y1="912" y2="1040" x1="528" />
            <wire x2="608" y1="1040" y2="1040" x1="528" />
            <wire x2="592" y1="912" y2="912" x1="528" />
        </branch>
        <iomarker fontsize="28" x="464" y="848" name="a" orien="R180" />
        <iomarker fontsize="28" x="464" y="912" name="b" orien="R180" />
        <branch name="c">
            <wire x2="880" y1="880" y2="880" x1="848" />
        </branch>
        <iomarker fontsize="28" x="880" y="880" name="c" orien="R0" />
        <branch name="s">
            <wire x2="896" y1="1008" y2="1008" x1="864" />
        </branch>
        <iomarker fontsize="28" x="896" y="1008" name="s" orien="R0" />
    </sheet>
</drawing>