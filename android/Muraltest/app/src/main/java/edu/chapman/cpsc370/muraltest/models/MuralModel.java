package edu.chapman.cpsc370.muraltest.models;

import java.util.HashMap;
import java.util.List;

import edu.chapman.cpsc370.muraltest.FIRListHelper;

public class MuralModel
{
    private String key;
    private String name;
    private String description;
    private HashMap<String, Boolean> tags;
    private HashMap<String, Boolean> artists;
    private HashMap<String, ImageModel> images;

    @SuppressWarnings("unused")
    public MuralModel() { }

    public String getDescription()
    {
        return this.description;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public List<ImageModel> getImages()
    {
        return FIRListHelper.ValueListFromMap(this.images);
    }

    public List<String> getArtistKeys()
    {
        return FIRListHelper.KeyListFromMap(this.artists);
    }
}
