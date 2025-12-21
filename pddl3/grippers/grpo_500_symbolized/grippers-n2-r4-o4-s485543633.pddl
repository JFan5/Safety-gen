(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_10 - type_1
obj_05 obj_06 obj_11 obj_03 - type_3
obj_13 obj_04 obj_12 obj_08 - type_2
obj_01 obj_09 obj_14 obj_02 - object)
(:init
(pred_4 obj_07 obj_13)
(pred_2 obj_07 obj_05)
(pred_2 obj_07 obj_06)
(pred_4 obj_10 obj_08)
(pred_2 obj_10 obj_11)
(pred_2 obj_10 obj_03)
(pred_3 obj_01 obj_08)
(pred_3 obj_09 obj_08)
(pred_3 obj_14 obj_04)
(pred_3 obj_02 obj_13)
)
(:goal
(and
(pred_3 obj_01 obj_13)
(pred_3 obj_09 obj_08)
(pred_3 obj_14 obj_12)
(pred_3 obj_02 obj_13)
)
)

(:constraints
  (always (not (pred_4 obj_07 obj_12)))
)
)