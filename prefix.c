#include <stdio.h>
#include <stdlib.h>

struct numop{
    char type;
    double num;
    char op;
};

struct list_node{
    struct numop* item;
    struct list_node* next;
};

void evaluate(struct list_node* head,struct list_node* eval);

struct list_node* nodemake(struct numop* key);
struct list_node* create_stack();
void push(struct list_node** head,struct numop* key);
struct numop* top(struct list_node* head);
struct numop* pop(struct list_node** head);
struct list_node* pop1(struct list_node** head);
int isEmpty(struct list_node* head);


int main(){
    struct list_node* head = create_stack();
    char a=getchar();
    while(a!=-1){
        if(a==' ') {a=getchar(); continue;}
        struct numop* key=(struct numop*)malloc(sizeof(struct numop));
        if((a=='+')||(a=='-')||(a=='*')||(a=='/')){
            key->type='o';
            key->op=a;
        }
        else{
            int d=a-'0';
            key->type='n';
            key->num=(double)(d);
            key->op='\0';
        }
        push(&head,key);
        a=getchar();
    }
    struct list_node* eval = create_stack();
    if(isEmpty(head)!=1) {evaluate(head,eval);}
    else {printf("0");}
    return 0;
}

void push(struct list_node** head, struct numop* key){
    struct list_node* node=(struct list_node*) malloc(sizeof(struct list_node));
    node->item = key;
    if(*head==NULL){
        *head = node;
    }
    else{
        node->next = *head;
        *head=node;
    }
}

struct numop* top(struct list_node* head){
    if(head==NULL){
        return NULL;
    }
    struct numop* link=head->item;
    return link;
}

struct numop* pop(struct list_node** head){
    if (isEmpty(*head)){
        return NULL;
    } 
    struct numop* link=(*head)->item;  
       *head=(*head)->next;
       return link;
}

struct list_node* nodemake(struct numop* key) { 
    struct list_node* node = (struct list_node*)malloc(sizeof(struct list_node)); 
    node->item = key;
    node->next = NULL; 
    return node; 
}

struct list_node* create_stack(){
    struct list_node* new_ptr = NULL;
    return new_ptr;
}

int isEmpty(struct list_node* head) { 
    if(head!=NULL) return 0;
    else return 1; 
}

void evaluate(struct list_node* head,struct list_node* eval){
    struct numop* data=(struct numop*)malloc(sizeof(struct numop));
    if(isEmpty(head)==1) {data=pop(&eval);}
    else {data=pop(&head);}
    push(&eval,data);
    double out;
    out=data->num;
    if((isEmpty(head)==1)&&(data->type=='n')) {
       printf("%lf\n",out);
    }
    else if(data->type=='o'){
        struct numop* data3=(struct numop*)malloc(sizeof(struct numop));
        data3=pop(&eval);
        struct numop* data1=(struct numop*)malloc(sizeof(struct numop));
        data1=pop(&eval);
        double n=data1->num;
        struct numop* data2=(struct numop*)malloc(sizeof(struct numop));
        data2=pop(&eval);
        double m=data2->num;
        if(data->op=='+'){
            struct numop* data_entry=(struct numop*)malloc(sizeof(struct numop));
            data_entry->num=n+m;
            data_entry->type='n';
            data_entry->op='\0';
            push(&eval,data_entry);
        }
        else if(data->op=='-'){
            struct numop* data_entry=(struct numop*)malloc(sizeof(struct numop));
            data_entry->num=n-m;
            data_entry->type='n';
            data_entry->op='\0';
            push(&eval,data_entry);
        }
        else if(data->op=='*'){
            struct numop* data_entry=(struct numop*)malloc(sizeof(struct numop));
            data_entry->num=n*m;
            data_entry->type='n';
            data_entry->op='\0';
            push(&eval,data_entry);
        }
        else if(data->op=='/'){
            struct numop* data_entry=(struct numop*)malloc(sizeof(struct numop));
            data_entry->num=n/m;
            data_entry->type='n';
            data_entry->op='\0';
            push(&eval,data_entry);
        }
        free(data1);
        free(data2);
        free(data3);
        evaluate(head,eval);
    }
    else{
        
        evaluate(head,eval);
    }
}
