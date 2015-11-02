/*Determine global variables.*/
int                     playerAmountInt         = 100;
List<Tag>               tagObjectList           = new ArrayList<Tag>();
List<ObjectMuseum>      floorObjectList         = new ArrayList<ObjectMuseum>();
List<ObjectMuseum>      roomObjectList          = new ArrayList<ObjectMuseum>();
List<ObjectMuseum>      exhibitionObjectList    = new ArrayList<ObjectMuseum>();
List<ObjectPlayer>      playerObjectList        = new ArrayList<ObjectPlayer>();

boolean                 panelCardChangeBoolean  = true;
int                     xPanelCardInt           = -1;
int                     yPanelCardInt           = -1;
int                     widthPanelCardInt       = 200;
int                     heightPanelCardInt      = 280;
int                     rowInt                  = 0;
int                     textSizePanelInt        = 48;
ObjectMuseum            selectedMuseumObject    = null;
ObjectPlayer            selectedPlayerObject    = null;
PFont                   panelCardPFont          ;
String                  panelString             = "";

String                  tempVisitorCurrentString;
String                  tempVisitorTotalString  ;
String                  tempFullString          ;

int                     fullThresholdInt        = 0;

int                     layoutOffsetInt         = 5;
int                     layoutOffsetSideInt     = 50;
int                     layoutTotalRowInt       = 10;

/*PROTOTYPE: Testing AIAutoVoid() for this application.
PROTOTYPE: Instead of using for loop to iterate through all the player
    we create a small variable that update one player for every tick.
PROTOTYPE: In result, the application is not burdened out by the for loop.*/
//int                   playerLoopCounterInt    = 0;

class Name                                      {

    String          nameAltString   = "";
    String          nameFullString  = "";
    Name(

        String _nameAltString   , 
        String _nameFullString

    ){

        nameAltString               = _nameAltString;
        nameFullString              = _nameFullString;

    }

};

class Tag                                       {

    Name            tagName         = null;
    String          nameAltString   = "";
    String          nameFullString  = "";
    Tag(Name _nameObject)                       {

        tagName             = _nameObject;
        nameAltString       = tagName.nameAltString;
        nameFullString      = tagName.nameFullString;

    }

}

void setup()                                    {

    /*Setting up application.*/
    size                (1024, 576);
    noStroke            ();

    /*Create the tag list.*/
    tagObjectList           = Arrays.asList(
    
        new Tag(new Name("TAG_AGR", "Agreeable"     )),
        new Tag(new Name("TAG_BRA", "Brave"         )),
        new Tag(new Name("TAG_CAL", "Calm"          )),
        new Tag(new Name("TAG_DEL", "Delightful"    )),
        new Tag(new Name("TAG_EAG", "Eager"         )),
        new Tag(new Name("TAG_FAI", "Faithful"      )),
        new Tag(new Name("TAG_GEN", "Gentle"        )),
        new Tag(new Name("TAG_HAP", "Happy"         )),
        new Tag(new Name("TAG_JOL", "Jolly"         )),
        new Tag(new Name("TAG_KIN", "Kind"          )),
        new Tag(new Name("TAG_LIV", "Lively"        )),
        new Tag(new Name("TAG_NIC", "Nice"          )),
        new Tag(new Name("TAG_OBE", "Obedient"      )),
        new Tag(new Name("TAG_PRO", "Proud"         )),
        new Tag(new Name("TAG_REL", "Relieved"      )),
        new Tag(new Name("TAG_SIL", "Silly"         )),
        new Tag(new Name("TAG_THA", "Thankful"      )),
        new Tag(new Name("TAG_VIC", "Victorious"    )),
        new Tag(new Name("TAG_WIT", "Witty"         )),
        new Tag(new Name("TAG_ZEA", "Zealous"       ))
    
    );

    floorObjectList         = Arrays.asList(

        new ObjectMuseum(new Name("FLR_001", "First Floor"                        ), "XXX_XXX", "FLR", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("FLR_002", "Second Floor"                       ), "XXX_XXX", "FLR", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("FLR_003", "Third Floor"                        ), "XXX_XXX", "FLR", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("FLR_004", "Fourth Floor"                       ), "XXX_XXX", "FLR", AssignRandomTagList(tagObjectList))

    );
    roomObjectList          = Arrays.asList(

        new ObjectMuseum(new Name("ROM_AFK", "Room Afrika"                        ), "FLR_001", "ROM", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("ROM_AME", "Room America"                       ), "FLR_001", "ROM", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("ROM_ASI", "Room Asia"                          ), "FLR_001", "ROM", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("ROM_EUR", "Room Europe"                        ), "FLR_001", "ROM", AssignRandomTagList(tagObjectList))

    );
    exhibitionObjectList    = Arrays.asList(

        new ObjectMuseum(new Name("EXH_CAO", "Exhibition Cameroon"                ), "ROM_AFK", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_EGY", "Exhibition Egypt"                   ), "ROM_AFK", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_ETH", "Exhibition Ethiopia"                ), "ROM_AFK", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_NIG", "Exhibition Nigeria"                 ), "ROM_AFK", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_BRA", "Exhibition Brazil"                  ), "ROM_AME", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_CAN", "Exhibition Canada"                  ), "ROM_AME", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_MEX", "Exhibition Mexico"                  ), "ROM_AME", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_USA", "Exhibition United States Of America"), "ROM_AME", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_CAM", "Exhibition Cambodia"                ), "ROM_ASI", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_IND", "Exhibition India"                   ), "ROM_ASI", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_JAP", "Exhibition Japan"                   ), "ROM_ASI", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_SIN", "Exhibition Singapore"               ), "ROM_ASI", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_BEL", "Exhibition Belgium"                 ), "ROM_EUR", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_FRA", "Exhibition France"                  ), "ROM_EUR", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_GER", "Exhibition Germany"                 ), "ROM_EUR", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_NED", "Exhibition The Netherlands"         ), "ROM_EUR", "EXH", AssignRandomTagList(tagObjectList))

    );

    /*Initiate object parents and children for all object museum.*/
    for(int i = 0; i < floorObjectList.size()           ; i ++) { floorObjectList.get(i).SetChildObjectList  (roomObjectList); }
    for(int i = 0; i < roomObjectList.size()            ; i ++) {

        roomObjectList              .get(i).SetInitialParentObject  (floorObjectList);
        roomObjectList              .get(i).SetChildObjectList      (exhibitionObjectList);

    }
    for(int i = 0; i < exhibitionObjectList.size()      ; i ++) { exhibitionObjectList.get(i)   .SetInitialParentObject(roomObjectList); }

    /*Determine index for all museum object.*/
    for(int i = 0; i < floorObjectList.size()           ; i ++) { floorObjectList.get(i)        .SetIndexInsideVoid(); }
    for(int i = 0; i < roomObjectList.size()            ; i ++) { roomObjectList.get(i)         .SetIndexInsideVoid(); }
    for(int i = 0; i < exhibitionObjectList.size()      ; i ++) { exhibitionObjectList.get(i)   .SetIndexInsideVoid(); }

    /*Initiate all players.*/
    for(int i = 0; i < playerAmountInt; i ++)                   {

        ObjectPlayer objectPlayer   = new ObjectPlayer(i, exhibitionObjectList.get((int)(Math.floor((Math.random()*exhibitionObjectList.size()) + 0))).nameAltString);

    }

}

void draw()                                         {

    /*Set the background color for this application.*/
    background              (34, 32, 52);

    fullThresholdInt        = 2 + (int)(Math.ceil(playerObjectList.size()/exhibitionObjectList.size()));
    layoutTotalRowInt       = 3 + (int)(Math.ceil(playerObjectList.size()/exhibitionObjectList.size()) + 5);

    if      (selectedMuseumObject != null){

        if(

            (mouseX > xPanelCardInt + (selectedMuseumObject.panelObject.widthPanelInt /2)) ||
            (mouseX < xPanelCardInt - (selectedMuseumObject.panelObject.widthPanelInt /2)) ||
            (mouseY > yPanelCardInt + (selectedMuseumObject.panelObject.heightPanelInt/2)) ||
            (mouseY < yPanelCardInt - (selectedMuseumObject.panelObject.heightPanelInt/2))

        ){ panelCardChangeBoolean = true; }

    }
    else if (selectedPlayerObject != null){

        println((mouseX > xPanelCardInt + (selectedPlayerObject.panelObject.widthPanelInt /2)));
        if(

            (mouseX > xPanelCardInt + (selectedPlayerObject.panelObject.widthPanelInt /2)) ||
            (mouseX < xPanelCardInt - (selectedPlayerObject.panelObject.widthPanelInt /2)) ||
            (mouseY > yPanelCardInt + (selectedPlayerObject.panelObject.heightPanelInt/2)) ||
            (mouseY < yPanelCardInt - (selectedPlayerObject.panelObject.heightPanelInt/2))

        ){ panelCardChangeBoolean = true; }

    }

    if(panelCardChangeBoolean   == true){

        xPanelCardInt           = -1;
        yPanelCardInt           = -1;
        rowInt                  = 0;
        selectedMuseumObject    = null;
        selectedPlayerObject    = null;

    }

    for(int i = 0; i < floorObjectList      .size(); i ++){

        floorObjectList         .get(i).SetFullBoolean();
        floorObjectList         .get(i).SetHoverBoolean();
        floorObjectList         .get(i).PanelDrawVoid();

        if(floorObjectList.get(i).SetHoverBoolean() == true && panelCardChangeBoolean == true){

            xPanelCardInt           = floorObjectList.get(i).panelObject.xPanelInt + (floorObjectList.get(i).panelObject.widthPanelInt/2 );
            yPanelCardInt           = floorObjectList.get(i).panelObject.yPanelInt + (floorObjectList.get(i).panelObject.heightPanelInt/2);
            selectedMuseumObject    = floorObjectList.get(i);

            panelCardChangeBoolean  = false;

        }

    }
    for(int i = 0; i < roomObjectList       .size(); i ++){

        roomObjectList          .get(i).SetFullBoolean();
        roomObjectList          .get(i).SetHoverBoolean();
        roomObjectList          .get(i).PanelDrawVoid();

        if(roomObjectList.get(i).SetHoverBoolean() == true && panelCardChangeBoolean == true){

            xPanelCardInt           = roomObjectList.get(i).panelObject.xPanelInt + (roomObjectList.get(i).panelObject.widthPanelInt/2 );
            yPanelCardInt           = roomObjectList.get(i).panelObject.yPanelInt + (roomObjectList.get(i).panelObject.heightPanelInt/2);
            selectedMuseumObject    = roomObjectList.get(i);

            panelCardChangeBoolean  = false;

        }

    }
    for(int i = 0; i < exhibitionObjectList .size(); i ++){

        exhibitionObjectList    .get(i).SetFullBoolean();
        exhibitionObjectList    .get(i).SetHoverBoolean();
        exhibitionObjectList    .get(i).PanelDrawVoid();

        if(exhibitionObjectList.get(i).SetHoverBoolean() == true && panelCardChangeBoolean == true){

            xPanelCardInt           = exhibitionObjectList.get(i).panelObject.xPanelInt + (exhibitionObjectList.get(i).panelObject.widthPanelInt/2 );
            yPanelCardInt           = exhibitionObjectList.get(i).panelObject.yPanelInt + (exhibitionObjectList.get(i).panelObject.heightPanelInt/2);
            selectedMuseumObject    = exhibitionObjectList.get(i);

            panelCardChangeBoolean  = false;

        }

    }
    for(int i = 0; i < playerObjectList     .size(); i ++){

        playerObjectList        .get(i).SetExhibitionTargetStringList();
        playerObjectList        .get(i).AIAutoVoid();
        playerObjectList        .get(i).SetHoverBoolean();
        playerObjectList        .get(i).PanelDrawVoid();

        if(playerObjectList.get(i).SetHoverBoolean() == true && panelCardChangeBoolean == true){

            xPanelCardInt           = playerObjectList.get(i).panelObject.xPanelInt + (playerObjectList.get(i).panelObject.widthPanelInt/2 );
            yPanelCardInt           = playerObjectList.get(i).panelObject.yPanelInt + (playerObjectList.get(i).panelObject.heightPanelInt/2);
            selectedPlayerObject    = playerObjectList.get(i);

            panelCardChangeBoolean  = false;

        }

    }

    CreatePanelCardVoid();

    /*
    playerObjectList        .get(playerLoopCounterInt).AIAutoVoid();
    playerLoopCounterInt    = (playerLoopCounterInt >= (playerObjectList.size() - 1)) ? 0 : (playerLoopCounterInt + 1);
    */

}

/*A function to create panel card.*/
void CreatePanelCardVoid()                          {

    if(panelCardChangeBoolean == false){

        fill                (255);
        rect                (xPanelCardInt, yPanelCardInt, widthPanelCardInt, heightPanelCardInt, 10);
        noFill              ();

        fill                (0);
        textAlign           (CENTER);
        panelCardPFont      = createFont("Georgia", textSizePanelInt);
        textFont            (panelCardPFont);

        /*String display for the player object.*/
        if          (selectedMuseumObject == null){

            rowInt      = 9;

            ObjectMuseum exhibitionCurrentObject    = selectedPlayerObject.FindObject(exhibitionObjectList  , selectedPlayerObject.exhibitionCurrentString          );
            ObjectMuseum roomCurrentObject          = selectedPlayerObject.FindObject(roomObjectList        , exhibitionCurrentObject   .parentObject.nameAltString );
            ObjectMuseum floorCurrentObject         = selectedPlayerObject.FindObject(floorObjectList       , roomCurrentObject         .parentObject.nameAltString );

            panelString  =

                "FLR_CUR = " + exhibitionCurrentObject.nameAltString                                        + "\n" +
                "ROM_CUR = " + roomCurrentObject.nameAltString                                              + "\n" +
                "EXH_CUR = " + exhibitionCurrentObject.nameAltString                                        + "\n" +
                "EXH_TAR = " + selectedPlayerObject.exhibitionTargetStringList .get(0)                      + "\n" +
                "EXH_TAR = " + selectedPlayerObject.exhibitionTargetStringList .get(1)                      + "\n" +
                "EXH_TAR = " + selectedPlayerObject.exhibitionTargetStringList .get(2)                      + "\n" +
                "EXH_TAG = " + selectedPlayerObject.exhibitionTagCounterList   .get(0).GetTagNameString()   + "\n" +
                "EXH_TAG = " + selectedPlayerObject.exhibitionTagCounterList   .get(1).GetTagNameString()   + "\n" +
                "EXH_TAG = " + selectedPlayerObject.exhibitionTagCounterList   .get(2).GetTagNameString()

            ;

        }
        /*String display for the museum object.*/
        else if     (selectedPlayerObject == null){

            rowInt      = 4;

            if      (selectedMuseumObject.visitorCurrentInt < 10   ){ tempVisitorCurrentString = "____"     + selectedMuseumObject.visitorCurrentInt; }
            else if (selectedMuseumObject.visitorCurrentInt < 100  ){ tempVisitorCurrentString = "____"     + selectedMuseumObject.visitorCurrentInt; }
            else if (selectedMuseumObject.visitorCurrentInt < 1000 ){ tempVisitorCurrentString = "___"      + selectedMuseumObject.visitorCurrentInt; }
            else if (selectedMuseumObject.visitorCurrentInt < 10000){ tempVisitorCurrentString = "__"       + selectedMuseumObject.visitorCurrentInt; }

            if      (selectedMuseumObject.visitorTotalInt   < 10   ){ tempVisitorTotalString = "____"     + selectedMuseumObject.visitorTotalInt; }
            else if (selectedMuseumObject.visitorTotalInt   < 100  ){ tempVisitorTotalString = "____"     + selectedMuseumObject.visitorTotalInt; }
            else if (selectedMuseumObject.visitorTotalInt   < 1000 ){ tempVisitorTotalString = "___"      + selectedMuseumObject.visitorTotalInt; }
            else if (selectedMuseumObject.visitorTotalInt   < 10000){ tempVisitorTotalString = "__"       + selectedMuseumObject.visitorTotalInt; }

            if      (selectedMuseumObject.fullBoolean == true ){ tempFullString = "____TRU"; }
            else if (selectedMuseumObject.fullBoolean == false){ tempFullString = "____FAL"; }

            panelString = 

                "NAM_ALT = " + selectedMuseumObject.nameAltString   + "\n" + 
                "VIS_CUR = " + tempVisitorCurrentString             + "\n" + 
                "VIS_TOT = " + tempVisitorTotalString               + "\n" + 
                "_IS_FUL = " + tempFullString

            ;

        }

        /*Iterate font size so that it went a bit smaller than the panel.*/
        while(

            (textWidth(panelString)     > (widthPanelCardInt  - layoutOffsetInt))  ||
            (textSizePanelInt*rowInt    > (heightPanelCardInt - layoutOffsetInt))

        ){

            textSizePanelInt            --;
            if(textSizePanelInt <= 1)   { textSizePanelInt = 1; }
            panelCardPFont              = createFont("Georgia", textSizePanelInt);
            textFont                    (panelCardPFont);

        }
        text                (panelString, xPanelCardInt + (widthPanelCardInt/2), yPanelCardInt + (textSizePanelInt*2));
        textAlign           (LEFT);
        noFill              ();

    }

}

/*A function to return an array of object tag to be put in the museum object, randomly.*/
Tag[] AssignRandomTagList(List<Tag> _tagObjectList) {

    /*Temporary tag object list to be returned later on this function.*/
    List<Tag> assignTagObjectList                   = new ArrayList<Tag>();
    
    /*This function need to be atleast gives three tags to a museum object.
    After three tags is inside the List then we can randomly add another tag with a chance.
    The thing is that every tag added the chance of another tag will be added/pushed
        is lower.*/
    float randomChanceFloat                         = 1f;
    while(

        (assignTagObjectList.size() <= 3) ||
        (Math.random() < randomChanceFloat)

    ){

        /*Need to make sure the inputted random tag is not something that is already in the museum object
        Create a temporary tag object to hold.*/
        int randomIndexInt  = (int)((Math.random()*_tagObjectList.size()) + 0);
        Tag tagObject       = _tagObjectList.get(randomIndexInt);
        
        /*Keep looping over and over until the random index is not a tag that is already in the list.*/
        for(int i = 0; i < assignTagObjectList.size(); i ++){

            /*If the random tag is already inside the museum object then we need to iterate again to get new random tag
                generated.*/
            while(assignTagObjectList.get(i) == tagObject){
                
                randomIndexInt  = (int)((Math.random()*_tagObjectList.size()) + 0);
                tagObject       = _tagObjectList.get(randomIndexInt);
                
            }

        }
        
        /*If the assignTagObjectList has three or more elements then we need to start reducing the changce.*/
        if(assignTagObjectList.size() > 3){ randomChanceFloat -= 0.2f; }
        
        /*Add/push a tag object into the temporary list.*/
        assignTagObjectList.add(tagObject);

    }
    
    /*Before returning the value, the object here is still in List, hence we need to convert it to array.
    Thus, it can be used in params.*/
    Tag[] assignTagObjectArray                      = new Tag[assignTagObjectList.size()];
    for(int i = 0; i < assignTagObjectArray.length; i ++){ assignTagObjectArray[i] = assignTagObjectList.get(i); }
    
    return assignTagObjectArray;

}
