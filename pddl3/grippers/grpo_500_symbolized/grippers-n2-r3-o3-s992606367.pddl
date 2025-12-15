(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_10 - type_1
obj_07 obj_06 obj_09 obj_01 - type_3
obj_08 obj_05 obj_12 - type_2
obj_03 obj_04 obj_11 - object)
(:init
(pred_3 obj_02 obj_05)
(pred_4 obj_02 obj_07)
(pred_4 obj_02 obj_06)
(pred_3 obj_10 obj_05)
(pred_4 obj_10 obj_09)
(pred_4 obj_10 obj_01)
(pred_2 obj_03 obj_12)
(pred_2 obj_04 obj_12)
(pred_2 obj_11 obj_08)
)
(:goal
(and
(pred_2 obj_03 obj_12)
(pred_2 obj_04 obj_05)
(pred_2 obj_11 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_12)))
)
)