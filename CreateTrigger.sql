Create Trigger AddBlogInRatingTable
On Blogs
After Insert
As
Declare @ID int
Select @ID=BlogID from inserted
Insert Into BlogRatings (BlogID,BlogTotalScore,BlogRatingCount)
Values (@ID,0,0)



Create Trigger AddScoreInComment
On Comments
After Insert
As
Declare @ID int
Declare @Score int
Declare @RatingCount int
Select @ID=BlogID,@Score=BlogScore from inserted
Update BlogRatings Set BlogTotalScore=BlogTotalScore+@Score, BlogRatingCount+=1
Where BlogID=@ID