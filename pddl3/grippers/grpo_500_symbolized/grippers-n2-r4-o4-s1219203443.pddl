(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_02 - type_1
obj_06 obj_05 obj_14 obj_04 - type_3
obj_11 obj_09 obj_08 obj_12 - type_2
obj_13 obj_01 obj_07 obj_03 - object)
(:init
(pred_3 obj_10 obj_08)
(pred_4 obj_10 obj_06)
(pred_4 obj_10 obj_05)
(pred_3 obj_02 obj_09)
(pred_4 obj_02 obj_14)
(pred_4 obj_02 obj_04)
(pred_2 obj_13 obj_12)
(pred_2 obj_01 obj_11)
(pred_2 obj_07 obj_08)
(pred_2 obj_03 obj_12)
)
(:goal
(and
(pred_2 obj_13 obj_11)
(pred_2 obj_01 obj_08)
(pred_2 obj_07 obj_08)
(pred_2 obj_03 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_10 obj_12)))
)
)