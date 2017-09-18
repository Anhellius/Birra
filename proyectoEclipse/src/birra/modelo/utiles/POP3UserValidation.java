
package birra.modelo.utiles;

import java.io.*;
import java.net.Socket;

public class POP3UserValidation
{

    public POP3UserValidation(){  }
  

    public static boolean checkUser(String user, String pass)
        throws IOException
    {
        Socket s = new Socket("claudia.inti.gob.ar", 110);
        BufferedReader in = new BufferedReader(new InputStreamReader(s.getInputStream()));
        BufferedWriter out = new BufferedWriter(new OutputStreamWriter(s.getOutputStream()));
        receive(in);
        send(out, (new StringBuilder("USER ")).append(user).toString());

        String resp = receive(in);
        if(resp.substring(0, 1).equals("-"))
            return false;
        send(out, (new StringBuilder("PASS ")).append(pass).toString());
        resp = receive(in);
        if(resp.substring(0, 1).equals("-"))
        {
            return false;
        } else
        {
            send(out, "QUIT");
            return true;
        }
    }

    private static void send(BufferedWriter out, String s)
        throws IOException
    {
        out.write((new StringBuilder(String.valueOf(s))).append("\n").toString());
        out.flush();
    }

    private static String receive(BufferedReader in)
        throws IOException
    {
        return in.readLine();
    }
}