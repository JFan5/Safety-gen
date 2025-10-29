; params: satgen 43825 2 1 2 7 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph1 - mode
	thermograph0 - mode
	Star3 - direction
	Star4 - direction
	GroundStation5 - direction
	GroundStation6 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	Star0 - direction
	Planet7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument1 spectrograph1)
	(supports instrument1 thermograph0)
	(calibration_target instrument1 Star0)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon8)
)
(:goal (and
	(have_image Planet7 thermograph0)
	(have_image Phenomenon8 spectrograph1)
))

)
