package edu.chapman.cpsc370.muraltest;

import edu.chapman.cpsc370.muraltest.models.MuralModel;

public abstract class MuralValueEventListener extends ModelValueEventListener<MuralModel>
{
    public MuralValueEventListener()
    {
        super(MuralModel.class);
    }
}