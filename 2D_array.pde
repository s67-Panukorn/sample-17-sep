int[][] grid = {{1, 2, 1, 3}, {3, 4, 1, 2}, {2, 1, 3, 4}};
int rows = grid.length;
int cols = grid[0].length;
int w = width/cols;
int h = height/rows;
boolean working = false;

void setup() {
    size(500, 500);
    strokeWeight(12);
    background(255);
    frameRate(60);
}

void draw(){
    if(working){
        main(grid);
    }
}

void main(int[][] a){
    int rows = a.length;
    int cols = a[0].length;
    int w = width/cols;
    int h = height/rows;

    int i = 0;
    while (i < rows) {

        int j = 0;
        while (j < cols) {
            
            draw_lines(j*w+25,i*h+25,grid[i][j]);
            println(i, j, " ", grid[i][j]);
            j++;
        }

        i++;
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
     if(working == false){
         working = true;
     } else {
         working = false;
     }
}
