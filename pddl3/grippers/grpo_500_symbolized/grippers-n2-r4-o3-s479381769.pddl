(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_03 - type_1
obj_13 obj_02 obj_08 obj_09 - type_3
obj_05 obj_11 obj_12 obj_01 - type_2
obj_06 obj_04 obj_07 - object)
(:init
(pred_4 obj_10 obj_05)
(pred_2 obj_10 obj_13)
(pred_2 obj_10 obj_02)
(pred_4 obj_03 obj_01)
(pred_2 obj_03 obj_08)
(pred_2 obj_03 obj_09)
(pred_3 obj_06 obj_11)
(pred_3 obj_04 obj_12)
(pred_3 obj_07 obj_01)
)
(:goal
(and
(pred_3 obj_06 obj_12)
(pred_3 obj_04 obj_11)
(pred_3 obj_07 obj_05)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_12)))
)
)