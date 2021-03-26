import {GLTFLoader} from '/resources/js/gallery/GLTFLoader.js';

//3d오브젝트를 렌더링할 HTML Element요소
let middle = document.querySelector('.middle');
//scene 객체 생성
const scene = new THREE.Scene();

//camera 세팅 
//시야각, 종횡비, near, far 
//near : 해당 값보다 가까이 있는 오브젝트는 랜더링하지 않음 / far : 해당값보다 멀리 있는 오브젝트는 렌더링하지 않음
const camera = new THREE.PerspectiveCamera( 75, middle.clientWidth / middle.clientHeight, 0.1, 1000 );
camera.position.z = 2;
const renderer = new THREE.WebGLRenderer();
renderer.setSize( middle.clientWidth, middle.clientHeight );
middle.appendChild( renderer.domElement );

//컨트롤러 추가
const controls = new THREE.OrbitControls( camera, renderer.domElement );
controls.update();

document.querySelector('canvas').addEventListener('onclick',()=>{console.log('click')});

//빛 추가
const color = 'white';
const intensity = 1;
const ypos = 7;

//액자 객체들을 저장하는 배열
let targetList = [];

const leftLight = new THREE.DirectionalLight(color, intensity);
leftLight.position.set(5, ypos, 0);

const rightLight = new THREE.DirectionalLight(color, intensity);
rightLight.position.set(-5, ypos, 0);

const frontLight = new THREE.DirectionalLight(color, intensity);
frontLight.position.set(0, ypos, 5);

const backLight = new THREE.DirectionalLight(color, intensity);
backLight.position.set(0, ypos, -5);

function dumpObject(obj, lines = [], isLast = true, prefix = '') {
	const localPrefix = isLast ? '└─' : '├─';
	lines.push(`${prefix}${prefix ? localPrefix : ''}${obj.name || '*no-name*'} [${obj.type}]`);
	const newPrefix = prefix + (isLast ? '  ' : '│ ');
	const lastNdx = obj.children.length - 1;
	obj.children.forEach((child, ndx) => {
	  const isLast = ndx === lastNdx;
	  dumpObject(child, lines, isLast, newPrefix);
	});
	return lines;
}

let target;
const gltfLoader = new GLTFLoader();
const url = './resources/landscape_gallery_by_stoneysteiner/scene.gltf';
gltfLoader.load(url, (gltf) => {
    const root = gltf.scene;
    scene.add(root);

	// 오브젝트 객체의 정보를 출력해준다
	console.log(dumpObject(root).join('\n'));
	console.dir(root.getObjectByName('Cube003'));

	// Cube003의 children은 액자인지 그림만인지... 하튼 객체 찾아냄
	target = root.getObjectByName('Cube003');
	for(let item of target.children){
		targetList.push(item);
	}
	for(let test2 of target.children){
	   // test2.rotation.x += 0.1;
	   // test2.rotation.z += 0.1;
   }
	// 일단 상하좌우 조명설치
	// 추후 지붕에서 보이거나 액자마다 할 예정
	root.add(rightLight);
	root.add(leftLight);
	root.add(frontLight);
	root.add(backLight);
	root.add(camera);
	document.addEventListener('click',onDocumentMouseDown);
});

let onDocumentMouseDown = (event) => {
	mouse.x = (event.clientX / window.innerWidth) * 2 - 1;
    mouse.y = - ( event.clientY / window.innerHeight ) * 2 + 1;
    console.log('Click.' + mouse.x + ' : ' + mouse.y);

    let vector = new THREE.Vector3(mouse.x , mouse.y , 1);
    let ray = new THREE.Raycaster();
    ray.setFromCamera( mouse, camera );
    let intersects = ray.intersectObjects( targetList);
    console.dir(intersects);
    if(intersects.length > 0){
        console.log('Hit @' + toString(intersects[0].point) + '\n'+ intersects[0].object.name);
        //camera.position.x = intersects[0].point.x;
        //camera.position.z = intersects[0].point.z;
        
        
        targetList.forEach((e) => {
            if(e.name === intersects[0].object.name){
                let aa = e;
                e.geometry.center();
                console.dir(aa);

            }
        })
    }
}

//화면 랜더링
function animate() {
	requestAnimationFrame( animate );
	renderer.render( scene, camera );	
}
animate();