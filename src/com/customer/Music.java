package com.customer;


import java.sql.Timestamp;

public class Music {
    private int id;
    private String title;
    private String description;
    private String filePath;
    private String imagePath;  // New field for image path
    private Timestamp uploadDate;

    public Music(int content_id, String title2, String des) {
        // TODO Auto-generated constructor stub
    }


	public Music() {
		// TODO Auto-generated constructor stub
	}

	// Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getImagePath() {  // Getter for image path
        return imagePath;
    }

    public void setImagePath(String imagePath) {  // Setter for image path
        this.imagePath = imagePath;
    }

    public Timestamp getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Timestamp uploadDate) {
        this.uploadDate = uploadDate;
    }
}