<template>
    <div class="main-section">
        <h1>Welcome to <span class="highlight">NGINX STORE</span></h1>
        <p>API Gateway, API Security, Cloud-Native, Kubernetes, Service Mesh, MSA, Proxy, Web Server, NGINX 등 다양한 주제의
            최적의 실무 사례를 알아보세요. 업계 선도 기업들이 사용하는 전략과 방법을 통해 더 나은 성과를 달성하세요.</p>
    </div>
</template>

<script>
export default {
    name: 'MainSection'
};
</script>

<style scoped>
.main-section {
    text-align: center;
    margin-bottom: 40px;

}

h1 {
    font-size: 3rem;
    font-weight: bold;
    margin-bottom: 20px;
    color: #FFFFFF;
}

.highlight {
    background: linear-gradient(90deg, #9843a9 0%, #885bf0 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

p {
    font-size: 1.2rem;
    margin-bottom: 30px;
    color: #CCCCCC;
    max-width: 600px;
    margin-left: auto;
    margin-right: auto;
}

.cta-button {
    padding: 12px 24px;
    border: 2px solid #FFFFFF;
    border-radius: 25px;
    background-color: transparent;
    color: #FFFFFF;
    font-size: 1rem;
    cursor: pointer;
    transition: background-color 0.3s ease, color 0.3s ease;
}

.cta-button:hover {
    background-color: #FFFFFF;
    color: #0A0A0A;
}
</style>
