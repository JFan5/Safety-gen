(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_06 - type_1
obj_12 obj_07 obj_05 obj_01 - type_2
obj_02 obj_03 obj_11 - type_3
obj_10 obj_09 obj_08 - object)
(:init
(pred_1 obj_04 obj_03)
(pred_3 obj_04 obj_12)
(pred_3 obj_04 obj_07)
(pred_1 obj_06 obj_11)
(pred_3 obj_06 obj_05)
(pred_3 obj_06 obj_01)
(pred_2 obj_10 obj_11)
(pred_2 obj_09 obj_11)
(pred_2 obj_08 obj_11)
)
(:goal
(and
(pred_2 obj_10 obj_03)
(pred_2 obj_09 obj_02)
(pred_2 obj_08 obj_03)
)
)

(:constraints
  (always (not (pred_1 obj_04 obj_11)))
)
)