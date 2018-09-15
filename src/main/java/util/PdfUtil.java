package util;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfWriter;
import model.Seminar;

import java.io.ByteArrayOutputStream;
import java.io.IOException;


public class PdfUtil {

    public static byte[] attendeeNamesPdf(String[] nameTags, Seminar seminar) {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        byte[] result = null;

        Document doc = new Document();

        try {
            PdfWriter pw = PdfWriter.getInstance(doc, bos);

            doc.open();

            String header = "Attendees of Seminar " + seminar.getId() + " " + seminar.getSubject();
            doc.add(new Paragraph(header));
            List nameList = new List();
            for (int i = 0; i < nameTags.length; i++) {
                nameList.add(new ListItem(nameTags[i]));
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
