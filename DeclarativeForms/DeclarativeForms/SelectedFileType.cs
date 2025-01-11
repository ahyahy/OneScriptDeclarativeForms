using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Generic;
using System.Collections;

namespace osdf
{
    [ContextClass("ДфТипВыбранногоФайла", "DfSelectedFileType")]
    public class DfSelectedFileType : AutoContext<DfSelectedFileType>, ICollectionContext, IEnumerable<IValue>
    {
        private List<IValue> _list;

        public int Count()
        {
            return _list.Count;
        }

        public CollectionEnumerator GetManagedIterator()
        {
            return new CollectionEnumerator(this);
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return ((IEnumerable<IValue>)_list).GetEnumerator();
        }

        IEnumerator<IValue> IEnumerable<IValue>.GetEnumerator()
        {
            foreach (var item in _list)
            {
                yield return (item as IValue);
            }
        }

        public DfSelectedFileType()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Audio));
            _list.Add(ValueFactory.Create(Video));
            _list.Add(ValueFactory.Create(Image));
        }

        [ContextProperty("Аудио", "Audio")]
        public string Audio
        {
        	get { return "audio/*"; }
        }

        [ContextProperty("Видео", "Video")]
        public string Video
        {
        	get { return "video/*"; }
        }

        [ContextProperty("Изображение", "Image")]
        public string Image
        {
        	get { return "image/*"; }
        }
    }
}
