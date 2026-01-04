(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_02 obj_05 obj_04 obj_01 obj_03 )
(:init
(pred_3)
(pred_2 obj_02)
(pred_1 obj_05 obj_03)
(pred_1 obj_04 obj_02)
(pred_2 obj_01)
(pred_2 obj_03)
(pred_5 obj_05)
(pred_5 obj_04)
(pred_5 obj_01)
)
(:goal
(and
(pred_1 obj_02 obj_05)
(pred_1 obj_05 obj_01)
(pred_1 obj_03 obj_04))
)

(:constraints
  (sometime-before (pred_1 obj_05 obj_01) (pred_1 obj_02 obj_05))
)
)