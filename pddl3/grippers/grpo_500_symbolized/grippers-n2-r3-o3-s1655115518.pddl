(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_11 - type_1
obj_07 obj_03 obj_05 obj_06 - type_3
obj_12 obj_02 obj_08 - type_2
obj_10 obj_09 obj_01 - object)
(:init
(pred_4 obj_04 obj_08)
(pred_2 obj_04 obj_07)
(pred_2 obj_04 obj_03)
(pred_4 obj_11 obj_08)
(pred_2 obj_11 obj_05)
(pred_2 obj_11 obj_06)
(pred_3 obj_10 obj_02)
(pred_3 obj_09 obj_12)
(pred_3 obj_01 obj_02)
)
(:goal
(and
(pred_3 obj_10 obj_02)
(pred_3 obj_09 obj_08)
(pred_3 obj_01 obj_08)
)
)

(:constraints
  (always (not (pred_4 obj_04 obj_02)))
)
)