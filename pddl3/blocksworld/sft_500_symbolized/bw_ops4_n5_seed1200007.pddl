(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_01 obj_03 obj_05 obj_02 obj_04 )
(:init
(pred_2)
(pred_3 obj_01 obj_02)
(pred_1 obj_03)
(pred_3 obj_05 obj_03)
(pred_1 obj_02)
(pred_1 obj_04)
(pred_5 obj_01)
(pred_5 obj_05)
(pred_5 obj_04)
)
(:goal
(and
(pred_3 obj_03 obj_05)
(pred_3 obj_02 obj_04)
(pred_3 obj_04 obj_01))
)

(:constraints
  (sometime-before (pred_3 obj_02 obj_04) (pred_3 obj_03 obj_05))
)
)