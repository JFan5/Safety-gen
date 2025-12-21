(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_11 - type_1
obj_05 obj_06 obj_12 obj_13 - type_3
obj_02 obj_04 obj_08 obj_10 - type_2
obj_09 obj_03 obj_07 - object)
(:init
(pred_4 obj_01 obj_08)
(pred_2 obj_01 obj_05)
(pred_2 obj_01 obj_06)
(pred_4 obj_11 obj_02)
(pred_2 obj_11 obj_12)
(pred_2 obj_11 obj_13)
(pred_3 obj_09 obj_02)
(pred_3 obj_03 obj_10)
(pred_3 obj_07 obj_02)
)
(:goal
(and
(pred_3 obj_09 obj_10)
(pred_3 obj_03 obj_02)
(pred_3 obj_07 obj_10)
)
)

(:constraints
  (always (not (pred_4 obj_01 obj_10)))
)
)