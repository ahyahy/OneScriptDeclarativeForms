using ScriptEngine.HostedScript.Library.Binary;
using ScriptEngine.HostedScript.Library;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Collections;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System;

namespace osdf
{
    [ContextClass("ДфТипВидео", "DfVideoType")]
    public class DfVideoType : AutoContext<DfVideoType>, ICollectionContext, IEnumerable<IValue>
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

        public DfVideoType()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Video3gp2));
            _list.Add(ValueFactory.Create(Video3gpp));
            _list.Add(ValueFactory.Create(Video3gpp2));
            _list.Add(ValueFactory.Create(VideoMp4));
            _list.Add(ValueFactory.Create(VideoMpeg));
            _list.Add(ValueFactory.Create(VideoOgg));
            _list.Add(ValueFactory.Create(VideoQuicktime));
            _list.Add(ValueFactory.Create(VideoWebm));
        }

        [ContextProperty("Видео3gp2", "Video3gp2")]
        public string Video3gp2
        {
        	get { return "video/3gp2"; }
        }

        [ContextProperty("Видео3gpp", "Video3gpp")]
        public string Video3gpp
        {
        	get { return "video/3gpp"; }
        }

        [ContextProperty("Видео3gpp2", "Video3gpp2")]
        public string Video3gpp2
        {
        	get { return "video/3gpp2"; }
        }

        [ContextProperty("ВидеоMp4", "VideoMp4")]
        public string VideoMp4
        {
        	get { return "video/mp4"; }
        }

        [ContextProperty("ВидеоMpeg", "VideoMpeg")]
        public string VideoMpeg
        {
        	get { return "video/mpeg"; }
        }

        [ContextProperty("ВидеоOgg", "VideoOgg")]
        public string VideoOgg
        {
        	get { return "video/ogg"; }
        }

        [ContextProperty("ВидеоQuicktime", "VideoQuicktime")]
        public string VideoQuicktime
        {
        	get { return "video/quicktime"; }
        }

        [ContextProperty("ВидеоWebm", "VideoWebm")]
        public string VideoWebm
        {
        	get { return "video/webm"; }
        }
    }
}
