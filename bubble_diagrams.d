import std.stdio;
import std.conv;

// Bubble types
// Type 1, Simple Pairs of Bubbles
// Type 2, Pair of Pairs

enum Relation {
    identity,
    addition,
    subtraction,
    multipl,
    add_inverse,
    multipl_inverse
}


class Bubble {
    private:
        int content;
        Relation relation;
        bool show = false;
        bool done = false;
        Bubble leg_i;
        Bubble leg_ii;

        this(int content, Relation relation){
            this.content = content;
            this.relation = relation;
        }
    public:
        void inspect(){
            final switch(this.relation){
                case Relation.addition:
                    writefln("Addition Bubble with Legs (%s, %s); Show is %s; Done is %s ", 
                            this.leg_i.content, this.leg_ii.content,
                            this.show, this.done);
                    break;
                case Relation.multipl:
                    writefln("Multiplication Bubble with Legs (%s, %s); Show is %s; Done is %s ", 
                            this.leg_i.content, this.leg_ii.content,
                            this.show, this.done);
                    break;
                case Relation.identity:
                    writefln("Identity Bubble with value %s: ", this.content);
                    break;
                case Relation.subtraction:
                    writeln("Subtraction Not implemented");
                    break;
                case Relation.add_inverse:
                    writeln("Add Inverse Documentation");
                    break;
                case Relation.multipl_inverse:
                    writeln("Multiplication Inverse Documentation");
                    break;
            }

        }

        void toggle_show(){
            this.show = !this.show;
        }

        void reset(){
            this.done = false;
        }

        void do_operation(){
            this.done = true;
            final switch (this.relation){

            case Relation.identity:
                this.reset();
                break;
            case Relation.addition:
                this.content = this.leg_i.content + this.leg_ii.content;
                break;
            case Relation.multipl:
                this.content = this.leg_i.content * this.leg_ii.content;
                break;
            case Relation.subtraction:
                writeln("Not implemented");
                break;
            case Relation.add_inverse:
                this.content = 0-this.content;
                break;
            case Relation.multipl_inverse:
                this.content = 1/this.content;
                break;
            }
        }

        void show_content(){
            if (this.show && this.done){
                writefln("Result is %s ", this.content);
            } else {
            writeln("You can't see the result yet! Try again."); 
            }
        }
}

class AdditionBubble : Bubble {
    private:

        this(int leg_i, int leg_ii){
            super(0, Relation.addition);
            // this.relation = Relation.addition;
            this.leg_i = new Bubble(leg_i, Relation.identity);
            this.leg_ii = new Bubble(leg_ii, Relation.identity);
        }

}

class MultiplicationBubble : Bubble {
    private:
        this(int leg_i, int leg_ii){
            super(0, Relation.multipl);
            this.leg_i = new Bubble(leg_i, Relation.identity);
            this.leg_ii = new Bubble(leg_ii, Relation.identity);
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
id_bubble_1.inspect();
id_bubble_2.inspect();

// explore Addition behavior

AdditionBubble add1c2 = new AdditionBubble(1, 2);
add1c2.show_content();
add1c2.toggle_show();
add1c2.show_content();
add1c2.do_operation();
add1c2.toggle_show();
add1c2.show_content();
add1c2.toggle_show();
add1c2.show_content();
add1c2.inspect();

// explore Multiplication behavior

MultiplicationBubble multipl2c3 = new MultiplicationBubble(2,3);
multipl2c3.show_content();
multipl2c3.toggle_show();
multipl2c3.show_content();
multipl2c3.do_operation();
multipl2c3.toggle_show();
multipl2c3.show_content();
multipl2c3.toggle_show();
multipl2c3.show_content();
multipl2c3.inspect();
}