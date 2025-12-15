(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_03 obj_01 - type_2
obj_12 obj_06 obj_04 obj_10 - type_3
obj_08 obj_05 obj_02 - type_1
obj_11 obj_09 obj_07 - object)
(:init
(pred_1 obj_03 obj_08)
(pred_2 obj_03 obj_12)
(pred_2 obj_03 obj_06)
(pred_1 obj_01 obj_05)
(pred_2 obj_01 obj_04)
(pred_2 obj_01 obj_10)
(pred_3 obj_11 obj_05)
(pred_3 obj_09 obj_08)
(pred_3 obj_07 obj_08)
)
(:goal
(and
(pred_3 obj_11 obj_08)
(pred_3 obj_09 obj_02)
(pred_3 obj_07 obj_05)
)
)

(:constraints
  (always (not (pred_1 obj_03 obj_02)))
)
)