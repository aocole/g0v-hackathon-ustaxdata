import org.gicentre.utils.stat.*;
Table table;
BarChart barChart;
String title;

void setup() {
  size(1280, 800);

  table = loadTable("11in32tt.csv");
  table.removeTokens(",");
}


// Draws the chart in the sketch
void draw()
{
  background(255);
  fill(0);
  stroke(255);
  int column_offset = int(float(mouseX)/width * 12) * 3;
  int income_level = 0;
  int num_returns = 1 + column_offset;
  int agi = 2 + column_offset;
  int total_income_tax = 3 + column_offset;
  barChart = new BarChart(this);
  int start_index = 3;
  float[] values = new float[table.getRowCount() - start_index];
  String[] labels = new String[table.getRowCount() - start_index];
  title = table.getRow(0).getString(column_offset + 1);
  for (int i = start_index; i < table.getRowCount(); ++i) {
    TableRow row = table.getRow(i);
    String income_level_val = row.getString(income_level);
    int num_returns_val = row.getInt(num_returns);
    float percentage_of_returns = float(num_returns_val) * 100 / row.getInt(1);
    int agi_val = row.getInt(agi);
    int total_income_tax_val = row.getInt(total_income_tax);
    values[i - start_index] = percentage_of_returns;
    labels[i - start_index] = income_level_val;
  }
  barChart.setMinValue(0);
  barChart.setMaxValue(100);
  barChart.setData(values);
  barChart.setBarLabels(labels);
  barChart.showCategoryAxis(true);
  barChart.transposeAxes(true);
  barChart.setBarColour(color(200,80,80));
  barChart.setBarGap(20);
  barChart.showValueAxis(true);
  barChart.draw(15,15,width-30,height-30); 

  textSize(20);
  text(title, 30,20);
  textSize(12);
}