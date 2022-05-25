<script>
    
    import { onMount } from 'svelte';
   
    // Initialize an empty array for the todos 
    //  and an emtpy string as the todo text
    let todos = [];
    let todoText = '';

    // Create event listener to update todos array on mount (if needed)
    onMount(() => {
        const existingTodos = localStorage.getItem('todos');
        todos = JSON.parse(existingTodos) || [];
    });

    function addTodo() {
        todos = [...todos, todoText];
        localStorage.setItem('todos', JSON.stringify(todos));
    }

</script>

<main class="center">
    
    <h1>Svelte Todo App 🍊</h1>
    
    <form on:submit|preventDefault={addTodo}>
        <input bind:value={todoText} placeholder="What needs to get done?">
        <input type="submit" value="Add todo">
    </form>
    
    <ul>
        {#each todos as todo}
        <li>{todo}</li>
        {/each}
    </ul>

</main>

<style>

@import url('https://fonts.googleapis.com/css2?family=Overpass&display=swap');
main {
    font-family: 'Overpass', sans-serif;
    font-size: 20px;
}

:global(body) {
    background-color: #f6fafd;
}

.center {
    text-align: center;
}

h1 { 
    color: #ff3e00; 
}

ul {
    display: inline-block;
    text-align: left;
    list-style-position: outside;
    font-size: 1.4em;
    color: #444444;
}

</style>