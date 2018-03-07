class InitializeStatuses < ActiveRecord::Migration[5.1]
  def change
    Status.create(name: "New", style:  "background-color:#E0F8F7;")
    Status.create(name: "Waiting Feedback", style: "background-color: #D7DF01;")
    Status.create(name: "Submitted Info", style: "background-color: #04B4AE;")
    Status.create(name: "Call Screen Scheduled", style: "background-color: #81F79F;")
    Status.create(name: "Interview Scheduled", style: "background-color: #298A08;")
    Status.create(name: "Deactivated", style: "background-color: #F5A9A9;")
    Status.create(name: "Dead Lead", style: "background-color: #424242;color:#999;")
    Status.create(name: "Not Accepted", style: "background-color: #000000;color: #900;")
    Status.create(name: "Hired", style: "background-color: #81F79F; color:#666666;")
    Status.create(name: "Resigned", style: "background-color: #B00100;color:#ffffff;")
  end
end
