static const char norm_fg[] = "#96b7b6";
static const char norm_bg[] = "#0d0c10";
static const char norm_border[] = "#69807f";

static const char sel_fg[] = "#96b7b6";
static const char sel_bg[] = "#335B60";
static const char sel_border[] = "#96b7b6";

static const char urg_fg[] = "#96b7b6";
static const char urg_bg[] = "#344A4F";
static const char urg_border[] = "#344A4F";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
