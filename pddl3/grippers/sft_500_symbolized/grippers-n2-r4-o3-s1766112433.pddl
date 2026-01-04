(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_01 - type_1
obj_06 obj_04 obj_08 obj_07 - type_3
obj_10 obj_11 obj_02 obj_12 - type_2
obj_03 obj_09 obj_13 - object)
(:init
(pred_3 obj_05 obj_12)
(pred_1 obj_05 obj_06)
(pred_1 obj_05 obj_04)
(pred_3 obj_01 obj_11)
(pred_1 obj_01 obj_08)
(pred_1 obj_01 obj_07)
(pred_2 obj_03 obj_11)
(pred_2 obj_09 obj_02)
(pred_2 obj_13 obj_10)
)
(:goal
(and
(pred_2 obj_03 obj_12)
(pred_2 obj_09 obj_10)
(pred_2 obj_13 obj_10)
)
)

(:constraints
  (always (not (pred_3 obj_05 obj_02)))
)
)