# CollectionViewInTableViewCell
TableView嵌套CollectionView的一个小Demo...<br>
## 大概介绍<br>
* colletionViewCell会根据文字内容调整`frame`，内容满一行，自动换行，并且所有的cell将会`左对齐`
* colletionView会展现所有的行数，即等于`contensize.height`（将cell全部展现）
* tableViewCell会根据collectionView的`frame`调整`cell的height`

## 预览图<br>
![](https://github.com/polvae/CollectionViewInTableViewCell/blob/master/DishListRecord.gif) <br>


`问题：在滑动的时候，会出现轻微的跳动问题（不断在更新frame），所以。。。抛砖引玉（哪位修改好了，请发给我，谢谢。。。1358557767@qq.com）`