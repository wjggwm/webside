package com.webside.dtgrid.util;

import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import jxl.SheetSettings;
import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.commons.collections.MapUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.webside.dtgrid.model.Column;
import com.webside.dtgrid.model.Pager;
import com.webside.enums.ExportType;

/**
 * 导出工具类
 * @author 大连首闻科技有限公司
 * @since 2014-8-22 16:25:30
 */
public class ExportUtils {

	/**
	 * 导出
	 * 
	 * @param request
	 *            请求对象
	 * @param response
	 *            响应对象
	 * @param pager
	 *            GridPager对象
	 * @param exportDatas
	 *            导出的数据
	 * @param fileName
	 *            文件名
	 * @throws Exception
	 */
	public static void export(HttpServletResponse response, Pager pager)
			throws Exception {
		// 获取文件名
		String fileName = "datas";
		fileName = URLEncoder.encode(pager.getExportFileName(), "UTF-8");
		// 导出excel
		if (ExportType.EXCEL.getFileType().equals(pager.getExportType())) {
			ExportUtils.exportExcel(response, pager, pager.getExportDatas(),
					fileName);
			return;
		}
		// 导出cvs
		if (ExportType.CSV.getFileType().equals(pager.getExportType())) {
			ExportUtils.exportCsv(response, pager, pager.getExportDatas(),
					fileName);
			return;
		}
		// 导出txt
		if (ExportType.TXT.getFileType().equals(pager.getExportType())) {
			ExportUtils.exportTxt(response, pager, pager.getExportDatas(),
					fileName);
			return;
		}
		// 导出pdf
		if (ExportType.PDF.getFileType().equals(pager.getExportType())) {
			ExportUtils.exportPdf(response, pager, pager.getExportDatas(),
					fileName);
			return;
		}
	}

	/**
	 * 导出
	 * 
	 * @param request
	 *            请求对象
	 * @param response
	 *            响应对象
	 * @param pager
	 *            GridPager对象
	 * @param exportDatas
	 *            导出的数据
	 * @param fileName
	 *            文件名
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static void exportAll(HttpServletResponse response, Pager pager, List<?> list)
			throws Exception {
		List<Map<String, Object>> datas = new ArrayList<Map<String,Object>>();
		String json = JSON.toJSONString(list,SerializerFeature.WriteDateUseDateFormat);
		datas = JSON.parseObject(json, datas.getClass());
		pager.setExportDatas(datas);
		export(response,pager);
	}
	
	
	/**
	 * 导出Excel
	 * 
	 * @param request
	 *            请求对象
	 * @param response
	 *            响应对象
	 * @param pager
	 *            GridPager对象
	 * @param exportDatas
	 *            导出的数据
	 * @param fileName
	 *            文件名
	 * @throws Exception
	 */
	private static void exportExcel(HttpServletResponse response, Pager pager,
			List<Map<String, Object>> exportDatas, String fileName)
			throws Exception {
		// 设置响应头
		response.setContentType("application/vnd.ms-excel");
		// 执行文件写入
		response.setHeader("Content-Disposition", "attachment;filename="
				+ fileName + ".xls");
		// 获取输出流
		OutputStream outputStream = response.getOutputStream();
		// 定义Excel对象
		WritableWorkbook book = Workbook.createWorkbook(outputStream);
		// 创建Sheet页
		WritableSheet sheet = book.createSheet("数据", 0);
		// 冻结表头
		SheetSettings settings = sheet.getSettings();
		settings.setVerticalFreeze(1);
		// 定义表头字体样式、表格字体样式
		WritableFont headerFont = new WritableFont(
				WritableFont.createFont("Lucida Grande"), 9, WritableFont.BOLD);
		WritableFont bodyFont = new WritableFont(
				WritableFont.createFont("Lucida Grande"), 9,
				WritableFont.NO_BOLD);
		WritableCellFormat headerCellFormat = new WritableCellFormat(headerFont);
		WritableCellFormat bodyCellFormat = new WritableCellFormat(bodyFont);
		// 设置表头样式：加边框、背景颜色为淡灰、居中样式
		headerCellFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
		headerCellFormat.setBackground(Colour.PALE_BLUE);
		headerCellFormat.setAlignment(Alignment.CENTRE);
		headerCellFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
		// 设置表格体样式：加边框、居中
		bodyCellFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
		bodyCellFormat.setAlignment(Alignment.CENTRE);
		bodyCellFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
		// 判断一下表头数组是否有数据
		if (pager.getExportColumns() != null
				&& pager.getExportColumns().size() > 0) {
			// 循环写入表头
			int seq = 0;
			for (Column column : pager.getExportColumns()) {
				sheet.addCell(new Label(seq, 0, column.getTitle(),
						headerCellFormat));
				seq++;
			}
			// 判断表中是否有数据
			if (exportDatas != null && exportDatas.size() > 0) {
				// 循环写入表中数据
				for (int i = 0; i < exportDatas.size(); i++) {
					Map<String, Object> record = (Map<String, Object>) exportDatas
							.get(i);
					seq = 0;
					for (int j = 0; j < pager.getExportColumns().size(); j++) {
						Column column = pager.getExportColumns().get(j);
						String content = MapUtils.getString(record,
								column.getId());
						// 如果内容未被处理则进行格式化
						if (!pager.getExportDataIsProcessed()) {
							content = GridUtils.formatContent(column, content);
						}
						sheet.addCell(new Label(seq, i + 1, content,
								bodyCellFormat));
						seq++;
					}
				}
			}
			// 写入Excel工作表
			book.write();
			// 关闭Excel工作薄对象
			book.close();
			// 关闭流
			outputStream.flush();
			outputStream.close();
			outputStream = null;
		}
	}

	/**
	 * 导出Csv
	 * 
	 * @param request
	 *            请求对象
	 * @param response
	 *            响应对象
	 * @param pager
	 *            GridPager对象
	 * @param exportDatas
	 *            导出的数据
	 * @param fileName
	 *            文件名
	 * @throws Exception
	 */
	private static void exportCsv(HttpServletResponse response, Pager pager,
			List<Map<String, Object>> exportDatas, String fileName)
			throws Exception {
		// 设置响应头
		response.setContentType("application/CSV");
		// 执行文件写入
		response.setHeader("Content-Disposition", "attachment;filename="
				+ fileName + ".csv");
		// 定义文件内容
		StringBuffer buffer = new StringBuffer();
		// 判断一下表头数组是否有数据
		if (pager.getExportColumns() != null
				&& pager.getExportColumns().size() > 0) {
			// 循环写入表头
			for (int i = 0; i < pager.getExportColumns().size(); i++) {
				Column column = pager.getExportColumns().get(i);
				buffer.append(column.getTitle()).append(
						i == (pager.getExportColumns().size() - 1) ? "" : ",");
			}
			// 换行
			buffer.append("\n");
			// 判断表中是否有数据
			if (exportDatas != null && exportDatas.size() > 0) {
				// 循环写入表中数据
				for (int i = 0; i < exportDatas.size(); i++) {
					Map<String, Object> record = (Map<String, Object>) exportDatas
							.get(i);
					for (int j = 0; j < pager.getExportColumns().size(); j++) {
						Column column = pager.getExportColumns().get(j);
						String content = MapUtils.getString(record,
								column.getId());
						// 如果内容未被处理则进行格式化
						if (!pager.getExportDataIsProcessed()) {
							content = GridUtils.formatContent(column, content);
						}
						buffer.append("\"")
								.append(content)
								.append("\"")
								.append(j == (pager.getExportColumns().size() - 1) ? ""
										: ",");
					}
					// 换行
					buffer.append("\n");
				}
			}
		}
		// 以UTF-8字符集写入
		OutputStreamWriter writer = new OutputStreamWriter(
				response.getOutputStream(), "UTF-8");
		writer.write(new String(new byte[] { (byte) 0xEF, (byte) 0xBB,
				(byte) 0xBF }));
		writer.write(buffer.toString());
		writer.flush();
		writer.close();
	}

	/**
	 * 导出Txt
	 * 
	 * @param request
	 *            请求对象
	 * @param response
	 *            响应对象
	 * @param pager
	 *            GridPager对象
	 * @param exportDatas
	 *            导出的数据
	 * @param fileName
	 *            文件名
	 * @throws Exception
	 */
	private static void exportTxt(HttpServletResponse response, Pager pager,
			List<Map<String, Object>> exportDatas, String fileName)
			throws Exception {
		// 设置响应头
		response.setContentType("application/txt");
		// 执行文件写入
		response.setHeader("Content-Disposition", "attachment;filename="
				+ fileName + ".txt");
		// 定义文件内容
		StringBuffer buffer = new StringBuffer();
		// 判断一下表头数组是否有数据
		if (pager.getExportColumns() != null
				&& pager.getExportColumns().size() > 0) {
			// 循环写入表头
			for (int i = 0; i < pager.getExportColumns().size(); i++) {
				Column column = pager.getExportColumns().get(i);
				buffer.append(column.getTitle()).append(
						i == (pager.getExportColumns().size() - 1) ? "" : "\t");
			}
			// 换行
			buffer.append("\r\n");
			// 判断表中是否有数据
			if (exportDatas != null && exportDatas.size() > 0) {
				// 循环写入表中数据
				for (int i = 0; i < exportDatas.size(); i++) {
					Map<String, Object> record = (Map<String, Object>) exportDatas
							.get(i);
					for (int j = 0; j < pager.getExportColumns().size(); j++) {
						Column column = pager.getExportColumns().get(j);
						String content = MapUtils.getString(record,
								column.getId());
						// 如果内容未被处理则进行格式化
						if (!pager.getExportDataIsProcessed()) {
							content = GridUtils.formatContent(column, content);
						}
						buffer.append(content).append(
								j == (pager.getExportColumns().size() - 1) ? ""
										: "\t");
					}
					// 换行
					buffer.append("\r\n");
				}
			}
		}
		// 以UTF-8字符集写入
		OutputStreamWriter writer = new OutputStreamWriter(
				response.getOutputStream(), "UTF-8");
		writer.write(buffer.toString());
		writer.flush();
		writer.close();
	}

	/**
	 * 导出Pdf
	 * 
	 * @param request
	 *            请求对象
	 * @param response
	 *            响应对象
	 * @param pager
	 *            GridPager对象
	 * @param exportDatas
	 *            导出的数据
	 * @param fileName
	 *            文件名
	 * @throws Exception
	 */
	private static void exportPdf(HttpServletResponse response, Pager pager,
			List<Map<String, Object>> exportDatas, String fileName)
			throws Exception {
		// 设置响应头
		response.setContentType("application/pdf");
		// 执行文件写入
		response.setHeader("Content-Disposition", "attachment;filename="
				+ fileName + ".pdf");
		// 获取输出流
		OutputStream outputStream = response.getOutputStream();
		// 创建字体对象(STSong-Light，AdobeSongStd-Light-Acro，及STSongStd-Light-Acro是Acrobat的三种简体中文标准字体)
		BaseFont chinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H",
				BaseFont.NOT_EMBEDDED);
		Font headerFont = new Font(chinese, 9, Font.BOLD);
		Font bodyFont = new Font(chinese, 9, Font.NORMAL);
		// 设置PDF页面大小
		Rectangle rect = new Rectangle(PageSize.A4.rotate());
		// 创建写入对象
		Document document = new Document(rect);
		PdfWriter writer = PdfWriter.getInstance(document, outputStream);
		// 设置PDF版本(默认1.4)
		writer.setPdfVersion(PdfWriter.PDF_VERSION_1_2);
		// 设置文档属性
		document.addTitle("");
		document.addAuthor("");
		document.addSubject("");
		document.addKeywords("");
		document.addCreator("");
		// 页边空白
		document.setMargins(0, 0, 40, 40);
		// 打开文档对象
		document.open();
		// 计算表格列数
		int columnCount = pager.getExportColumns().size();
		// 创建表格
		PdfPTable table = new PdfPTable(columnCount);
		// 定义单元格用于写入数据
		PdfPCell cell;
		// 判断一下表头数组是否有数据
		if (pager.getExportColumns() != null
				&& pager.getExportColumns().size() > 0) {
			// 循环写入表头
			for (int i = 0; i < pager.getExportColumns().size(); i++) {
				Column column = pager.getExportColumns().get(i);
				// 赋值并设置背景色及居中
				cell = new PdfPCell(new Phrase(column.getTitle(), headerFont));
				cell.setBackgroundColor(BaseColor.CYAN);
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				cell.setVerticalAlignment(Element.ALIGN_CENTER);
				table.addCell(cell);
			}
			// 判断表中是否有数据
			if (exportDatas != null && exportDatas.size() > 0) {
				// 循环写入表中数据
				for (int i = 0; i < exportDatas.size(); i++) {
					Map<String, Object> record = (Map<String, Object>) exportDatas
							.get(i);
					for (int j = 0; j < pager.getExportColumns().size(); j++) {
						Column column = pager.getExportColumns().get(j);
						String content = MapUtils.getString(record,
								column.getId());
						// 如果内容未被处理则进行格式化
						if (!pager.getExportDataIsProcessed()) {
							content = GridUtils.formatContent(column, content);
						}
						// 赋值并居中
						cell = new PdfPCell(new Phrase(content, bodyFont));
						cell.setHorizontalAlignment(Element.ALIGN_CENTER);
						cell.setVerticalAlignment(Element.ALIGN_CENTER);
						table.addCell(cell);
					}
				}
			}
			// 写入PDF工作表
			document.add(table);
			// 关闭PDF文档工作薄对象
			document.close();
			// 关闭流
			outputStream.flush();
			outputStream.close();
			outputStream = null;
		}
	}

}