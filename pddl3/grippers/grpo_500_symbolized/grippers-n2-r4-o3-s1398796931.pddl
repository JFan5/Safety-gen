(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_09 - type_1
obj_11 obj_03 obj_05 obj_13 - type_3
obj_07 obj_10 obj_06 obj_12 - type_2
obj_08 obj_02 obj_04 - object)
(:init
(pred_3 obj_01 obj_06)
(pred_4 obj_01 obj_11)
(pred_4 obj_01 obj_03)
(pred_3 obj_09 obj_06)
(pred_4 obj_09 obj_05)
(pred_4 obj_09 obj_13)
(pred_2 obj_08 obj_12)
(pred_2 obj_02 obj_12)
(pred_2 obj_04 obj_12)
)
(:goal
(and
(pred_2 obj_08 obj_12)
(pred_2 obj_02 obj_12)
(pred_2 obj_04 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_12)))
)
)