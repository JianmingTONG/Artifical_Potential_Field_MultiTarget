%�����ͼƬ�ߴ���ͬ��pdf
 %ʹ��ע�⣺��ǰ���ܴ򿪹��ര�� 
function savepdf(gcf,namestring)


    %gcf Ϊͼ�εľ����namestringΪ�뱣����ļ����ƣ������ļ���ʽ��׺��
    %  fpΪ��Դ�ļ��еõ���ͼ��λ������ fp=get(gcf,'position'); ����Ϊ
    %  ���Ե���±�Ե��ͼ�εĿ����ҳ��ȣ���ͼ�εĸߣ����³��ȣ�
    %  ����ͼƬ��λһ��Ҫ�ڻ��ͼƬ����λ��֮ǰ������ͼƬ����
    set(gcf,'Units','centimeters');
    fp=get(gcf,'Position');
    set(gcf,'Paperposition',[0 0 fp(3)-fp(1) fp(4)-fp(2)],'Papersize',[fp(3)-fp(1) fp(4)-fp(2)]);
    saveas(gcf,namestring)  

%%   ��ʹ�ø�����ʹ�����ļ�����namestring����Ҫ�Ӻ�׺
%string=[namestring,'.pdf'];

