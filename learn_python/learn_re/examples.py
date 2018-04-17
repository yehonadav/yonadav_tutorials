import re
import urllib


def split_n_findall_examples():
    print(re.split(r'\s*', 'f :insert string: r'))

    print(re.split(r'(\s*)', 'f :insert string: r'))

    print(re.split(r's*', 'f :insert string: r'))

    print(re.split(r'[a-f]', "f :inssd&U*L';56redFFFert string: r'"))

    print(re.split(r'[a-fA-F0-9p-q]', "f :inssd&U*L';56redFFFert string: r'",
                   re.I | re.M))

    print(re.split(r'[a-f][a-f]', "f :inssd&U*L';56redFFFertfa string: r'",
                   re.I | re.M))

    print(re.findall(r'\d', "ocinwe324 main st.asdvce"))

    print(re.findall(r'\d*', "ocinwe324 main st.asdvce"))

    print(re.findall(r'\d+', "ocinwe324 main st.asdvce"))

    print(re.findall(r'\d?', "ocinwe324 main st.asdvce"))

    print(re.findall(r'\d{2}', "ocinwe324 main st.asdvce"))

    print(re.findall(r'\d{1,2}', "ocinwe324 main st.asdvce"))

    print(re.findall(r'\d{1,5}\s\w+', "ocinwe324 main st.asdvce"))

    print(re.findall(r'\d{1,5}\s\w+\s\w+', "ocinwe324 main st.asdvce"))

    print(re.findall(r'\d{1,5}\s\w+\s\w+\.', "ocinwe324 main st.asdvce"))


def urllib_example():
    try:
        import urllib.request
    except:
        pass

    sites = 'google yahoo cnn msn'.split()
    pat = re.compile(r'<title>+.*</title>+', re.I | re.M)
    for s in sites:
        print('searching: ' + s)
        try:
            u = urllib.urlopen('http://' + s + '.com')
        except:
            u = urllib.request.urlopen('http://' + s + '.com')
        text = u.read()
        title = re.findall(pat, str(text))
        print(title[0])


if __name__ == "__main__":
    # split_n_findall_examples()
    urllib_example()