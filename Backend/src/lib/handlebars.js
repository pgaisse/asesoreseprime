const timeago = require('timeago.js');


const helpers = {};

helpers.timeago = (savedTimestamp) => {
    console.log(savedTimestamp+" "+timeago.format(new Date(savedTimestamp)))
    return timeago.format(savedTimestamp);
}
helpers.ifCond=(v1, v2, options)=> {
    console.log('1:' + v1);
    console.log('2:' + v2);
    if (v1 === v2) {
      return options.fn(this);
    }
    return options.inverse(this);

  }
  helpers.nodupl=(name_sector, name_sector_ant)=> {

    if (name_sector != name_sector_ant) {

      return "";
    }
    else {
      return name_sector;
    }

    id_sector_ant = id_sector


  }

  helpers.or=(v1, v2, options)=> {
    if (v1 || v2) {
      return options.fn(this);
    }
    else {
      return options.inverse(this);

    }
  }
  helpers.rest=(v1)=> {
    const result = v1 - 1;
    if (result >= 1) {
      return result;
    }
    else {
      return 1;
    }


  }
  helpers.setVar=(varName, varValue, options) =>{
    options.data.root[varName] = varValue;
  }
  helpers.sum=(v1, max)=> {
    const result = v1 + 1;
    return result;

  }

  helpers. findTable=(obj)=> {
    const id = 0;
    for (var prop in obj) {
      //if(prop.includes('id_'))
      {
        return prop;
      }
    }
  }
  helpers.objectToArray=(object)=> {
    return Object.entries(object);
  }
  helpers.findId=(obj) =>{
    for (var prop in obj) {
      //if(prop.includes('id_'))
      {
        return obj[prop];
      }
    }
  }
  helpers.icons=(nameTable) =>{



    var icons = [['incidents', 'fas fa-exclamation-triangle'], ['repairs', 'fas fa-hammer'], ['advisers', 'fas fa-user'], ['cases', 'fas fa-folder-open'], ['clients', 'fas fa-user-friends'], ['budgets', 'far fa-clipboard'], ['damages', 'fas fa-house-damage'], ['dimentions', 'fa-solid fa-maximize'], ['sectors', 'fas fa-map-marker-alt'], ['status', 'fas fa-check-circle']];
    //const objetoJSON = JSON.parse(icons);


    for (let i = 0; i < icons.length; i++) {
      if (icons[i][0] == nameTable) {
        return icons[i][1]
      }

    }

  },
  helpers.genField=(type_f)=> {
    let html_v = '';

    console.log("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" + type_f);
    if (type_f == 'varchar') {
      html_v = `<input type="text" name="adviser_name" placeholder="Name" class="form-control" >`;


    }
    else if ('int') {
      html_v = `<input type="Number" name="adviser_name" placeholder="Name" class="form-control" >`;
    }
    return html_v;
  }


module.exports = helpers;