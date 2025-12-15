(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_09 - type_1
obj_12 obj_06 obj_03 obj_05 - type_3
obj_10 obj_08 obj_02 - type_2
obj_01 obj_04 obj_11 - object)
(:init
(pred_3 obj_07 obj_08)
(pred_4 obj_07 obj_12)
(pred_4 obj_07 obj_06)
(pred_3 obj_09 obj_10)
(pred_4 obj_09 obj_03)
(pred_4 obj_09 obj_05)
(pred_2 obj_01 obj_10)
(pred_2 obj_04 obj_10)
(pred_2 obj_11 obj_02)
)
(:goal
(and
(pred_2 obj_01 obj_08)
(pred_2 obj_04 obj_02)
(pred_2 obj_11 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_02)))
)
)