(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_04 - type_1
obj_06 obj_11 obj_13 obj_14 - type_3
obj_05 obj_01 obj_12 obj_03 - type_2
obj_09 obj_10 obj_02 obj_07 - object)
(:init
(pred_4 obj_08 obj_03)
(pred_2 obj_08 obj_06)
(pred_2 obj_08 obj_11)
(pred_4 obj_04 obj_03)
(pred_2 obj_04 obj_13)
(pred_2 obj_04 obj_14)
(pred_3 obj_09 obj_12)
(pred_3 obj_10 obj_05)
(pred_3 obj_02 obj_12)
(pred_3 obj_07 obj_12)
)
(:goal
(and
(pred_3 obj_09 obj_03)
(pred_3 obj_10 obj_01)
(pred_3 obj_02 obj_05)
(pred_3 obj_07 obj_12)
)
)

(:constraints
  (always (not (pred_4 obj_08 obj_12)))
)
)