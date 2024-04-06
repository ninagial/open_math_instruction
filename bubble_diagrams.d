import std.stdio;
import std.conv;

// Bubble types
// Type 1, Simple Pairs of Bubbles
// Type 2, Pair of Pairs

enum Relation {
    identity,
    addition,
    multipl,
    add_inverse,
    multipl_inverse
}

class Bubble {
    int content;
    Relation relation;

    this(int content, Relation relation){
        this.content = content;
        this.relation = relation;
    }
}

class AdditionBubble : Bubble {
    bool show = false;
    bool done = false;
    // possibly use references here, esp when a db will do that in prod
    Bubble leg_i;
    Bubble leg_ii;
    
    this(int leg_i, int leg_ii){
        super(0, Relation.addition);
        this.relation = Relation.addition;
        this.leg_i = new Bubble(leg_i, Relation.identity);
        this.leg_ii = new Bubble(leg_ii, Relation.identity);
    }

    void toggle_show(){
        this.show = !this.show;
    }

    void do_add(){
        this.content = this.leg_i.content + this.leg_ii.content;
        this.done = true;
    }

    void show_content(){
        if (this.show && this.done){
            writefln("Result is %s ", this.content);
        } else {
           writeln("You can't see the result yet! Try again."); 
        }
    }
}

void main()
{
Bubble id_bubble_1 = new Bubble(1, Relation.identity);
Bubble id_bubble_2 = new Bubble(2, Relation.identity);

Bubble[10] natural_numbers;

for (int i=0;i<10;i++){
    Bubble bubble_i = new Bubble(i, Relation.identity);
    natural_numbers[i] = bubble_i;
}


// MyClass my_class_i = new MyClass(i, name_i);
//    idAndValues[i] = my_class_i;

writefln("%s %s", id_bubble_1.content, id_bubble_1.relation);
writefln("Array length is now %s", natural_numbers.length);

// explore Addition behavior

AdditionBubble add1c2 = new AdditionBubble(1, 2);
add1c2.show_content();
add1c2.toggle_show();
add1c2.show_content();
add1c2.do_add();
add1c2.toggle_show();
add1c2.show_content();
add1c2.toggle_show();
add1c2.show_content();
}