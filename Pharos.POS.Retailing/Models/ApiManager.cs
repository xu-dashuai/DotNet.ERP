﻿using Newtonsoft.Json;
using Pharos.POS.Retailing.Models.ApiReturnResults;
using Pharos.POS.Retailing.Models.PosModels;
using Pharos.POS.Retailing.Models.ViewModels;
using System;
using System.IO;
using System.Net;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;

namespace Pharos.POS.Retailing.Models
{
    internal static class ApiManager
    {
        static string REMOTETESTAPI = "api/ApiEnable";
        static ApiManager()
        {
            EnableRemote = Global.MachineSettings.ServicesConfiguration.ServerPreferred;
            Task.Factory.StartNew(() =>
            {
                while (true)
                {
                    if (Global.MachineSettings.ServicesConfiguration.ServerPreferred)
                    {
                        try
                        {
                            var url = new Uri(new UriBuilder(Global.MachineSettings.ServicesConfiguration.ServerHost).Uri, REMOTETESTAPI);
                            var content = Post(url, string.Empty);
                            var result = JsonConvert.DeserializeObject<ApiRetrunResult<bool>>(content);
                            if (result.Code == "200")
                            {
                                EnableRemote = result.Result;
                            }
                            else
                            {
                                EnableRemote = false;
                            }
                        }
                        catch (Exception ex)
                        {
                            EnableRemote = false;
                        }
                    }
                    else
                    {
                        EnableRemote = false;
                    }
                    Thread.Sleep(5000);
                }
            });

        }
        static bool _EnableRemote;
        public static bool EnableRemote
        {
            get { return _EnableRemote; }
            set
            {
                var status = (value ? ConnectStatus.Server : ConnectStatus.Local);
                if (PosViewModel.Current != null && PosViewModel.Current.ConnectStatus != status)
                {
                    PosViewModel.Current.ConnectStatus = (value ? ConnectStatus.Server : ConnectStatus.Local);
                }
                _EnableRemote = value;

            }
        }

        public static string CurrentApiPath { get { return EnableRemote ? Global.MachineSettings.ServicesConfiguration.ServerHost : Global.MachineSettings.ServicesConfiguration.LocalHost; } }

        public static string PostJson<TParams>(string apiUrl, TParams obj)
        {

            try
            {
                var url = new Uri(new UriBuilder(CurrentApiPath).Uri, apiUrl);
                var _params = JsonConvert.SerializeObject(obj);
                var content = Post(url, _params);
                return content;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        /// 用于分页请求，分段请求
        /// </summary>
        /// <typeparam name="TParams"></typeparam>
        /// <typeparam name="TResult"></typeparam>
        /// <param name="url"></param>
        /// <param name="_Params"></param>
        /// <param name="callBack"></param>
        public static void FullPager<TParams, TResult>(string url, TParams _Params, Action<ApiRetrunResult<PageResult<TResult>>> callBack)
        {
            PageInfo page = new PageInfo() { Index = 1, PageCount = 1, Size = 50 };
            while (page.Index <= page.PageCount)
            {
                var result = Post<TParams, ApiRetrunResult<PageResult<TResult>>>(url + "?pageSize=" + page.Size + "&pageIndex=" + page.Index, _Params);
                if (result.Code == "200")
                {
                    Application.Current.Dispatcher.Invoke(new Action(() =>
                    {
                        callBack(result);
                    }));
                    page = result.Result.Pager;
                    page.Index++;
                }
                else
                {
                    return;
                }
            }
        }

        public static TResult Post<TParams, TResult>(string apiUrl, TParams obj)
        {
            try
            {
                var url = new Uri(new UriBuilder(CurrentApiPath).Uri, apiUrl);
                var _params = JsonConvert.SerializeObject(obj);
                var content = Post(url, _params);
                var result = JsonConvert.DeserializeObject<TResult>(content);
                QueryModel.Current.IsQuery = false;
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static string Post(Uri Url, string JSONData)
        {
            byte[] bytes = Encoding.UTF8.GetBytes(JSONData);
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Url);
            request.Method = "POST";
            request.ContentLength = bytes.Length;
            request.ContentType = "text/json";
            Stream reqstream = request.GetRequestStream();
            reqstream.Write(bytes, 0, bytes.Length);

            //声明一个HttpWebRequest请求  
            request.Timeout = 90000;
            //设置连接超时时间  
            request.Headers.Set("Pragma", "no-cache");
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Stream streamReceive = response.GetResponseStream();
            Encoding encoding = Encoding.UTF8;

            StreamReader streamReader = new StreamReader(streamReceive, encoding);
            string strResult = streamReader.ReadToEnd();
            streamReceive.Dispose();
            streamReader.Dispose();

            return strResult;
        }
    }
}