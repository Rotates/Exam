package org.liao.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * Created by liao on 16-12-30.
 */

public class ExcelUtil {

    /**
     * @Title: getWeebWork
     * @Description: TODO(根据传入的文件名获取工作簿对象(Workbook))
     * @param filename
     * @return
     * @throws IOException
     */
    public static Workbook getWeebWork(String filename) throws IOException {
        Workbook workbook = null;
        if (null != filename) {
            String fileType = filename.substring(filename.lastIndexOf("."),
                    filename.length());
            FileInputStream fileStream = new FileInputStream(new File(filename));
            if (".xls".equals(fileType.trim().toLowerCase())) {
                workbook = new HSSFWorkbook(fileStream);// 创建 Excel 2003 工作簿对象
            } else if (".xlsx".equals(fileType.trim().toLowerCase())) {
                workbook = new XSSFWorkbook(fileStream);// 创建 Excel 2007 工作簿对象
            }
        }
        return workbook;
    }


    public static List<String> readFromExcelDemo(String fileAbsolutePath)
            throws IOException {
        /**
         * 读取Excel表中的所有数据
         */
        Workbook workbook = getWeebWork(fileAbsolutePath);
        System.out.println("总表页数为：" + workbook.getNumberOfSheets());// 获取表页数
        Sheet sheet = workbook.getSheetAt(0);
        List<String> numbers=new ArrayList<String>();
        // Sheet sheet = workbook.getSheetAt(1);
        int rownum = sheet.getLastRowNum();// 获取总行数
        for (int i = 0; i <= rownum; i++) {
            Row row = sheet.getRow(i);
            for (int j = 0; j < row.getLastCellNum(); j++) {
                Cell celldata = row.getCell(j);
                DecimalFormat df = new DecimalFormat("0");
                String number = df.format(celldata.getNumericCellValue());
                numbers.add(String.valueOf(number));
            }
        }
        return numbers;
    }
}
