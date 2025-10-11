; params: satgen 714849 2 2 2 7 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	thermograph0 - mode
	spectrograph1 - mode
	Star1 - direction
	Star2 - direction
	Star5 - direction
	Star6 - direction
	GroundStation3 - direction
	Star0 - direction
	Star4 - direction
	Phenomenon7 - direction
	Star8 - direction
	Phenomenon9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon7)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 Star4)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 Star4)
	(calibration_target instrument2 Star0)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star2)
)
(:goal (and
	(pointing satellite1 Star1)
	(have_image Phenomenon7 thermograph0)
	(have_image Star8 thermograph0)
	(have_image Phenomenon9 thermograph0)
	(have_image Planet10 spectrograph1)
))

)
