(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_13 - type_1
obj_09 obj_01 obj_08 obj_11 - type_3
obj_07 obj_12 obj_02 obj_05 - type_2
obj_04 obj_10 obj_03 - object)
(:init
(pred_4 obj_06 obj_07)
(pred_2 obj_06 obj_09)
(pred_2 obj_06 obj_01)
(pred_4 obj_13 obj_12)
(pred_2 obj_13 obj_08)
(pred_2 obj_13 obj_11)
(pred_3 obj_04 obj_12)
(pred_3 obj_10 obj_02)
(pred_3 obj_03 obj_05)
)
(:goal
(and
(pred_3 obj_04 obj_07)
(pred_3 obj_10 obj_07)
(pred_3 obj_03 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_06 obj_02)))
)
)