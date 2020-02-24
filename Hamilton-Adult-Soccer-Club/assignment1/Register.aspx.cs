/*Author: Harris Moattar
 ID: 000775608
 Pupose: To process the logic of resister page button and on load.*/
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace assignment1
{
    public partial class Register : System.Web.UI.Page
    {
        /// <summary>
        /// Focus on the first name text box and set result leteral to blank.
        /// </summary>
        /// <param name="sender">Page</param>
        /// <param name="e">Event Data</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            resultLiteral.Text = "";
            firstNameTextBox.Focus();
        }

        /// <summary>
        /// Will check if it has been 18 years since the day of birth and proceed to insert the person from the web page
        /// if the person is older by using the person id collected from the database. 
        /// </summary>
        /// <param name="sender">Page</param>
        /// <param name="e">Event Data</param>
        protected void submitButton_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                DateTime.TryParse(birthDateTextBox.Text, out DateTime birthDate);

                // If older than 18 years then proceed to insert into database.
                if ((DateTime.Today - birthDate).TotalDays >= 365 * 18)
                {
                    try
                    {
                        // Set the connection string.
                        var hascConnectionString = WebConfigurationManager.ConnectionStrings["HASCConnectionString"].ConnectionString;

                        // Use the connection from the connection string.
                        using (SqlConnection connectDatabase = new SqlConnection(hascConnectionString))
                        {
                            // Set the setect command to get the highest person id.
                            var command = new SqlCommand("SELECT TOP 1 [person_id] FROM [persons] ORDER BY [person_id] DESC", connectDatabase);
                            
                            connectDatabase.Open();
                            
                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                // Initilize the new id which will hold the variable for the new to inser id.
                                var newID = 1;
                                while (reader.Read())
                                {
                                    newID = Int32.Parse(reader.GetValue(0).ToString()) + 1;
                                }
                                reader.Close();

                                // Insert the text fild values into the persons table.
                                command.CommandText = "INSERT INTO persons ([person_id], [first_name], [last_name], [division_id], [email], [birth_date]) VALUES(@person_id, @first_name, @last_name, @division_id, @email, @birth_date)";
                                command.Parameters.Add("@person_id", SqlDbType.Int).Value = newID;
                                command.Parameters.Add("@first_name", SqlDbType.VarChar);
                                command.Parameters["@first_name"].Value = firstNameTextBox.Text;
                                command.Parameters.Add("@last_name", SqlDbType.VarChar);
                                command.Parameters["@last_name"].Value = lastNameTextBox.Text;
                                command.Parameters.Add("@division_id", SqlDbType.Int).Value = divisionDropDownList.SelectedValue;
                                command.Parameters.Add("@email", SqlDbType.VarChar);
                                command.Parameters["@email"].Value = emailTextBox.Text;
                                command.Parameters.Add("@birth_date", SqlDbType.Date).Value = birthDate.ToShortDateString();
                                command.ExecuteNonQuery();

                                // Set the approval message.
                                resultLiteral.Text += "<p>Thank you for your interest. The club will be in touch shortly.</p>";

                                // Set every input item back to the original state
                                firstNameTextBox.Text = "";
                                lastNameTextBox.Text = "";
                                divisionDropDownList.SelectedIndex = 0;
                                emailTextBox.Text = "";
                                birthDateTextBox.Text = "";
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // Set the error message.
                        resultLiteral.Text += $"<p style=\"color:red;\">{ex.Message}</p>";
                    }
                }
                else
                {
                    // Set the age warning message.
                    resultLiteral.Text += "<p style=\"color:red;\">Applicant must be older than 18.</p>";
                    birthDateTextBox.Focus();
                }
            }
        }
    }
}