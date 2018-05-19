#include "common.h"



InterCodes *addTail(InterCodes *head1, InterCodes *head2)
{
	if(NULL == head1) return head2;
	InterCodes *p = head1;
	while(NULL != p->next)
		p=p->next;
	p->next = head2;
	
	return head1;
}

void delInterCodes(InterCodes *code)
{
	//TODO:implement	
}

int newParm()
{
	static int cnt = 1;
	return cnt++;
}

int newArg()
{
	static int cnt = 1;
	return cnt++;
}

Operand newTemp()
{
	static int cnt = 1;
	Operand op = newOperand();
	op->kind = TEMP;
	op->value = cnt++;
	return op;
}

/*
int newTemp()
{
	static int cnt = 1;
	return cnt++;
}
*/

Operand newLabel()
{
	static int cnt = 1;
	Operand op = newOperand();
	op->kind = LABEL;
	op->value = cnt++;
	return op;
}

void printOperand(Operand op, FILE *fp)
{
	if(!op) {
		printf("null op\n");
		return ;
	}

	switch(op->kind) {
		case VARIABLE:
			fprintf(fp, "%s", op->name);
			break;
		case CONSTANT:
			fprintf(fp, "#%d", op->value);
			break;
		case TEMP:
			fprintf(fp, "t%d", op->value);
			break;
		case LABEL:
			fprintf(fp, "label%d", op->value);
			break;
		case REF:
			fprintf(fp, "&");
			printOperand(op->op, fp);
			break;
		case DEREF:
			fprintf(fp, "*");
			printOperand(op->op, fp);
			break;
		default:
			fprintf(fp, "%d", op->value);
	}
}

int printInterCodes(InterCodes *codes, FILE *fp)
{
	if(codes == NULL) {
		printf("null\n");
		return 0;
	}
	
	if(!fp)
		fp = stdout;

	int cnt = 0;
	while(codes) {
		switch(codes->code.kind) {
			case IC_ASSIGN:
				printOperand(codes->code.binop.rlt, fp);
				fprintf(fp, " := ");
				printOperand(codes->code.binop.op1, fp);
				break;
			case IC_ADD:
				printOperand(codes->code.binop.rlt, fp);
				fprintf(fp, " := ");
				printOperand(codes->code.binop.op1, fp);
				fprintf(fp, " + ");
				printOperand(codes->code.binop.op2, fp);
				break;
			case IC_SUB:
				printOperand(codes->code.binop.rlt, fp);
				fprintf(fp, " := ");
				printOperand(codes->code.binop.op1, fp);
				fprintf(fp, " - ");
				printOperand(codes->code.binop.op2, fp);
				break;
			case IC_MUL:
				printOperand(codes->code.binop.rlt, fp);
				fprintf(fp, " := ");
				printOperand(codes->code.binop.op1, fp);
				fprintf(fp, " * ");
				printOperand(codes->code.binop.op2, fp);
				break;
			case IC_DIV:
				printOperand(codes->code.binop.rlt, fp);
				fprintf(fp, " := ");
				printOperand(codes->code.binop.op1, fp);
				fprintf(fp, " / ");
				printOperand(codes->code.binop.op2, fp);
				break;
			case IC_DEC:
				fprintf(fp, "DEC ");
				printOperand(codes->code.binop.op1, fp);
				if(codes->code.binop.op2 != NULL)
					fprintf(fp, " %d", codes->code.binop.op2->value);
				break;
			case IC_FUNCTION:
				fprintf(fp, "FUNCTION %s :", codes->code.binop.op1->name);
				break;
			case IC_PARAM:
				fprintf(fp, "PARAM ");
				printOperand(codes->code.binop.op1, fp);
				break;
			case IC_LABEL:
				fprintf(fp, "LABEL ");
				printOperand(codes->code.binop.op1, fp);
				fprintf(fp, " :");
				break;
			case IC_RETURN:
				fprintf(fp, "RETURN ");
				printOperand(codes->code.binop.op1, fp);
				break;
			case IC_GOTO:
				fprintf(fp, "GOTO ");
				printOperand(codes->code.binop.op1, fp);
				break;
			case IC_JL:
				fprintf(fp, "IF ");
				printOperand(codes->code.binop.op1, fp);
				fprintf(fp, " < ");
				printOperand(codes->code.binop.op2, fp);
				fprintf(fp, " GOTO ");
				printOperand(codes->code.binop.rlt, fp);
				break;
			case IC_JG:
				fprintf(fp, "IF ");
				printOperand(codes->code.binop.op1, fp);
				fprintf(fp, " > ");
				printOperand(codes->code.binop.op2, fp);
				fprintf(fp, " GOTO ");
				printOperand(codes->code.binop.rlt, fp);
				break;
			case IC_JGE:
				fprintf(fp, "IF ");
				printOperand(codes->code.binop.op1, fp);
				fprintf(fp, " >= ");
				printOperand(codes->code.binop.op2, fp);
				fprintf(fp, " GOTO ");
				printOperand(codes->code.binop.rlt, fp);
				break;
			case IC_JLE:
				fprintf(fp, "IF ");
				printOperand(codes->code.binop.op1, fp);
				fprintf(fp, " <= ");
				printOperand(codes->code.binop.op2, fp);
				fprintf(fp, " GOTO ");
				printOperand(codes->code.binop.rlt, fp);
				break;
			case IC_JE:
				fprintf(fp, "IF ");
				printOperand(codes->code.binop.op1, fp);
				fprintf(fp, " == ");
				printOperand(codes->code.binop.op2, fp);
				fprintf(fp, " GOTO ");
				printOperand(codes->code.binop.rlt, fp);
				break;
			case IC_JNE:
				fprintf(fp, "IF ");
				printOperand(codes->code.binop.op1, fp);
				fprintf(fp, " != ");
				printOperand(codes->code.binop.op2, fp);
				fprintf(fp, " GOTO ");
				printOperand(codes->code.binop.rlt, fp);
				break;
			case IC_ARG:
				fprintf(fp, "ARG ");
				printOperand(codes->code.binop.op1, fp);
				break;
			case IC_CALL:
				printOperand(codes->code.binop.rlt, fp);
				fprintf(fp, " := CALL ");
				printOperand(codes->code.binop.op1, fp);
				break;
			case IC_READ:
				fprintf(fp, "READ ");	
				printOperand(codes->code.binop.op1, fp);
				break;
			case IC_WRITE:
				fprintf(fp, "WRITE ");
				printOperand(codes->code.binop.op1, fp);
				break;
			case IC_REF:
				printOperand(codes->code.binop.rlt, fp);
				fprintf(fp, " := &");
				printOperand(codes->code.binop.op1, fp);
				break;
			case IC_DEREF:
				printOperand(codes->code.binop.rlt, fp);
				fprintf(fp, " := *");
				printOperand(codes->code.binop.op1, fp);
				break;
			default:
				printf("code");
		}	
		fprintf(fp, "\n");
		cnt ++;
		codes = codes->next;
	}
	LOG("00");
	return cnt;
}

InterCodes *newInterCodes()
{
	InterCodes *codes = malloc(sizeof(struct InterCodes));
	memset(codes,0, sizeof(struct InterCodes));

	return codes;
}

Operand newOperand()
{
	Operand op = malloc(sizeof(struct Operand_));
	memset(op, 0, sizeof(struct Operand_));

	return op;
}

Operand newOp(OP_TYPE type, void *ptr)
{
	Operand op = malloc(sizeof(struct Operand_));
	memset(op, 0, sizeof(struct Operand_));
	op->kind = type;
	if(type == VARIABLE) 
		op->name = ptr;
	else if(type == REF || type == DEREF) 
		op->op = (Operand)ptr;
	else
		op->value = (int)ptr;

	return op;
}

InterCodes* newIC(IC_TYPE type, Operand rlt, Operand op1, Operand op2)
{
	InterCodes *codes = malloc(sizeof(struct InterCodes));
	memset(codes, 0, sizeof(struct InterCodes));
	codes->code.kind = type;
	codes->code.binop.rlt = rlt;
	codes->code.binop.op1 = op1;
	codes->code.binop.op2 = op2;
	
	return codes;
}

IC_TYPE getRelop(TreeNode *relop)
{
	ASSERT(relop->nType == T_Relop);
	
	char *ptr = relop->ptr;
	IC_TYPE type = IC_JE;
	if(strcmp(ptr, "<") == 0)		type = IC_JL;
	else if(strcmp(ptr, ">") == 0)	type = IC_JG;
	else if(strcmp(ptr, ">=") == 0)	type = IC_JGE;
	else if(strcmp(ptr, "<=") == 0)	type = IC_JLE;
	else if(strcmp(ptr, "==") == 0)	type = IC_JE;
	else if(strcmp(ptr, "!=") == 0)	type = IC_JNE;
	else ASSERT(0);
	return type;
}

InterCodes *generate_ir(TreeNode *root, FILE *fp)
{
	if(root == NULL)	return NULL;
	InterCodes *codes = translate_Program(root);
	
	printInterCodes(codes, fp);

	return codes;
}

InterCodes *translate_Program(TreeNode *program)
{
	ASSERT(program->nType == T_Program);	
	InterCodes *codes = translate_ExtDefList(program->childs[0]);
	return codes;
}

InterCodes *translate_ExtDefList(TreeNode *extDefList)
{
	if(NULL == extDefList)	return NULL;
	
	InterCodes *codes1 = translate_ExtDef(extDefList->childs[0]);
	InterCodes *codes2 = translate_ExtDefList(extDefList->childs[1]);
	
	codes1 = addTail(codes1, codes2);

	return codes1;
}

InterCodes *translate_ExtDef(TreeNode *extDef)
{
	TreeNode* child = extDef->childs[1];
	if(child->nType == T_ExtDecList) {
		return translate_ExtDecList(child);	
	}
	else if(child->nType == T_FunDec) {
		InterCodes *codes1 = translate_FunDec(child);
		InterCodes *codes2 =  translate_CompSt(extDef->childs[2]);
		codes1 = addTail(codes1, codes2);
		return codes1;
	}

	return NULL;
}

InterCodes *translate_ExtDecList(TreeNode *extDecList)
{
	InterCodes *codes = translate_VarDec(extDecList->childs[0]);		
	if(extDecList->nChild == 3) {
		InterCodes *codes2 = translate_ExtDecList(extDecList->childs[2]);
		codes = addTail(codes, codes2);
	}
	return codes; 
}

InterCodes *translate_VarDec(TreeNode *varDec)
{
	InterCodes *codes = NULL;
	char *name = varDec->childs[0]->ptr;
	Symbol sym = searchTable(name);
	ASSERT(sym != NULL);

	if(sym->kind == S_Type && sym->type->kind != BASIC) {
		int size = typeSize(sym->type);
		Operand op1 = newTemp();
		Operand op2 = NEW_OP(CONSTANT, size);
		InterCodes *code1 = newIC(IC_DEC, NULL, op1, op2);

		//TODO:improment
		Operand op3 = NEW_OP(VARIABLE, name);
		Operand op4 = NEW_OP(REF, op1);
		InterCodes *code2 = newIC(IC_ASSIGN, op3, op4, NULL);

		codes = ADD_TAIL(code1, code2);
	}
	
	return codes;
}

InterCodes *translate_FunDec(TreeNode *funDec)
{
	LOG("translate FunDec");
	char *name = funDec->childs[0]->ptr;
	Symbol sym = searchTable(funDec->childs[0]->ptr);
	ASSERT(sym != NULL && sym->kind == S_Func);
	
	InterCodes *codes = malloc(sizeof(struct InterCodes));
	memset(codes, sizeof(struct InterCodes), 0);
	codes->code.kind = IC_FUNCTION;
	codes->code.binop.op1 = malloc(sizeof(struct Operand_));
	codes->code.binop.op1->kind = VARIABLE;
	codes->code.binop.op1->name = name;
	codes->code.binop.op2 = NULL;

	InterCodes *argListCodes = NULL;
	FieldList argList = sym->func->argList;
	for(; argList; argList=argList->tail) {
		InterCodes *a = newInterCodes();	
		a->code.kind = IC_PARAM;
		Operand op = newOperand();
		op->kind = VARIABLE;
		op->name = argList->name;
		a->code.binop.op1 = op;
		argListCodes = addTail(argListCodes, a);
	}
	codes = addTail(codes, argListCodes);
	
	//InterCodes *argListCodes = translate_VarList(funDec->childs[2]);
	//codes = addTail(codes, argListCodes);
	LOG("leave FunDec");
	printInterCodes(codes, NULL);
	return codes;
}

InterCodes *translate_VarList(TreeNode *varList)
{
	
	return NULL;
}

InterCodes *translate_CompSt(TreeNode *compSt)
{
	LOG("translate COmpSt");
	InterCodes *codes1 = translate_DefList(compSt->childs[1]);
	InterCodes *codes2 = translate_StmtList(compSt->childs[2]);

	codes1 = addTail(codes1, codes2);

	LOG("leave COmpSt");
	printInterCodes(codes1, NULL);
	return codes1;
}

InterCodes *translate_DefList(TreeNode *defList)
{
	if(defList == NULL) return NULL;

	InterCodes *codes1 = translate_Def(defList->childs[0]);
	InterCodes *codes2 = translate_DefList(defList->childs[1]);
	codes1 = addTail(codes1, codes2);

	return codes1;
}

InterCodes *translate_Def(TreeNode *def)
{
	return translate_DecList(def->childs[1]);
}

InterCodes *translate_DecList(TreeNode *decList)
{
	InterCodes *codes = translate_Dec(decList->childs[0]);	
	if(decList->nChild == 3) {
		InterCodes *codes1 = translate_DecList(decList->childs[2]);
		codes = addTail(codes, codes1);
	}

	return codes;
}

InterCodes *translate_Dec(TreeNode *dec)
{
	InterCodes *codes = translate_VarDec(dec->childs[0]);
	if(dec->nChild == 3) {
		//InterCodes *codes1 = translate_Exp(dec->childs[2]);
		//
	}

	return codes;
}

InterCodes *translate_StmtList(TreeNode *stmtList)
{
	if(stmtList == NULL) return NULL;

	InterCodes *codes1 = translate_Stmt(stmtList->childs[0]);
	InterCodes *codes2 = translate_StmtList(stmtList->childs[1]);
	codes1 = addTail(codes1, codes2);

	return codes1;
}

InterCodes *translate_Stmt(TreeNode *stmt)
{
	LOG("translate Stmt");
	printTree(stmt);
	TreeNode* child = stmt->childs[0];
	InterCodes *codes = NULL;
	if(child->nType == T_Exp) {
		//FIXME
		codes = translate_Exp(child, NULL);	
	}
	else if(child->nType == T_CompSt) {
		codes = translate_CompSt(child);
	}
	else if(child->nType == T_Return) {
		Operand t1 = newTemp();
		InterCodes *code1 = translate_Exp(stmt->childs[1], t1);
		InterCodes *code2 = newIC(IC_RETURN, NULL, t1, NULL);
		codes = addTail(code1, code2);
	}
	else if(child->nType == T_If && stmt->nChild == 5) {
		Operand label1 = newLabel();
		Operand label2 = newLabel();
		InterCodes *code1 = translate_Cond(stmt->childs[2], label1, label2);
		InterCodes *code2 = translate_Stmt(stmt->childs[4]);
		
		InterCodes *code3 = newIC(IC_LABEL, NULL, label1, NULL);
		InterCodes *code4 = newIC(IC_LABEL, NULL, label2, NULL);
		
		code2 = addTail(code2, code4);
		code3 = addTail(code3, code2);
		code1 = addTail(code1, code3);
		codes = code1;
	}
	else if(child->nType == T_If && stmt->nChild == 7) {
		Operand label1 = newLabel();
		Operand label2 = newLabel();
		Operand label3 = newLabel();
		InterCodes *code1 = translate_Cond(stmt->childs[2], label1, label2);
		InterCodes *code2 = translate_Stmt(stmt->childs[4]);
		InterCodes *code3 = translate_Stmt(stmt->childs[6]);
	
					
		InterCodes *code4 = newIC(IC_LABEL, NULL, label1, NULL);
		InterCodes *code5 = newIC(IC_GOTO, NULL, label3, NULL);
		InterCodes *code6 = newIC(IC_LABEL, NULL, label2, NULL);
		InterCodes *code7 = newIC(IC_LABEL, NULL, label3, NULL);
		
		code3 = addTail(code3, code7);
		code6 = addTail(code6, code3);
		code5 = addTail(code5, code6);
		code2 = addTail(code2, code5);
		code4 = addTail(code4, code2);
		code1 = addTail(code1, code4);
		codes = code1;
	}
	else if(child->nType == T_While) {
		Operand label1 = newLabel();
		Operand label2 = newLabel();
		Operand label3 = newLabel();
		InterCodes *code1 = translate_Cond(stmt->childs[2], label2, label3);
		InterCodes *code2 = translate_Stmt(stmt->childs[4]);
		
		InterCodes *code3 = newIC(IC_LABEL, NULL, label1, NULL);
		InterCodes *code4 = newIC(IC_LABEL, NULL, label2, NULL);
		InterCodes *code5 = newIC(IC_GOTO, NULL, label1, NULL);
		InterCodes *code6 = newIC(IC_LABEL, NULL, label3, NULL);

		code5 = addTail(code5, code6);
		code2 = addTail(code2, code5);
		code4 = addTail(code4, code2);
		code1 = addTail(code1, code4);
		code3 = addTail(code3, code1);
		codes = code3;
	}

	LOG("leave Stmt");
	printInterCodes(codes, NULL);
	return codes;
}

InterCodes *translate_Exp(TreeNode *exp, Operand place)
{
	LOG("translate Exp");
	printTree(exp);
	TreeNode *first = exp->childs[0];
	TreeNode *second = exp->childs[1];
	TreeNode *third = exp->childs[2];
	InterCodes *codes = NULL;
	if(first->nType == T_Exp && second->nType == T_Assignop) {
		if(first->childs[0]->nType == T_Id) {
			char *name = first->childs[0]->ptr;
			Symbol sym = searchTable(name);
			ASSERT(sym);

			Operand t1 = newTemp();
			InterCodes *codes1 = translate_Exp(third, t1);
		
			InterCodes *codes2 = newInterCodes();
			codes2->code.kind = IC_ASSIGN;
			Operand left = newOperand();
			left->kind = VARIABLE;
			left->name = name;
			codes2->code.binop.rlt = left;
			codes2->code.binop.op1 = t1;

			if(place != NULL) {
				InterCodes *codes3 = newIC(IC_ASSIGN, place, left, NULL);	
				codes2 = addTail(codes2, codes3);
			}
			codes = addTail(codes1, codes2);
		}
		else if(first->childs[0]->nType == T_Exp && first->childs[1]->nType == T_Dot) {
			/*TODO: exp1.exp2 := exp3*/
			char *name = first->childs[0]->childs[0]->ptr;	
			Symbol sym = searchTable(name);
			ASSERT(sym && sym->kind == S_Type && sym->type->kind == STRUCTURE);

			//for exp1 may be a array or structure 
			Operand t1 = newTemp();
			InterCodes *code1 = translate_Exp(first->childs[0], t1);	
			
			int offset = 0;
			char *fieldName = first->childs[2]->ptr;
			FieldList list = sym->type->structure;
			while(list && safe_strcmp(list->name, fieldName) != 0) {
				offset += typeSize(list->type);
				list = list->tail;
			}
			ASSERT(list);
			
			Operand t2 = newTemp();
			Operand op1 = NEW_OP(CONSTANT, offset);
			InterCodes *code2 = newIC(IC_ADD, t2, t1, op1);
			
			Operand t3 = newTemp();
			InterCodes *code3 = translate_Exp(third, t3);

			Operand t4 = NEW_OP(DEREF, t2);
			InterCodes *code4 = newIC(IC_ASSIGN, t4, t3, NULL);

			if(place != NULL) {
				InterCodes *code5 = newIC(IC_ASSIGN, place, t4, NULL);
				ADD_TAIL(code4, code5);
			}
			ADD_TAIL(code3, code4);
			ADD_TAIL(code2, code3);
			codes = ADD_TAIL(code1, code2);
		}
		else if(first->childs[0]->nType == T_Exp && first->childs[1]->nType == T_Lb) {
			/*TODO:exp -> exp lb exp lb*/
			if(first->nChild == 4 && first->childs[1]->nType == T_Lb) {
				printf("Cannot translate: Code contains variables of multi-dimensional array type or parameters of array type\n");
				ASSERT(0);
			}

			Operand t1 = newTemp();	
			InterCodes *code1= translate_Exp(first, t1);
			
			Operand t2 = newTemp();
			InterCodes *code2 = translate_Exp(third, t2);
			
			//int elemSize = typeSize();
		}
		else {
			ASSERT(0);
		}
	}	
	else if(first->nType == T_Exp && second->nType == T_Plus) {
		Operand t1 = newTemp();
		Operand t2 = newTemp();
		InterCodes *codes1 = translate_Exp(first, t1);	
		InterCodes *codes2 = translate_Exp(third, t2);

		InterCodes *codes3 = newInterCodes();
		codes3->code.kind = IC_ADD;
		codes3->code.binop.op1 = t1;
		codes3->code.binop.op2 = t2;
		codes3->code.binop.rlt = place;

		codes2 = addTail(codes2, codes3);
		codes1 = addTail(codes1, codes2);
		codes = codes1;
	}
	else if(first->nType == T_Exp && second->nType == T_Minus) {
		Operand t1 = newTemp();
		Operand t2 = newTemp();
		InterCodes *code1 = translate_Exp(first, t1);	
		InterCodes *code2 = translate_Exp(third, t2);
		
		InterCodes *code3 = newIC(IC_SUB, place, t1, t2);

		code2 = addTail(code2, code3);
		code1 = addTail(code1, code2);
		codes = code1;
	}
	else if(first->nType == T_Exp && second->nType == T_Star) {
		Operand t1 = newTemp();
		Operand t2 = newTemp();
		InterCodes *code1 = translate_Exp(first, t1);	
		InterCodes *code2 = translate_Exp(third, t2);
		
		InterCodes *code3 = newIC(IC_MUL, place, t1, t2);

		code2 = addTail(code2, code3);
		code1 = addTail(code1, code2);
		codes = code1;
	}
	else if(first->nType == T_Exp && second->nType == T_Div) {
		Operand t1 = newTemp();
		Operand t2 = newTemp();
		InterCodes *code1 = translate_Exp(first, t1);	
		InterCodes *code2 = translate_Exp(third, t2);
		
		InterCodes *code3 = newIC(IC_DEC, place, t1, t2);

		code2 = addTail(code2, code3);
		code1 = addTail(code1, code2);
		codes = code1;
	}
	else if(first->nType == T_Lp) {
		codes = translate_Exp(second, place);
	}
	else if(first->nType == T_Minus) {
		Operand t1 = newTemp();
		InterCodes *code1 = translate_Exp(second, t1);
		
		Operand op1 = NEW_OP(CONSTANT, 0);
		InterCodes *code2 = newIC(IC_SUB, place, op1, t1);
		
		code1 = addTail(code1, code2);
		codes = code1;
	}
	else if(first->nType == T_Not 
			|| first->nType == T_Exp 
				&& (second->nType == T_And 
					|| second->nType == T_Or
					|| second->nType == T_Relop)) {
		Operand label1 = newLabel();
		Operand label2 = newLabel();

		Operand op1 = newOp(CONSTANT, 0);
		InterCodes *code0 = newIC(IC_ASSIGN, place, op1, NULL);
		InterCodes *code1 = translate_Cond(exp, label1, label2);

		InterCodes *code2 = newIC(IC_LABEL, NULL, label1, NULL);
		Operand op2 = NEW_OP(CONSTANT, 1);
		InterCodes *code3 = newIC(IC_ASSIGN, place, op2, NULL);
		code2 = addTail(code2, code3);

		InterCodes *code4 = newIC(IC_LABEL, NULL, label2, NULL);
		code2 = addTail(code2, code4);
		code1 = addTail(code1, code2);
		code0 = addTail(code0, code1);
		codes = code0;
	}
	else if(first->nType == T_Id && exp->nChild == 1) {
		Symbol sym = searchTable(first->ptr);
		ASSERT(sym != NULL);

		Operand op1 = place;
		Operand op2 = newOperand();
		op2->kind = VARIABLE;
		op2->name = sym->name;
		codes = newInterCodes();
		codes->code.kind = IC_ASSIGN;
		codes->code.binop.rlt = op1;
		codes->code.binop.op1 = op2;
	}
	else if(first->nType == T_Id && second && exp->nChild == 3) {
		Symbol sym = searchTable(first->ptr);
		ASSERT(sym);
		
		if(strcmp(sym->name, "read") == 0) {
			InterCodes *code1 = newIC(IC_READ, NULL, place, NULL);
			codes = code1;
		}
		else {
			Operand op1 = newOp(VARIABLE, sym->name);
			InterCodes *code1 = newIC(IC_CALL, place, op1, NULL);
			codes = code1;
		}
	}
	else if(first->nType == T_Id && second && exp->nChild == 4) {
		Symbol sym = searchTable(first->ptr);
		ASSERT(sym);
		
		ArgList argList = NULL;
		InterCodes *code1 = translate_Args(exp->childs[2], &argList);	
		if(strcmp(sym->name, "write") == 0) {
			InterCodes *code2 = newIC(IC_WRITE, NULL, argList->op, NULL);
			code1 = addTail(code1, code2);
		}
		else {
			ArgList p = argList;
			InterCodes *code2 = NULL;
			for(; p; p=p->next) {
				InterCodes *code3 = newIC(IC_ARG, NULL, p->op, NULL);
				code2 = addTail(code2, code3);
			}
			Operand op1 = NEW_OP(VARIABLE, sym->name);
			InterCodes *code3 = newIC(IC_CALL, place, op1, NULL);
			code2 = addTail(code2, code3);
			code1 = addTail(code1, code2);
		}
		codes = code1;
	}
	else if(first->nType == T_Int) {
		Operand op2 = place;
		Operand op1 = newOperand();
		op1->kind = CONSTANT;
		op1->value = first->iValue;
		codes = newInterCodes();
		codes->code.kind = IC_ASSIGN;
		codes->code.assign.left = op1;
		codes->code.assign.right = op2;
	}
	else if(first->nType == T_Float) {
		ASSERT(0);	
	}
	else if(first->nType == T_Exp && second->nType == T_Dot) {
		//TODO:3.1	
		Symbol sym = searchTable(first->childs[0]->ptr);	
		ASSERT(sym && sym->kind == S_Type && sym->type->kind == STRUCTURE);

		ASSERT(third->nType == T_Id);
		char *fieldName = third->ptr;
		FieldList list = sym->type->structure;

		int offset = 0;
		while(list && safe_strcmp(list->name, fieldName) != 0) {
			offset += typeSize(list->type);
			list = list->tail;
		}
		ASSERT(list);

		//tmp1 := offset;
		Operand op1 = NEW_OP(CONSTANT, offset);
		Operand op2 = newTemp();
		InterCodes *code1 = newIC(IC_ASSIGN, op2, op1, NULL);		
		
		//tmp2 := st + tmp1;
		Operand op3 = NEW_OP(VARIABLE, sym->name);
		Operand op4 = newTemp();
		InterCodes *code2 = newIC(IC_ADD, op4, op3, op2);
		
		//place := *tmp2;
		InterCodes *code3 = newIC(IC_DEREF, place, op4, NULL);
		
		code2 = addTail(code2, code3);
		code1 = addTail(code1, code2);
		codes = code1;
	}
	else {
		ASSERT(0);
	}
			
	LOG("leave Exp");
	printInterCodes(codes, NULL);
	return codes;
}

InterCodes *translate_Args(TreeNode *args, ArgList *argList) 
{
	Operand t1 = newTemp();	
	InterCodes *code1 = translate_Exp(args->childs[0], t1);
	//FIXME
	ArgList node = malloc(sizeof(struct ArgList_));
	node->op = t1;
	node->next = NULL;
	
	if(*argList == NULL) {
		*argList = node;
	}
	else {
		node->next = *argList;
		*argList = node;
	}

	if(args->nChild == 3) {
		InterCodes *code2 = translate_Args(args->childs[2], argList);
		code1 = addTail(code1, code2);
	}
	return code1;
}

InterCodes *translate_Cond(TreeNode *exp, Operand label_true, Operand label_false)
{
	LOG("translate Cond");
	ASSERT(exp && exp->nType == T_Exp);

	InterCodes *codes = NULL;
	TreeNode *child = exp->childs[0];
	if(child->nType == T_Exp && exp->childs[1]->nType == T_Relop) {
		Operand t1 = newTemp();
		Operand t2 = newTemp();
		InterCodes *code1 = translate_Exp(exp->childs[0], t1);
		InterCodes *code2 = translate_Exp(exp->childs[2], t2);
			
		LOG("1");
		IC_TYPE op = getRelop(exp->childs[1]);	
		LOG("1");
		InterCodes *code3 = newIC(op, label_true, t1, t2);
		InterCodes *code4 = newIC(IC_GOTO, NULL, label_false, NULL);
		LOG("1");
		
		code3 = addTail(code3, code4);
		code2 = addTail(code2, code3);
		code1 = addTail(code1, code2);
		codes = code1;
	}
	else if(child->nType == T_Exp && exp->childs[1]->nType == T_And) {
		Operand label1 = newLabel();
		InterCodes *code1 = translate_Cond(exp->childs[0], label1, label_false);
		InterCodes *code2 = translate_Cond(exp->childs[2], label_true, label_false);

		InterCodes *code3 = newIC(IC_LABEL, NULL, label1, NULL);
		code3 = addTail(code3, code2);
		code1 = addTail(code1, code3);
		codes = code1;
	}
	else if(child->nType == T_Exp && exp->childs[1]->nType == T_And) {
		Operand label1 = newLabel();
		InterCodes *code1 = translate_Cond(exp->childs[0], label_true, label1);
		InterCodes *code2 = translate_Cond(exp->childs[2], label_true, label_false);

		InterCodes *code3 = newIC(IC_LABEL, NULL, label1, NULL);
		code3 = addTail(code3, code2);
		code1 = addTail(code1, code3);
		codes = code1;
	}
	else if(child->nType == T_Not) {
		codes = translate_Cond(exp, label_false, label_true);
	}
	else {
		Operand t1 = newTemp();
		InterCodes *code1 = translate_Exp(exp, t1);

		Operand op1 = NEW_OP(CONSTANT, 0);
		InterCodes *code2 = newIC(IC_JNE, label_true, t1, op1);
		InterCodes *code3 = newIC(IC_GOTO, NULL, label_false, NULL);
		
		code2 = addTail(code2, code3);
		code1 = addTail(code1, code2);
		codes = code1;
	}

	LOG("leave Cond");
	printInterCodes(codes, NULL);
	return codes;	
}
