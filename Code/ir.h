#ifndef _IR_H_
#define _IR_H_

typedef struct Operand_ *Operand;
typedef enum OP_TYPE {
	VARIABLE, CONSTANT, 
	ADDRESS, TEMP, 
	LABEL, 
	//&op or *op
	REF, DEREF
} OP_TYPE;
struct Operand_ {
	OP_TYPE kind;
	union {
		int var_no;
		int value;
		char *name;
		Operand op;
	};
	
};

typedef struct ArgList_* ArgList;
struct ArgList_ {
	Operand op;
	ArgList next;
};

typedef enum {
	IC_ASSIGN=1, IC_ADD,
	IC_SUB,	IC_MUL,
	IC_DIV,

	IC_DEC, IC_FUNCTION,
	IC_PARAM, IC_LABEL,
	IC_RETURN, IC_GOTO,
	IC_CALL, IC_ARG,

	//if op1 relop op2 goto rlt/label_true
	IC_JL,	IC_JG,	IC_JGE,	 
	IC_JLE,	IC_JE,	IC_JNE,

	//write & read
	IC_READ, IC_WRITE,
	
	//&x, *x
	IC_REF, IC_DEREF
} IC_TYPE;
struct InterCode{
	IC_TYPE kind;
	union {
		struct { Operand right, left;} assign;
		struct { Operand rlt, op1, op2;} binop;
	};
};
typedef struct InterCode InterCode;

struct InterCodes {
	struct InterCode code;
	struct InterCodes *prev, *next;
};
typedef struct InterCodes InterCodes;

InterCodes *addTail(InterCodes *head1, InterCodes *head2);
#define ADD_TAIL(head1, head2) head1 = addTail(head1, head2)
InterCodes *copyInterCodes(InterCodes *start, InterCodes *end);
void clearInterCodes(InterCodes *codes);

int newParm();
int newArg();
Operand newTemp();
Operand newLabel();
InterCodes *newInterCodes();
Operand newOperand();
Operand newOp(OP_TYPE type, unsigned long ptr);
InterCodes* newIC(IC_TYPE, Operand rlt1, Operand op1, Operand op2);
void deleteInterCodes(InterCodes *code);
void clearInterCodes(InterCodes *codes);
int compareOperand(Operand op1, Operand op2);

IC_TYPE getRelop(TreeNode *relop);

void printOperand(Operand op, FILE *fp);
int printInterCodes(InterCodes *codes, FILE *fp);


/*translate functions*/
InterCodes *generate_ir(TreeNode *root);

InterCodes *translate_Program(TreeNode *program);
InterCodes *translate_ExtDefList(TreeNode *extDefList);
InterCodes *translate_ExtDef(TreeNode *extDef);
InterCodes *translate_ExtDecList(TreeNode *extDecList);
InterCodes *translate_VarDec(TreeNode *varDec);
InterCodes *translate_FunDec(TreeNode *funDec);
InterCodes *translate_FunDec(TreeNode *funDec);
InterCodes *translate_DefList(TreeNode *defList);
InterCodes *translate_Def(TreeNode *def);
InterCodes *translate_DecList(TreeNode *decList);
InterCodes *translate_Dec(TreeNode *dec);
InterCodes *translate_StmtList(TreeNode *stmtList);
InterCodes *translate_CompSt(TreeNode *compSt);
InterCodes *translate_Stmt(TreeNode *stmt);
InterCodes *translate_Exp(TreeNode *exp, Operand place);

InterCodes *translate_Structure(TreeNode *st, Operand place, Type *type);
InterCodes *translate_Array(TreeNode *st, Operand place, Type *type);

InterCodes *translate_Cond(TreeNode *exp, Operand label1, Operand Label2);
InterCodes *translate_Args(TreeNode *args, ArgList *argList); 


#endif
