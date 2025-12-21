(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_02 - type_1
obj_04 obj_05 obj_03 obj_06 - type_3
obj_08 obj_13 obj_12 obj_10 - type_2
obj_07 obj_01 obj_11 - object)
(:init
(pred_4 obj_09 obj_13)
(pred_2 obj_09 obj_04)
(pred_2 obj_09 obj_05)
(pred_4 obj_02 obj_13)
(pred_2 obj_02 obj_03)
(pred_2 obj_02 obj_06)
(pred_3 obj_07 obj_12)
(pred_3 obj_01 obj_13)
(pred_3 obj_11 obj_13)
)
(:goal
(and
(pred_3 obj_07 obj_10)
(pred_3 obj_01 obj_10)
(pred_3 obj_11 obj_12)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_12)))
)
)