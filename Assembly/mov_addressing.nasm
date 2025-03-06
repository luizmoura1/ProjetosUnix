| mov	| type?	| destination	| type?	| source|
 
| mov	| 	| register	| 	| register |
| mov	| 	| register	| 	| immediate |
| mov	| type	| memory	| 	| immediate |

A seguinte instrução não é permitida: 
| mov	| 	| memory	| 	| memory |
Mas pode ser feita das seguintes formas combinadas:
| mov	| 	| register	| (type)| memory |
| mov	| (type)| memory	| 	| register |

