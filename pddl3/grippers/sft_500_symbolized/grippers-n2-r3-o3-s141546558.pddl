(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_01 obj_11 - type_1
obj_05 obj_09 obj_12 obj_07 - type_2
obj_04 obj_08 obj_02 - type_3
obj_10 obj_06 obj_03 - object)
(:init
(pred_2 obj_01 obj_08)
(pred_3 obj_01 obj_05)
(pred_3 obj_01 obj_09)
(pred_2 obj_11 obj_08)
(pred_3 obj_11 obj_12)
(pred_3 obj_11 obj_07)
(pred_4 obj_10 obj_08)
(pred_4 obj_06 obj_02)
(pred_4 obj_03 obj_02)
)
(:goal
(and
(pred_4 obj_10 obj_08)
(pred_4 obj_06 obj_04)
(pred_4 obj_03 obj_04)
)
)

(:constraints
  (always (not (pred_2 obj_01 obj_02)))
)
)