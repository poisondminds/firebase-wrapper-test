package edu.chapman.cpsc370.muraltest;

import edu.chapman.cpsc370.muraltest.models.ArtistModel;

public abstract class ArtistValueEventListener extends ModelValueEventListener<ArtistModel>
{
    public ArtistValueEventListener()
    {
        super(ArtistModel.class);
    }
}