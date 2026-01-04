(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_11 - type_2
obj_09 obj_03 obj_10 obj_07 - type_1
obj_01 obj_13 obj_12 obj_02 - type_3
obj_04 obj_08 obj_06 - object)
(:init
(pred_4 obj_05 obj_13)
(pred_2 obj_05 obj_09)
(pred_2 obj_05 obj_03)
(pred_4 obj_11 obj_01)
(pred_2 obj_11 obj_10)
(pred_2 obj_11 obj_07)
(pred_3 obj_04 obj_12)
(pred_3 obj_08 obj_12)
(pred_3 obj_06 obj_12)
)
(:goal
(and
(pred_3 obj_04 obj_01)
(pred_3 obj_08 obj_02)
(pred_3 obj_06 obj_01)
)
)

(:constraints
  (always (not (pred_4 obj_05 obj_12)))
)
)