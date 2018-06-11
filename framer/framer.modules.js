require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"StatusBar":[function(require,module,exports){
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

exports.StatusBar = (function(superClass) {
  var n;

  extend(StatusBar, superClass);

  n = Screen.width / 750;

  function StatusBar(options) {
    var backgroundBlur;
    this.options = options != null ? options : {};
    _.defaults(this.options, {
      backgroundColor: "#FFF",
      width: Screen.width,
      height: 40 * n,
      opacity: 0.96,
      image: "images/Status Bar (White).png",
      z: 4
    }, backgroundBlur = 40);
    this.topbar = new Layer({
      width: Screen.width,
      height: 88 * n,
      backgroundColor: "#FFF"
    });
    this.pageTitle = new TextLayer({
      fontSize: 34 * n,
      fontWeight: 800,
      color: "#2D2929",
      backgroundColor: null,
      textAlign: "center",
      x: Align.center,
      width: Screen.width
    });
    this.topbarRightIcon01 = new Layer({
      width: 32 * n,
      height: 32 * n,
      backgroundColor: null,
      x: Align.right(-32 * n),
      image: "images/nav_icon_mess@2x.svg"
    });
    this.topbarLeftIcon01 = new Layer({
      width: 32 * n,
      height: 32 * n,
      backgroundColor: null,
      x: Align.left(32 * n),
      image: "images/nav_icon_back@2x.svg"
    });
    StatusBar.__super__.constructor.call(this, this.options);
    this.topbar.parent = this;
    this.topbar.y = 40 * n;
    this.pageTitle.parent = this.topbar;
    this.topbarRightIcon01.parent = this.topbar;
    this.topbarRightIcon01.y = Align.center();
    this.topbarLeftIcon01.parent = this.topbar;
    this.topbarLeftIcon01.y = Align.center();
    this.pageTitle.y = Align.center();
    this.pageTitle.text = "PageName";
  }

  return StatusBar;

})(Layer);


},{}],"myModule":[function(require,module,exports){
exports.myVar = "myVariable";

exports.myFunction = function() {
  return print("myFunction is running");
};

exports.myArray = [1, 2, 3];


},{}]},{},[])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZnJhbWVyLm1vZHVsZXMuanMiLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uLy4uL1VzZXJzL2FkL0Rlc2t0b3AvZnJhbWVyL216amstbG9hbi5mcmFtZXIvbW9kdWxlcy9teU1vZHVsZS5jb2ZmZWUiLCIuLi8uLi8uLi8uLi8uLi9Vc2Vycy9hZC9EZXNrdG9wL2ZyYW1lci9temprLWxvYW4uZnJhbWVyL21vZHVsZXMvU3RhdHVzQmFyLmNvZmZlZSIsIm5vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiXSwic291cmNlc0NvbnRlbnQiOlsiIyBBZGQgdGhlIGZvbGxvd2luZyBsaW5lIHRvIHlvdXIgcHJvamVjdCBpbiBGcmFtZXIgU3R1ZGlvLiBcbiMgbXlNb2R1bGUgPSByZXF1aXJlIFwibXlNb2R1bGVcIlxuIyBSZWZlcmVuY2UgdGhlIGNvbnRlbnRzIGJ5IG5hbWUsIGxpa2UgbXlNb2R1bGUubXlGdW5jdGlvbigpIG9yIG15TW9kdWxlLm15VmFyXG5cbmV4cG9ydHMubXlWYXIgPSBcIm15VmFyaWFibGVcIlxuXG5leHBvcnRzLm15RnVuY3Rpb24gPSAtPlxuXHRwcmludCBcIm15RnVuY3Rpb24gaXMgcnVubmluZ1wiXG5cbmV4cG9ydHMubXlBcnJheSA9IFsxLCAyLCAzXSIsImNsYXNzIGV4cG9ydHMuU3RhdHVzQmFyIGV4dGVuZHMgTGF5ZXJcblx0biA9IFNjcmVlbi53aWR0aC83NTBcblx0Y29uc3RydWN0b3I6IChAb3B0aW9ucz17fSkgLT5cblx0XHRfLmRlZmF1bHRzIEBvcHRpb25zLFxuXHRcdFx0YmFja2dyb3VuZENvbG9yOiBcIiNGRkZcIlxuXHRcdFx0d2lkdGg6IFNjcmVlbi53aWR0aFxuXHRcdFx0aGVpZ2h0OiA0MCpuXG5cdFx0XHRvcGFjaXR5OiAwLjk2XG5cdFx0XHRpbWFnZTogXCJpbWFnZXMvU3RhdHVzIEJhciAoV2hpdGUpLnBuZ1wiXG5cdFx0XHR6OjRcblx0XHRcdGJhY2tncm91bmRCbHVyID0gNDBcblx0XHRAdG9wYmFyID0gbmV3IExheWVyXG5cdFx0XHR3aWR0aDogU2NyZWVuLndpZHRoXG5cdFx0XHRoZWlnaHQ6IDg4Km5cblx0XHRcdGJhY2tncm91bmRDb2xvcjogXCIjRkZGXCJcblx0XG5cdFx0QHBhZ2VUaXRsZSA9IG5ldyBUZXh0TGF5ZXJcblx0XHRcdGZvbnRTaXplOjM0Km5cblx0XHRcdGZvbnRXZWlnaHQ6ODAwXG5cdFx0XHRjb2xvcjpcIiMyRDI5MjlcIlxuXHRcdFx0YmFja2dyb3VuZENvbG9yOiBudWxsXG5cdFx0XHR0ZXh0QWxpZ246IFwiY2VudGVyXCJcblx0XHRcdHg6QWxpZ24uY2VudGVyXG5cdFx0XHR3aWR0aDpTY3JlZW4ud2lkdGhcblxuXHRcdEB0b3BiYXJSaWdodEljb24wMSA9IG5ldyBMYXllclxuXHRcdFx0d2lkdGg6IDMyKm5cblx0XHRcdGhlaWdodDozMipuXG5cdFx0XHRiYWNrZ3JvdW5kQ29sb3I6IG51bGxcblx0XHRcdHg6IEFsaWduLnJpZ2h0KC0zMipuKVxuXHRcdFx0aW1hZ2U6IFwiaW1hZ2VzL25hdl9pY29uX21lc3NAMnguc3ZnXCJcblx0XHRcdFxuXHRcdEB0b3BiYXJMZWZ0SWNvbjAxID0gbmV3IExheWVyXG5cdFx0XHR3aWR0aDogMzIqblxuXHRcdFx0aGVpZ2h0OjMyKm5cblx0XHRcdGJhY2tncm91bmRDb2xvcjogbnVsbFxuXHRcdFx0eDogQWxpZ24ubGVmdCgzMipuKVxuXHRcdFx0aW1hZ2U6IFwiaW1hZ2VzL25hdl9pY29uX2JhY2tAMnguc3ZnXCJcblxuXHRcdHN1cGVyIEBvcHRpb25zXG5cdFx0XG5cdFx0QHRvcGJhci5wYXJlbnQgPSBAXG5cdFx0QHRvcGJhci55ID0gNDAqblxuXHRcdEBwYWdlVGl0bGUucGFyZW50ID0gQHRvcGJhclxuXHRcdEB0b3BiYXJSaWdodEljb24wMS5wYXJlbnQgPSBAdG9wYmFyXG5cdFx0QHRvcGJhclJpZ2h0SWNvbjAxLnkgPSBBbGlnbi5jZW50ZXIoKVxuXHRcdEB0b3BiYXJMZWZ0SWNvbjAxLnBhcmVudCA9IEB0b3BiYXJcblx0XHRAdG9wYmFyTGVmdEljb24wMS55ID0gQWxpZ24uY2VudGVyKClcblx0XHRAcGFnZVRpdGxlLnkgPSBBbGlnbi5jZW50ZXIoKVxuXHRcdEBwYWdlVGl0bGUudGV4dCA9IFwiUGFnZU5hbWVcIlxuXHRcdFxuXHRcbiIsIihmdW5jdGlvbiBlKHQsbixyKXtmdW5jdGlvbiBzKG8sdSl7aWYoIW5bb10pe2lmKCF0W29dKXt2YXIgYT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2lmKCF1JiZhKXJldHVybiBhKG8sITApO2lmKGkpcmV0dXJuIGkobywhMCk7dmFyIGY9bmV3IEVycm9yKFwiQ2Fubm90IGZpbmQgbW9kdWxlICdcIitvK1wiJ1wiKTt0aHJvdyBmLmNvZGU9XCJNT0RVTEVfTk9UX0ZPVU5EXCIsZn12YXIgbD1uW29dPXtleHBvcnRzOnt9fTt0W29dWzBdLmNhbGwobC5leHBvcnRzLGZ1bmN0aW9uKGUpe3ZhciBuPXRbb11bMV1bZV07cmV0dXJuIHMobj9uOmUpfSxsLGwuZXhwb3J0cyxlLHQsbixyKX1yZXR1cm4gbltvXS5leHBvcnRzfXZhciBpPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7Zm9yKHZhciBvPTA7bzxyLmxlbmd0aDtvKyspcyhyW29dKTtyZXR1cm4gc30pIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBRUFBO0FEQUEsSUFBQTs7O0FBQU0sT0FBTyxDQUFDO0FBQ2IsTUFBQTs7OztFQUFBLENBQUEsR0FBSSxNQUFNLENBQUMsS0FBUCxHQUFhOztFQUNKLG1CQUFDLE9BQUQ7QUFDWixRQUFBO0lBRGEsSUFBQyxDQUFBLDRCQUFELFVBQVM7SUFDdEIsQ0FBQyxDQUFDLFFBQUYsQ0FBVyxJQUFDLENBQUEsT0FBWixFQUNDO01BQUEsZUFBQSxFQUFpQixNQUFqQjtNQUNBLEtBQUEsRUFBTyxNQUFNLENBQUMsS0FEZDtNQUVBLE1BQUEsRUFBUSxFQUFBLEdBQUcsQ0FGWDtNQUdBLE9BQUEsRUFBUyxJQUhUO01BSUEsS0FBQSxFQUFPLCtCQUpQO01BS0EsQ0FBQSxFQUFFLENBTEY7S0FERCxFQU9DLGNBQUEsR0FBaUIsRUFQbEI7SUFRQSxJQUFDLENBQUEsTUFBRCxHQUFjLElBQUEsS0FBQSxDQUNiO01BQUEsS0FBQSxFQUFPLE1BQU0sQ0FBQyxLQUFkO01BQ0EsTUFBQSxFQUFRLEVBQUEsR0FBRyxDQURYO01BRUEsZUFBQSxFQUFpQixNQUZqQjtLQURhO0lBS2QsSUFBQyxDQUFBLFNBQUQsR0FBaUIsSUFBQSxTQUFBLENBQ2hCO01BQUEsUUFBQSxFQUFTLEVBQUEsR0FBRyxDQUFaO01BQ0EsVUFBQSxFQUFXLEdBRFg7TUFFQSxLQUFBLEVBQU0sU0FGTjtNQUdBLGVBQUEsRUFBaUIsSUFIakI7TUFJQSxTQUFBLEVBQVcsUUFKWDtNQUtBLENBQUEsRUFBRSxLQUFLLENBQUMsTUFMUjtNQU1BLEtBQUEsRUFBTSxNQUFNLENBQUMsS0FOYjtLQURnQjtJQVNqQixJQUFDLENBQUEsaUJBQUQsR0FBeUIsSUFBQSxLQUFBLENBQ3hCO01BQUEsS0FBQSxFQUFPLEVBQUEsR0FBRyxDQUFWO01BQ0EsTUFBQSxFQUFPLEVBQUEsR0FBRyxDQURWO01BRUEsZUFBQSxFQUFpQixJQUZqQjtNQUdBLENBQUEsRUFBRyxLQUFLLENBQUMsS0FBTixDQUFZLENBQUMsRUFBRCxHQUFJLENBQWhCLENBSEg7TUFJQSxLQUFBLEVBQU8sNkJBSlA7S0FEd0I7SUFPekIsSUFBQyxDQUFBLGdCQUFELEdBQXdCLElBQUEsS0FBQSxDQUN2QjtNQUFBLEtBQUEsRUFBTyxFQUFBLEdBQUcsQ0FBVjtNQUNBLE1BQUEsRUFBTyxFQUFBLEdBQUcsQ0FEVjtNQUVBLGVBQUEsRUFBaUIsSUFGakI7TUFHQSxDQUFBLEVBQUcsS0FBSyxDQUFDLElBQU4sQ0FBVyxFQUFBLEdBQUcsQ0FBZCxDQUhIO01BSUEsS0FBQSxFQUFPLDZCQUpQO0tBRHVCO0lBT3hCLDJDQUFNLElBQUMsQ0FBQSxPQUFQO0lBRUEsSUFBQyxDQUFBLE1BQU0sQ0FBQyxNQUFSLEdBQWlCO0lBQ2pCLElBQUMsQ0FBQSxNQUFNLENBQUMsQ0FBUixHQUFZLEVBQUEsR0FBRztJQUNmLElBQUMsQ0FBQSxTQUFTLENBQUMsTUFBWCxHQUFvQixJQUFDLENBQUE7SUFDckIsSUFBQyxDQUFBLGlCQUFpQixDQUFDLE1BQW5CLEdBQTRCLElBQUMsQ0FBQTtJQUM3QixJQUFDLENBQUEsaUJBQWlCLENBQUMsQ0FBbkIsR0FBdUIsS0FBSyxDQUFDLE1BQU4sQ0FBQTtJQUN2QixJQUFDLENBQUEsZ0JBQWdCLENBQUMsTUFBbEIsR0FBMkIsSUFBQyxDQUFBO0lBQzVCLElBQUMsQ0FBQSxnQkFBZ0IsQ0FBQyxDQUFsQixHQUFzQixLQUFLLENBQUMsTUFBTixDQUFBO0lBQ3RCLElBQUMsQ0FBQSxTQUFTLENBQUMsQ0FBWCxHQUFlLEtBQUssQ0FBQyxNQUFOLENBQUE7SUFDZixJQUFDLENBQUEsU0FBUyxDQUFDLElBQVgsR0FBa0I7RUEvQ047Ozs7R0FGa0I7Ozs7QURJaEMsT0FBTyxDQUFDLEtBQVIsR0FBZ0I7O0FBRWhCLE9BQU8sQ0FBQyxVQUFSLEdBQXFCLFNBQUE7U0FDcEIsS0FBQSxDQUFNLHVCQUFOO0FBRG9COztBQUdyQixPQUFPLENBQUMsT0FBUixHQUFrQixDQUFDLENBQUQsRUFBSSxDQUFKLEVBQU8sQ0FBUCJ9
