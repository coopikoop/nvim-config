local days_of_week = {
    Monday = {
    {
        [[   *                        _        *     ]],
        [[                +          | |             ]],
        [[  _ __ ___   ___  _ __   __| | __ _ _   _  ]],
        [[ | '_ ` _ \ / _ \| '_ \ / _` |/ _` | | | | ]],
        [[ | | | | | | (_) | | | | (_| | (_| | |_| | ]],
        [[ |_| |_| |_|\___/|_| |_|\__,_|\__,_|\__, | ]],
        [[                             +       __/ | ]],
        [[     *               *              |___/  ]],
    },
    {
        [[            *               _             +]],
        [[   +             +         | |             ]],
        [[  _ __ ___   ___  _ __   __| | __ _ _ * _  ]],
        [[ | '_ ` _ \ / _ \| '_ \ / _` |/ _` | | | | ]],
        [[ | | | | | | (_) | | | | (_| | (_| | |_| | ]],
        [[ |_| |_| |_|\___/|_| |_|\__,_|\__,_|\__, | ]],
        [[                         *           __/ | ]],
        [[           *                        |___/  ]],
    },
    {
        [[       +                    _              ]],
        [[            *              | |  *          ]],
        [[ *_ __ ___   ___  _ __ + __| | __ _ _   _  ]],
        [[ | '_ ` _ \ / _ \| '_ \ / _` |/ _` | | | | ]],
        [[ | | | | | | (_) | | | | (_| | (_| | |_| | ]],
        [[ |_| |_| |_|\___/|_| |_|\__,_|\__,_|\__, | ]],
        [[     +                *              __/ | ]],
        [[            *                  +    |___/  ]],
    },
    },

    Tuesday = {
    {
        [[  _   *                   _              ]],
        [[ | |                     | |       +     ]],
        [[ | |_ _   _  ___ *___  __| | __ _ _   _  ]],
        [[ | __| | | |/ _ \/ __|/ _` |/ _` | | | | ]],
        [[ | |_| |_| |  __/\__ \ (_| | (_| | |_| | ]],
        [[  \__|\__,_|\___||___/\__,_|\__,_|\__, | ]],
        [[    +                        *     __/ | ]],
        [[              *                   |___/  ]],
    },
    {
        [[  _                       _  *           ]],
        [[ | |              *      | |             ]],
        [[ | |_ _ + _  ___  ___  __| | __ _ _   _ *]],
        [[ | __| | | |/ _ \/ __|/ _` |/ _` | | | | ]],
        [[ | |_| |_| |  __/\__ \ (_| | (_| | |_| | ]],
        [[  \__|\__,_|\___||___/\__,_|\__,_|\__, | ]],
        [[                     +             __/ | ]],
        [[         *                     *  |___/  ]],
    },
    {
        [[  _        *              _              ]],
        [[ | |                     | |      +      ]],
        [[ | |_ _   _  ___  ___ +__| | __ _ _   _  ]],
        [[ | __| | | |/ _ \/ __|/ _` |/ _` | | | | ]],
        [[ | |_| |_| |  __/\__ \ (_| | (_| | |_| | ]],
        [[  \__|\__,_|\___||___/\__,_|\__,_|\__, | ]],
        [[         *                         __/ | ]],
        [[ +                        *       |___/  ]],
    },
    },

    Wednesday = {
    {
        [[                   _    +                _              ]],
        [[    *             | |                   | |         *   ]],
        [[ __      _____  __| |_ __   ___  ___ *__| | __ _ _   _  ]],
        [[ \ \ /\ / / _ \/ _` | '_ \ / _ \/ __|/ _` |/ _` | | | | ]],
        [[  \ V  V /  __/ (_| | | | |  __/\__ \ (_| | (_| | |_| | ]],
        [[   \_/\_/ \___|\__,_|_| |_|\___||___/\__,_|\__,_|\__, | ]],
        [[                           *                      __/ | ]],
        [[          +                                _     |___/  ]],
    },
    {
        [[                   _          *          _              ]],
        [[       +          | |                   | |           * ]],
        [[ __      _____  __| |_ __   ___  ___  __| | __+_ _   _  ]],
        [[ \ \ /\ / / _ \/ _` | '_ \ / _ \/ __|/ _` |/ _` | | | | ]],
        [[  \ V  V /  __/ (_| | | | |  __/\__ \ (_| | (_| | |_| | ]],
        [[   \_/\_/ \___|\__,_|_| |_|\___||___/\__,_|\__,_|\__, | ]],
        [[   *                        *                     __/ | ]],
        [[         *                              +        |___/  ]],
    },
    {
        [[               +   _                 *   _              ]],
        [[                  | |     *             | |      +      ]],
        [[ __ *    _____  __| |_ __   ___  ___  __| | __ _ _   _  ]],
        [[ \ \ /\ / / _ \/ _` | '_ \ / _ \/ __|/ _` |/ _` | | | | ]],
        [[  \ V  V /  __/ (_| | | | |  __/\__ \ (_| | (_| | |_| | ]],
        [[   \_/\_/ \___|\__,_|_| |_|\___||___/\__,_|\__,_|\__, | ]],
        [[     +                            *               __/ | ]],
        [[                 *                          +    |___/  ]],
    },
    },

    Thursday = {
    {
        [[  _   _   *                    _              ]],
        [[ | | | |                      | |        *    ]],
        [[ | |_| |__  _   _ _ __+___  __| | __ _ _   _  ]],
        [[ | __| '_ \| | | | '__/ __|/ _` |/ _` | | | | ]],
        [[ | |_| | | | |_| | |  \__ \ (_| | (_| | |_| | ]],
        [[  \__|_| |_|\__,_|_|  |___/\__,_|\__,_|\__, | ]],
        [[            +                           __/ | ]],
        [[                               *       |___/  ]],
    },
    {
        [[  _   _                   *    _              ]],
        [[ | | | |     +                | |        *    ]],
        [[ | |_| |__  _   _ _ __ ___  __| | __ _ _   _  ]],
        [[ | __| '_ \| | | | '__/ __|/ _` |/ _` | | | | ]],
        [[ | |_| | | | |_| | |  \__ \ (_| | (_| | |_| | ]],
        [[  \__|_| |_|\__,_|_|  |___/\__,_|\__,_|\__, | ]],
        [[                      *                 __/ | ]],
        [[    *                              +   |___/  ]],
    },
    {
        [[  _   _    *                   _              ]],
        [[ | | | |                *     | |             ]],
        [[ | |_| |__  _   _ _ __ ___  __| | __ _ _ + _  ]],
        [[ | __| '_ \| | | | '__/ __|/ _` |/ _` | | | | ]],
        [[ | |_| | | | |_| | |  \__ \ (_| | (_| | |_| | ]],
        [[  \__|_| |_|\__,_|_|  |___/\__,_|\__,_|\__, | ]],
        [[    +                                   __/ | ]],
        [[                *               +      |___/  ]],
    },
    },

    Friday = {
    {
        [[   __   *  _     _           *  ]],
        [[  / _|    (_)   | |             ]],
        [[ | |_ _ __ _  __| | __+_ _   _  ]],
        [[ |  _| '__| |/ _` |/ _` | | | | ]],
        [[ | | | |  | | (_| | (_| | |_| | ]],
        [[ |_| |_|  |_|\__,_|\__,_|\__, | ]],
        [[                  *       __/ | ]],
        [[    +                    |___/  ]],
    },
    {
        [[ + __      _     _    *         ]],
        [[  / _|    (_)   | |             ]],
        [[ | |_ _ __ _ *__| | __ _ _ * _  ]],
        [[ |  _| '__| |/ _` |/ _` | | | | ]],
        [[ | | | |  | | (_| | (_| | |_| | ]],
        [[ |_| |_|  |_|\__,_|\__,_|\__, | ]],
        [[             +            __/ | ]],
        [[   *                   + |___/  ]],
    },
    {
        [[   __   *  _     _              ]],
        [[  / _|    (_)   | |          *  ]],
        [[ | |_ _ __ _  __| | __ _*_   _  ]],
        [[ |  _| '__| |/ _` |/ _` | | | | ]],
        [[ | | | |  | | (_| | (_| | |_| | ]],
        [[ |_| |_|  |_|\__,_|\__,_|\__, | ]],
        [[     *                    __/ | ]],
        [[             +        *  |___/  ]],
    },
    },

    Saturday = {
    {
        [[            _        +        _              ]],
        [[    *      | |               | |             ]],
        [[  ___  __ _| |_ _   _ _ __ __| | __*_ _   _  ]],
        [[ / __|/ _` | __| | | | '__/ _` |/ _` | | | | ]],
        [[ \__ \ (_| | |_| |_| | | | (_| | (_| | |_| | ]],
        [[ |___/\__,_|\__|\__,_|_|  \__,_|\__,_|\__, | ]],
        [[                      *                __/ | ]],
        [[        +                            *|___/  ]],
    },
    {
        [[  +         _                 _       *      ]],
        [[           | |      +        | |             ]],
        [[  ___  __ _| |_ _   _ _ __ __| | __ _ _   _ *]],
        [[ / __|/ _` | __| | | | '__/ _` |/ _` | | | | ]],
        [[ \__ \ (_| | |_| |_| | | | (_| | (_| | |_| | ]],
        [[ |___/\__,_|\__|\__,_|_|  \__,_|\__,_|\__, | ]],
        [[            +                          __/ | ]],
        [[  *                          *        |___/  ]],
    },
    {
        [[            _                 _     *        ]],
        [[           | |       *       | |             ]],
        [[  ___  __*_| |_ _   _ _ __ __| | __ _ _ + _  ]],
        [[ / __|/ _` | __| | | | '__/ _` |/ _` | | | | ]],
        [[ \__ \ (_| | |_| |_| | | | (_| | (_| | |_| | ]],
        [[ |___/\__,_|\__|\__,_|_|  \__,_|\__,_|\__, | ]],
        [[  +                 *                  __/ | ]],
        [[                              +       |___/  ]],
    },
    },

    Sunday = {
    {
        [[  *                   _              ]],
        [[             *       | |      *      ]],
        [[  ___ _ + _ _ __  *__| | __ _ _   _  ]],
        [[ / __| | | | '_ \ / _` |/ _` | | | | ]],
        [[ \__ \ |_| | | | | (_| | (_| | |_| | ]],
        [[ |___/\__,_|_| |_|\__,_|\__,_|\__, | ]],
        [[              *                __/ | ]],
        [[   +                      *   |___/  ]],
    },
    {
        [[                    + _              ]],
        [[  +       *          | |             ]],
        [[  ___ _   _ _ __   __| | __ _ _ + _  ]],
        [[ / __| | | | '_ \ / _` |/ _` | | | | ]],
        [[ \__ \ |_| | | | | (_| | (_| | |_| | ]],
        [[ |___/\__,_|_| |_|\__,_|\__,_|\__, | ]],
        [[                  +           *__/ | ]],
        [[    *                         |___/  ]],
    },
    {
        [[             *        _            * ]],
        [[   +                 | |     *       ]],
        [[  ___ _   _ _ __   __| | __ _ _   _  ]],
        [[ / __| | | | '_ \ / _` |/ _` | | | | ]],
        [[ \__ \ |_| | | | | (_| | (_| | |_| | ]],
        [[ |___/\__,_|_| |_|\__,_|\__,_|\__, | ]],
        [[   +            *              __/ | ]],
        [[        *              +      |___/  ]],
    },
    }
}

return days_of_week
