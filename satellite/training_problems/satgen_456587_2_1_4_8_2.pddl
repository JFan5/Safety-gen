; params: satgen 456587 2 1 4 8 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph0 - mode
	thermograph1 - mode
	spectrograph2 - mode
	infrared3 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star4 - direction
	GroundStation5 - direction
	Star7 - direction
	Star3 - direction
	Star6 - direction
	Star2 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 thermograph1)
	(calibration_target instrument0 Star3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon9)
	(supports instrument1 thermograph0)
	(supports instrument1 thermograph1)
	(supports instrument1 infrared3)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 Star2)
	(calibration_target instrument1 Star6)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(pointing satellite1 Star4)
	(have_image Phenomenon8 spectrograph2)
	(have_image Phenomenon9 infrared3)
))

)
