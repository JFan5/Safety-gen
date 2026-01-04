(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_05 obj_04 obj_02 obj_01 obj_03 )
(:init
(pred_2)
(pred_3 obj_05)
(pred_1 obj_04 obj_03)
(pred_1 obj_02 obj_01)
(pred_1 obj_01 obj_04)
(pred_1 obj_03 obj_05)
(pred_4 obj_02)
)
(:goal
(and
(pred_1 obj_05 obj_04)
(pred_1 obj_02 obj_03)
(pred_1 obj_01 obj_05))
)

(:constraints
  (sometime-before (pred_1 obj_02 obj_03) (pred_1 obj_05 obj_04))
)
)