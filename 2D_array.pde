int[][] grid = {{1, 2, 1, 3}, {3, 4, 1, 2}, {3, 1, 3, 4}};
int[][] data = {new int[4], new int[4], new int[4]};
int[] correct_bg = {};
int[] first_select = {0, 0};
int[] second_select = {0, 0};
int rows = grid.length;
int cols = grid[0].length;
int w = width/cols;
int h = height/rows;
int xPos = 0;
int yPos = 0;
boolean show_incorrect = false;
int show_time = 0;

void setup() {
    size(500, 500);
    strokeWeight(12);
    background(255);
    frameRate(60);
    w = width/cols;
    h = height/rows;
}

void draw(){
    background(255);
    draw_correctBG();
    int i = 0;
    while (i < rows) {
        int j = 0;
        while (j < cols) {
            draw_lines(j*w+25,i*h+25,data[i][j]);
            j++;
        }
        i++;
    }
    
    if(show_incorrect){
        if(show_time+500 < millis()){
            data[first_select[1]-1][first_select[0]-1] = 0;
            data[second_select[1]-1][second_select[0]-1] = 0;
            reset_select();
            show_incorrect = false;
        }
    }
}

void draw_lines(int x , int y , int n ){
    
    int i = 0;
    while(i < n){
        line(x + i*20,y,x +i*20,y+40);
        i++;
    }
}

void mouseClicked(){
    
    xPos = floor(mouseX/w)+1;
    yPos = floor(mouseY/h)+1;
    
    if (first_select[0] == 0 && first_select[1] == 0){
        first_select[0] = xPos;
        first_select[1] = yPos;
        data[first_select[1]-1][first_select[0]-1] = grid[first_select[1]-1][first_select[0]-1];
    }
    else if (first_select[0] != 0 && first_select[1] != 0 && second_select[0] == 0 && second_select[1] == 0){
        second_select[0] = xPos;
        second_select[1] = yPos;
        data[second_select[1]-1][second_select[0]-1] = grid[second_select[1]-1][second_select[0]-1];
        check_match(first_select, second_select);
    }
    
    
}

void check_match(int[] first, int[] second){
    if(data[first[1]-1][first[0]-1] == data[second[1]-1][second[0]-1]){
        correct_bg = append(correct_bg,first_select[0]-1);
        correct_bg = append(correct_bg,first_select[1]-1);
        correct_bg = append(correct_bg,second_select[0]-1);
        correct_bg = append(correct_bg,second_select[1]-1);
        println(correct_bg.length);
        reset_select();
        
    }
    else if (data[first[1]-1][first[0]-1] != data[second[1]-1][second[0]-1]){
        println(data[first[1]-1][first[0]-1], data[second[1]-1][second[0]-1]);
        show_time = millis();
        show_incorrect = true;
    }
}

void reset_select(){
    int i = 0;
    while(i<2){
        first_select[i] = 0;
        second_select[i] = 0;
        i++;
    }
}

void draw_correctBG(){
    pushStyle();
    int i = 0;
    while (i < correct_bg.length){
        fill(#56A742);
        noStroke();
        rect((correct_bg[i])*w, (correct_bg[i+1])*h, w, h);
        i += 2;
    }
    popStyle();
}
