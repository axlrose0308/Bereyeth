package util;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPCell;
import javafx.scene.control.Cell;
import model.Seminar;
import java.io.*;

public class PdfUtil {

    public static byte[] attendeeNamesPdf(String[] nameTags, Seminar seminar) {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        byte[] result = null;

        Document doc = new Document();
        /*
        PdfPTable table = new PdfPTable(new float[] { 10, 5, 10 });
        table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell("Name Tags");
        table.setHeaderRows(1);
        PdfPCell[] cells = table.getRow(0).getCells();
        */

        try {
            PdfWriter pw = PdfWriter.getInstance(doc, bos);

            doc.open();

            String header = "Attendees of Seminar " + seminar.getId() + " " + seminar.getSubject();
            doc.add(new Paragraph(header));
            List nameList = new List();
            for (int i = 0; i < nameTags.length; i++) {
                nameList.add(new ListItem(nameTags[i]));
                //cells[i].setBackgroundColor(BaseColor.GRAY);
                //table.addCell("Name" + i);
            }

            doc.add(nameList);
            doc.close(); //Document should be closed before getting the bytes.
            result = bos.toByteArray();
            bos.close();
            pw.close();

        } catch (DocumentException e) {

            e.printStackTrace();

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                bos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return result;
    }
}
