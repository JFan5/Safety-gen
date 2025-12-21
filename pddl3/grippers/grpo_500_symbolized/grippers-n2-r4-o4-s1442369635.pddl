(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_01 - type_1
obj_06 obj_11 obj_04 obj_08 - type_3
obj_10 obj_03 obj_05 obj_12 - type_2
obj_07 obj_02 obj_14 obj_09 - object)
(:init
(pred_4 obj_13 obj_05)
(pred_2 obj_13 obj_06)
(pred_2 obj_13 obj_11)
(pred_4 obj_01 obj_05)
(pred_2 obj_01 obj_04)
(pred_2 obj_01 obj_08)
(pred_3 obj_07 obj_12)
(pred_3 obj_02 obj_12)
(pred_3 obj_14 obj_10)
(pred_3 obj_09 obj_03)
)
(:goal
(and
(pred_3 obj_07 obj_03)
(pred_3 obj_02 obj_10)
(pred_3 obj_14 obj_03)
(pred_3 obj_09 obj_12)
)
)

(:constraints
  (always (not (pred_4 obj_13 obj_12)))
)
)