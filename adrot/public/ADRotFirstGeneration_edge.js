/*jslint */
/*global AdobeEdge: false, window: false, document: false, console:false, alert: false */
(function (compId) {

    "use strict";
    var im='images/',
        aud='media/',
        vid='media/',
        js='js/',
        fonts = {
        },
        opts = {
            'gAudioPreloadPreference': 'auto',
            'gVideoPreloadPreference': 'auto'
        },
        resources = [
        ],
        scripts = [
        ],
        symbols = {
            "stage": {
                version: "5.0.0",
                minimumCompatibleVersion: "5.0.0",
                build: "5.0.0.375",
                scaleToFit: "none",
                centerStage: "none",
                resizeInstances: false,
                content: {
                    dom: [
                        {
                            id: 'PagesStub',
                            type: 'group',
                            rect: ['9px', '19px', '528', '403', 'auto', 'auto'],
                            opacity: 1,
                            c: [
                            {
                                id: 'BackPage2',
                                type: 'rect',
                                rect: ['-1px', '30px', '494px', '368px', 'auto', 'auto'],
                                opacity: 1,
                                fill: ["rgba(255,255,255,1.00)"],
                                stroke: [1,"rgba(151,151,151,1.00)","solid"]
                            },
                            {
                                id: 'BackPage1',
                                type: 'rect',
                                rect: ['-1px', '30px', '494px', '368px', 'auto', 'auto'],
                                opacity: 1,
                                fill: ["rgba(255,255,255,1.00)"],
                                stroke: [1,"rgba(151,151,151,1.00)","solid"]
                            },
                            {
                                id: 'PageStub',
                                type: 'image',
                                rect: ['-1px', '30px', '498px', '373px', 'auto', 'auto'],
                                opacity: 1,
                                fill: ["rgba(0,0,0,0)",im+"PageStub.svg",'0px','0px']
                            }]
                        },
                        {
                            id: 'AD',
                            type: 'group',
                            rect: ['52px', '85px', '442', '65', 'auto', 'auto'],
                            opacity: 0,
                            c: [
                            {
                                id: 'ADTitle',
                                type: 'rect',
                                rect: ['0px', '0px', '350px', '25px', 'auto', 'auto'],
                                fill: ["rgba(255,255,255,1.00)"],
                                stroke: [1,"rgb(151, 151, 151)","none"],
                                c: [
                                {
                                    id: 'Template',
                                    type: 'text',
                                    rect: ['4px', '1px', 'auto', 'auto', 'auto', 'auto'],
                                    opacity: 1,
                                    text: "Шаблон объявления<br>",
                                    align: "left",
                                    font: ['Arial, Helvetica, sans-serif', [22, "px"], "rgba(51,51,51,1.00)", "400", "none solid rgb(255, 255, 255)", "normal", "break-word", "nowrap"]
                                },
                                {
                                    id: 'TemplateCopy',
                                    type: 'text',
                                    rect: ['4px', '0px', 'auto', 'auto', 'auto', 'auto'],
                                    opacity: 0,
                                    text: "Прекрасная вещь для дома",
                                    align: "left",
                                    font: ['Arial, Helvetica, sans-serif', [22, "px"], "rgba(67,139,202,1.00)", "400", "underline", "normal", "break-word", "nowrap"]
                                }]
                            },
                            {
                                id: 'ADURL',
                                type: 'rect',
                                rect: ['68px', '37px', '137px', '12px', 'auto', 'auto'],
                                fill: ["rgba(255,255,255,1.00)"],
                                stroke: [1,"rgb(151, 151, 151)","none"],
                                c: [
                                {
                                    id: 'ADURLText',
                                    type: 'text',
                                    rect: ['1px', '1px', 'auto', 'auto', 'auto', 'auto'],
                                    opacity: 0,
                                    text: "YourSite.ru",
                                    align: "left",
                                    font: ['Arial, Helvetica, sans-serif', [10, "px"], "rgba(1,119,1,1.00)", "400", "none solid rgb(51, 51, 51)", "normal", "break-word", "nowrap"]
                                }]
                            },
                            {
                                id: 'ADSign',
                                type: 'rect',
                                rect: ['0px', '35px', '50px', '16px', 'auto', 'auto'],
                                fill: ["rgba(255,204,0,0.45)"],
                                stroke: [1,"rgb(151, 151, 151)","none"],
                                c: [
                                {
                                    id: 'ADSignText',
                                    type: 'text',
                                    rect: ['5px', '3px', 'auto', 'auto', 'auto', 'auto'],
                                    opacity: 0,
                                    text: "Реклама",
                                    align: "left",
                                    font: ['Arial, Helvetica, sans-serif', [10, "px"], "rgba(51,51,51,1)", "400", "none solid rgb(51, 51, 51)", "normal", "break-word", "nowrap"]
                                }]
                            },
                            {
                                id: 'ADText',
                                type: 'rect',
                                rect: ['0px', '60px', '442px', '12px', 'auto', 'auto'],
                                fill: ["rgba(255,255,255,1.00)"],
                                stroke: [1,"rgb(151, 151, 151)","none"],
                                c: [
                                {
                                    id: 'ADTextTemplate',
                                    type: 'text',
                                    rect: ['57px', '0px', '124px', '12px', 'auto', 'auto'],
                                    text: "только сегодня! Всего за",
                                    align: "left",
                                    font: ['Arial, Helvetica, sans-serif', [10, "px"], "rgba(51,51,51,1)", "400", "none solid rgb(51, 51, 51)", "normal", "break-word", "normal"]
                                },
                                {
                                    id: 'ADPriceTemplate',
                                    type: 'text',
                                    rect: ['183px', '0px', 'auto', 'auto', 'auto', 'auto'],
                                    opacity: 1,
                                    text: "%{ Price }",
                                    align: "left",
                                    font: ['Arial, Helvetica, sans-serif', [10, "px"], "rgba(51,51,51,1)", "400", "none solid rgb(51, 51, 51)", "normal", "break-word", "nowrap"]
                                },
                                {
                                    id: 'ADNameTemplate',
                                    type: 'text',
                                    rect: ['4px', '0px', 'auto', 'auto', 'auto', 'auto'],
                                    opacity: 1,
                                    text: "%{ Name }",
                                    align: "left",
                                    font: ['Arial, Helvetica, sans-serif', [10, "px"], "rgba(51,51,51,1.00)", "400", "none solid rgb(255, 255, 255)", "normal", "break-word", "nowrap"]
                                },
                                {
                                    id: 'ADTextName',
                                    type: 'text',
                                    rect: ['2px', '0px', 'auto', 'auto', 'auto', 'auto'],
                                    opacity: 0,
                                    text: "Сковорода",
                                    align: "left",
                                    font: ['Arial, Helvetica, sans-serif', [10, "px"], "rgba(51,51,51,1.00)", "400", "none solid rgb(1, 119, 1)", "normal", "break-word", "nowrap"]
                                }]
                            },
                            {
                                id: 'ADTextPrice',
                                type: 'text',
                                rect: ['180px', '60px', 'auto', 'auto', 'auto', 'auto'],
                                opacity: 0,
                                text: "5000 руб.",
                                align: "left",
                                font: ['Arial, Helvetica, sans-serif', [10, "px"], "rgba(51,51,51,1)", "400", "none solid rgb(51, 51, 51)", "normal", "break-word", "nowrap"]
                            }]
                        },
                        {
                            id: 'ParsedTexts',
                            type: 'group',
                            rect: ['52px', '85px', '350', '170', 'auto', 'auto'],
                            opacity: 1,
                            c: [
                            {
                                id: 'ParsedHeading',
                                type: 'rect',
                                rect: ['0px', '0px', '0px', '25px', 'auto', 'auto'],
                                overflow: 'hidden',
                                fill: ["rgba(222,98,98,1.00)"],
                                stroke: [1,"rgb(151, 151, 151)","none"],
                                c: [
                                {
                                    id: 'Title',
                                    type: 'text',
                                    rect: ['4px', '0px', 'auto', 'auto', 'auto', 'auto'],
                                    text: "Прекрасная вещь для дома",
                                    align: "left",
                                    font: ['Arial, Helvetica, sans-serif', [22, "px"], "rgba(255,255,255,1.00)", "400", "none solid rgb(0, 0, 0)", "normal", "break-word", "nowrap"]
                                }]
                            },
                            {
                                id: 'ParsedText1',
                                type: 'rect',
                                rect: ['0px', '58px', '56px', '12px', 'auto', 'auto'],
                                overflow: 'hidden',
                                fill: ["rgba(222,98,98,1)"],
                                stroke: [1,"rgb(151, 151, 151)","none"],
                                c: [
                                {
                                    id: 'Name',
                                    type: 'text',
                                    rect: ['2px', '0px', '54px', '11px', 'auto', 'auto'],
                                    text: "Сковорода",
                                    align: "left",
                                    font: ['Arial, Helvetica, sans-serif', [10, "px"], "rgba(255,255,255,1)", "400", "none solid rgb(255, 255, 255)", "normal", "break-word", ""]
                                }]
                            },
                            {
                                id: 'ParsedText2',
                                type: 'rect',
                                rect: ['181px', '121px', '50px', '12px', 'auto', 'auto'],
                                overflow: 'hidden',
                                fill: ["rgba(222,98,98,1)"],
                                stroke: [1,"rgb(151, 151, 151)","none"],
                                c: [
                                {
                                    id: 'Price',
                                    type: 'text',
                                    rect: ['2px', '0px', 'auto', 'auto', 'auto', 'auto'],
                                    text: "5000 руб.",
                                    align: "left",
                                    font: ['Arial, Helvetica, sans-serif', [10, "px"], "rgba(255,255,255,1)", "200", "none solid rgb(255, 255, 255)", "normal", "break-word", "nowrap"]
                                }]
                            }]
                        },
                        {
                            id: 'SearchForm',
                            type: 'group',
                            rect: ['32px', '22px', '452', '36', 'auto', 'auto'],
                            opacity: 0,
                            c: [
                            {
                                id: 'SearchInput',
                                type: 'rect',
                                rect: ['0px', '0px', '393px', '32px', 'auto', 'auto'],
                                fill: ["rgba(255,255,255,1.00)"],
                                stroke: [2,"rgba(255,204,0,1.00)","solid"]
                            },
                            {
                                id: 'SearchButton',
                                type: 'rect',
                                rect: ['397px', '0px', '51px', '32px', 'auto', 'auto'],
                                fill: ["rgba(255,204,0,1)"],
                                stroke: [2,"rgb(255, 204, 0)","solid"]
                            },
                            {
                                id: 'SearchSign',
                                type: 'image',
                                rect: ['414px', '7px', '22px', '22px', 'auto', 'auto'],
                                fill: ["rgba(0,0,0,0)",im+"search.svg",'0px','0px']
                            },
                            {
                                id: 'SearchText',
                                type: 'rect',
                                rect: ['15px', '12px', '134px', '14px', 'auto', 'auto'],
                                overflow: 'hidden',
                                fill: ["rgba(255,255,255,1.00)"],
                                stroke: [1,"rgb(151, 151, 151)","none"],
                                c: [
                                {
                                    id: 'SearchTextText',
                                    type: 'text',
                                    rect: ['0px', '0px', 'auto', 'auto', 'auto', 'auto'],
                                    text: "Подарок на годовщину",
                                    align: "left",
                                    font: ['Arial, Helvetica, sans-serif', [12, "px"], "rgba(51,51,51,1)", "400", "none solid rgb(51, 51, 51)", "normal", "break-word", "nowrap"]
                                }]
                            }]
                        },
                        {
                            id: 'SearchResult',
                            type: 'group',
                            rect: ['52px', '180px', '426', '78', 'auto', 'auto'],
                            opacity: 0,
                            c: [
                            {
                                id: 'SearchResultTitle',
                                type: 'rect',
                                rect: ['0px', '0px', '426px', '22px', 'auto', 'auto'],
                                fill: ["rgba(66,139,202,1.00)"],
                                stroke: [1,"rgb(151, 151, 151)","none"]
                            },
                            {
                                id: 'SearchResultURL',
                                type: 'rect',
                                rect: ['1px', '39px', '246px', '5px', 'auto', 'auto'],
                                fill: ["rgba(0,119,0,1.00)"],
                                stroke: [1,"rgb(151, 151, 151)","none"]
                            },
                            {
                                id: 'SearchResultText1',
                                type: 'rect',
                                rect: ['1px', '55px', '403px', '5px', 'auto', 'auto'],
                                fill: ["rgba(51,51,51,1.00)"],
                                stroke: [1,"rgb(151, 151, 151)","none"]
                            },
                            {
                                id: 'SearchResultText2',
                                type: 'rect',
                                rect: ['1px', '73px', '350px', '5px', 'auto', 'auto'],
                                fill: ["rgba(51,51,51,1.00)"],
                                stroke: [1,"rgb(151, 151, 151)","none"]
                            }]
                        },
                        {
                            id: 'SearchResultCopy',
                            type: 'group',
                            rect: ['52px', '288px', '426', '78', 'auto', 'auto'],
                            opacity: 0,
                            c: [
                            {
                                id: 'SearchResultTitleCopy',
                                type: 'rect',
                                rect: ['0px', '0px', '426px', '22px', 'auto', 'auto'],
                                fill: ["rgba(66,139,202,1.00)"],
                                stroke: [1,"rgb(151, 151, 151)","none"]
                            },
                            {
                                id: 'SearchResultURLCopy',
                                type: 'rect',
                                rect: ['1px', '39px', '246px', '5px', 'auto', 'auto'],
                                fill: ["rgba(0,119,0,1.00)"],
                                stroke: [1,"rgb(151, 151, 151)","none"]
                            },
                            {
                                id: 'SearchResultText1Copy',
                                type: 'rect',
                                rect: ['1px', '55px', '403px', '5px', 'auto', 'auto'],
                                fill: ["rgba(51,51,51,1.00)"],
                                stroke: [1,"rgb(151, 151, 151)","none"]
                            },
                            {
                                id: 'SearchResultText2Copy',
                                type: 'rect',
                                rect: ['1px', '73px', '350px', '5px', 'auto', 'auto'],
                                fill: ["rgba(51,51,51,1.00)"],
                                stroke: [1,"rgb(151, 151, 151)","none"]
                            }]
                        },
                        {
                            id: 'Smoke',
                            type: 'ellipse',
                            rect: ['209px', '87px', '30px', '30px', 'auto', 'auto'],
                            borderRadius: ["50%", "50%", "50%", "50%"],
                            opacity: 1,
                            fill: ["rgba(255,255,255,1.00)"],
                            stroke: [1,"rgb(151, 151, 151)","none"],
                            transform: [[],[],[],['25','25']]
                        },
                        {
                            id: 'cursor',
                            type: 'image',
                            rect: ['600px', '311px', '16px', '22px', 'auto', 'auto'],
                            opacity: 1,
                            fill: ["rgba(0,0,0,0)",im+"cursor.svg",'0px','0px']
                        },
                        {
                            id: 'Text',
                            type: 'text',
                            rect: ['192px', '191px', 'auto', 'auto', 'auto', 'auto'],
                            cursor: 'pointer',
                            opacity: 0,
                            text: "▼",
                            font: ['Arial, Helvetica, sans-serif', [128, "px"], "rgba(0,0,0,1)", "400", "none", "", "break-word", "nowrap"],
                            transform: [[],['-90']]
                        }
                    ],
                    style: {
                        '${Stage}': {
                            isStage: true,
                            rect: ['null', 'null', '550px', '450px', 'auto', 'auto'],
                            overflow: 'hidden',
                            fill: ["rgba(255,255,255,1)"]
                        }
                    }
                },
                timeline: {
                    duration: 12250,
                    autoPlay: true,
                    data: [
                        [
                            "eid357",
                            "opacity",
                            6250,
                            746,
                            "linear",
                            "${ADTextName}",
                            '0',
                            '1'
                        ],
                        [
                            "eid233",
                            "scaleY",
                            9152,
                            174,
                            "linear",
                            "${SearchSign}",
                            '1',
                            '0.9'
                        ],
                        [
                            "eid235",
                            "scaleY",
                            9326,
                            174,
                            "linear",
                            "${SearchSign}",
                            '0.9',
                            '1'
                        ],
                        [
                            "eid107",
                            "opacity",
                            4000,
                            750,
                            "easeOutElastic",
                            "${AD}",
                            '0',
                            '1'
                        ],
                        [
                            "eid314",
                            "opacity",
                            11750,
                            0,
                            "easeOutQuint",
                            "${AD}",
                            '1',
                            '0'
                        ],
                        [
                            "eid208",
                            "opacity",
                            6996,
                            754,
                            "easeOutElastic",
                            "${SearchForm}",
                            '0',
                            '1'
                        ],
                        [
                            "eid315",
                            "opacity",
                            11750,
                            0,
                            "easeOutQuint",
                            "${SearchForm}",
                            '1',
                            '0'
                        ],
                        [
                            "eid349",
                            "rotateZ",
                            5250,
                            500,
                            "linear",
                            "${ParsedText1}",
                            '0deg',
                            '360deg'
                        ],
                        [
                            "eid75",
                            "opacity",
                            2000,
                            500,
                            "linear",
                            "${ParsedHeading}",
                            '0',
                            '1'
                        ],
                        [
                            "eid320",
                            "opacity",
                            11750,
                            0,
                            "linear",
                            "${BackPage1}",
                            '1',
                            '0'
                        ],
                        [
                            "eid356",
                            "opacity",
                            6250,
                            746,
                            "linear",
                            "${ADTextPrice}",
                            '0',
                            '1'
                        ],
                        [
                            "eid133",
                            "background-color",
                            6254,
                            746,
                            "linear",
                            "${ADTitle}",
                            'rgba(216,216,216,1)',
                            'rgba(255,255,255,1.00)'
                        ],
                        [
                            "eid340",
                            "opacity",
                            6250,
                            750,
                            "linear",
                            "${TemplateCopy}",
                            '0',
                            '1'
                        ],
                        [
                            "eid350",
                            "top",
                            5750,
                            500,
                            "linear",
                            "${ParsedHeading}",
                            '0px',
                            '202px'
                        ],
                        [
                            "eid341",
                            "opacity",
                            6250,
                            0,
                            "linear",
                            "${Template}",
                            '1',
                            '0'
                        ],
                        [
                            "eid74",
                            "opacity",
                            2500,
                            500,
                            "linear",
                            "${ParsedText1}",
                            '0',
                            '1'
                        ],
                        [
                            "eid355",
                            "opacity",
                            6250,
                            746,
                            "linear",
                            "${ADURLText}",
                            '0',
                            '1'
                        ],
                        [
                            "eid296",
                            "opacity",
                            9500,
                            1000,
                            "easeOutQuint",
                            "${SearchResult}",
                            '0',
                            '0.50295350609756'
                        ],
                        [
                            "eid313",
                            "opacity",
                            11750,
                            0,
                            "easeOutQuint",
                            "${SearchResult}",
                            '0.5029540061950684',
                            '0'
                        ],
                        [
                            "eid132",
                            "background-color",
                            6250,
                            746,
                            "linear",
                            "${ADText}",
                            'rgba(216,216,216,1)',
                            'rgba(255,255,255,1.00)'
                        ],
                        [
                            "eid86",
                            "opacity",
                            3500,
                            500,
                            "linear",
                            "${PagesStub}",
                            '1',
                            '0'
                        ],
                        [
                            "eid319",
                            "opacity",
                            11750,
                            0,
                            "linear",
                            "${PagesStub}",
                            '0',
                            '1'
                        ],
                        [
                            "eid182",
                            "opacity",
                            3000,
                            500,
                            "linear",
                            "${ParsedText2}",
                            '0',
                            '1'
                        ],
                        [
                            "eid292",
                            "top",
                            9500,
                            1000,
                            "easeOutQuint",
                            "${SearchResultCopy}",
                            '531px',
                            '288px'
                        ],
                        [
                            "eid354",
                            "opacity",
                            6250,
                            746,
                            "linear",
                            "${ADSignText}",
                            '0',
                            '1'
                        ],
                        [
                            "eid285",
                            "location",
                            8500,
                            500,
                            "linear",
                            "${cursor}",
                            [[608, 322, 0, 0, 0, 0,0],[501.48, 234.8, -116.4, -161.46, -116.1, -161.04,138.77],[450, 40.01, 0, 0, 0, 0,341.82]]
                        ],
                        [
                            "eid324",
                            "location",
                            10500,
                            291,
                            "linear",
                            "${cursor}",
                            [[450, 40.01, 0, 0, 0, 0,0],[338.85, 99.73, -141.05, 41.93, -185.73, 55.21,126.89],[228, 106, 0, 0, 0, 0,238.47]]
                        ],
                        [
                            "eid105",
                            "left",
                            4000,
                            750,
                            "easeOutElastic",
                            "${AD}",
                            '600px',
                            '52px'
                        ],
                        [
                            "eid282",
                            "left",
                            9500,
                            0,
                            "linear",
                            "${AD}",
                            '52px',
                            '51px'
                        ],
                        [
                            "eid322",
                            "opacity",
                            11750,
                            500,
                            "linear",
                            "${Smoke}",
                            '1',
                            '0'
                        ],
                        [
                            "eid345",
                            "left",
                            4750,
                            500,
                            "linear",
                            "${ParsedText2}",
                            '162px',
                            '178px'
                        ],
                        [
                            "eid305",
                            "scaleX",
                            11000,
                            750,
                            "linear",
                            "${Smoke}",
                            '0',
                            '25'
                        ],
                        [
                            "eid307",
                            "opacity",
                            11000,
                            250,
                            "linear",
                            "${cursor}",
                            '1',
                            '0'
                        ],
                        [
                            "eid130",
                            "background-color",
                            6254,
                            746,
                            "linear",
                            "${ADSign}",
                            'rgba(216,216,216,1)',
                            'rgba(255,204,0,0.45)'
                        ],
                        [
                            "eid131",
                            "background-color",
                            6254,
                            746,
                            "linear",
                            "${ADURL}",
                            'rgba(216,216,216,1)',
                            'rgba(255,255,255,1.00)'
                        ],
                        [
                            "eid142",
                            "width",
                            2000,
                            500,
                            "linear",
                            "${ParsedHeading}",
                            '0px',
                            '350px'
                        ],
                        [
                            "eid51",
                            "top",
                            1000,
                            500,
                            "linear",
                            "${BackPage1}",
                            '30px',
                            '15px'
                        ],
                        [
                            "eid38",
                            "left",
                            1000,
                            1000,
                            "linear",
                            "${BackPage2}",
                            '-1px',
                            '30px'
                        ],
                        [
                            "eid288",
                            "top",
                            9500,
                            1000,
                            "easeOutQuint",
                            "${AD}",
                            '287px',
                            '85px'
                        ],
                        [
                            "eid347",
                            "rotateZ",
                            4750,
                            500,
                            "linear",
                            "${ParsedText2}",
                            '0deg',
                            '360deg'
                        ],
                        [
                            "eid291",
                            "top",
                            9500,
                            1000,
                            "easeOutQuint",
                            "${SearchResult}",
                            '423px',
                            '180px'
                        ],
                        [
                            "eid346",
                            "top",
                            4750,
                            500,
                            "linear",
                            "${ParsedText2}",
                            '121px',
                            '262px'
                        ],
                        [
                            "eid207",
                            "left",
                            6996,
                            754,
                            "easeOutElastic",
                            "${SearchForm}",
                            '600px',
                            '27px'
                        ],
                        [
                            "eid321",
                            "opacity",
                            11750,
                            0,
                            "linear",
                            "${BackPage2}",
                            '1',
                            '0'
                        ],
                        [
                            "eid353",
                            "opacity",
                            6250,
                            0,
                            "linear",
                            "${ADPriceTemplate}",
                            '1',
                            '0'
                        ],
                        [
                            "eid331",
                            "opacity",
                            500,
                            500,
                            "linear",
                            "${Text}",
                            '0.000000',
                            '1'
                        ],
                        [
                            "eid332",
                            "opacity",
                            1000,
                            3,
                            "linear",
                            "${Text}",
                            '1',
                            '0'
                        ],
                        [
                            "eid330",
                            "opacity",
                            1103,
                            0,
                            "linear",
                            "${Text}",
                            '0',
                            '0'
                        ],
                        [
                            "eid280",
                            "left",
                            9500,
                            0,
                            "linear",
                            "${ParsedTexts}",
                            '52px',
                            '52px'
                        ],
                        [
                            "eid128",
                            "rotateZ",
                            5750,
                            500,
                            "linear",
                            "${ParsedHeading}",
                            '0deg',
                            '360deg'
                        ],
                        [
                            "eid212",
                            "width",
                            7893,
                            500,
                            "linear",
                            "${SearchText}",
                            '0px',
                            '134px'
                        ],
                        [
                            "eid348",
                            "top",
                            5250,
                            500,
                            "linear",
                            "${ParsedText1}",
                            '58px',
                            '262px'
                        ],
                        [
                            "eid39",
                            "top",
                            1000,
                            1000,
                            "linear",
                            "${BackPage2}",
                            '30px',
                            '0px'
                        ],
                        [
                            "eid232",
                            "scaleX",
                            9152,
                            174,
                            "linear",
                            "${SearchSign}",
                            '1',
                            '0.9'
                        ],
                        [
                            "eid234",
                            "scaleX",
                            9326,
                            174,
                            "linear",
                            "${SearchSign}",
                            '0.9',
                            '1'
                        ],
                        [
                            "eid183",
                            "width",
                            3000,
                            500,
                            "linear",
                            "${ParsedText2}",
                            '0px',
                            '50px'
                        ],
                        [
                            "eid129",
                            "opacity",
                            6254,
                            746,
                            "linear",
                            "${ParsedTexts}",
                            '1',
                            '0'
                        ],
                        [
                            "eid50",
                            "left",
                            1000,
                            500,
                            "linear",
                            "${BackPage1}",
                            '-1px',
                            '15px'
                        ],
                        [
                            "eid352",
                            "opacity",
                            6250,
                            0,
                            "linear",
                            "${ADNameTemplate}",
                            '1',
                            '0'
                        ],
                        [
                            "eid148",
                            "width",
                            2500,
                            500,
                            "linear",
                            "${ParsedText1}",
                            '0px',
                            '56px'
                        ],
                        [
                            "eid279",
                            "top",
                            9500,
                            0,
                            "linear",
                            "${ParsedTexts}",
                            '85px',
                            '85px'
                        ],
                        [
                            "eid295",
                            "opacity",
                            9500,
                            1000,
                            "easeOutQuint",
                            "${SearchResultCopy}",
                            '0',
                            '0.49987296747967'
                        ],
                        [
                            "eid312",
                            "opacity",
                            11750,
                            0,
                            "easeOutQuint",
                            "${SearchResultCopy}",
                            '0.49987301230430603',
                            '0'
                        ],
                        [
                            "eid306",
                            "scaleY",
                            11000,
                            750,
                            "linear",
                            "${Smoke}",
                            '0',
                            '25'
                        ]
                    ]
                }
            }
        };

    AdobeEdge.registerCompositionDefn(compId, symbols, fonts, scripts, resources, opts);

    if (!window.edge_authoring_mode) AdobeEdge.getComposition(compId).load("ADRotFirstGeneration_edgeActions.js");
})("EDGE-272863804");
