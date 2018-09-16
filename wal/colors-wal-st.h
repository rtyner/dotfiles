const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0d0c10", /* black   */
  [1] = "#344A4F", /* red     */
  [2] = "#335B60", /* green   */
  [3] = "#386F70", /* yellow  */
  [4] = "#4A4A4E", /* blue    */
  [5] = "#5D605D", /* magenta */
  [6] = "#A56348", /* cyan    */
  [7] = "#96b7b6", /* white   */

  /* 8 bright colors */
  [8]  = "#69807f",  /* black   */
  [9]  = "#344A4F",  /* red     */
  [10] = "#335B60", /* green   */
  [11] = "#386F70", /* yellow  */
  [12] = "#4A4A4E", /* blue    */
  [13] = "#5D605D", /* magenta */
  [14] = "#A56348", /* cyan    */
  [15] = "#96b7b6", /* white   */

  /* special colors */
  [256] = "#0d0c10", /* background */
  [257] = "#96b7b6", /* foreground */
  [258] = "#96b7b6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
