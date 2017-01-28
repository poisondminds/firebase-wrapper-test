package edu.chapman.cpsc370.muraltest.models;

import com.google.firebase.database.ValueEventListener;

import java.util.HashMap;
import java.util.List;

import edu.chapman.cpsc370.muraltest.FIRListHelper;
import edu.chapman.cpsc370.muraltest.FIRQueryHelper;
import edu.chapman.cpsc370.muraltest.ModelValueEventListener;
import edu.chapman.cpsc370.muraltest.MuralValueEventListener;

public class MuralModel
{
    private static final String COLLECTION_NAME = "murals";

    public static void All(MuralValueEventListener valueEventListener)
    {
        FIRQueryHelper.All(COLLECTION_NAME, valueEventListener);
    }

    public static void FromKey(String key, MuralValueEventListener valueEventListener)
    {
        FIRQueryHelper.FromKey(COLLECTION_NAME, key, valueEventListener);
    }

    private String key;
    private String name;
    private String description;
    private HashMap<String, Boolean> tags;
    private HashMap<String, Boolean> artists;
    private HashMap<String, ImageModel> images;

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

    public List<String> getTags()
    {
        return FIRListHelper.KeyListFromMap(this.tags);
    }

    public List<String> getArtists()
    {
        return FIRListHelper.KeyListFromMap(this.artists);
    }
}
