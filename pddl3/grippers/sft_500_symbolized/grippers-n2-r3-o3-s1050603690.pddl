(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_04 - type_1
obj_01 obj_09 obj_02 obj_08 - type_2
obj_05 obj_07 obj_12 - type_3
obj_06 obj_11 obj_03 - object)
(:init
(pred_1 obj_10 obj_07)
(pred_3 obj_10 obj_01)
(pred_3 obj_10 obj_09)
(pred_1 obj_04 obj_05)
(pred_3 obj_04 obj_02)
(pred_3 obj_04 obj_08)
(pred_2 obj_06 obj_05)
(pred_2 obj_11 obj_12)
(pred_2 obj_03 obj_05)
)
(:goal
(and
(pred_2 obj_06 obj_12)
(pred_2 obj_11 obj_07)
(pred_2 obj_03 obj_05)
)
)

(:constraints
  (always (not (pred_1 obj_10 obj_12)))
)
)