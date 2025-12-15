(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_03 - type_2
obj_14 obj_08 obj_07 obj_06 - type_1
obj_11 obj_10 obj_02 obj_04 - type_3
obj_05 obj_01 obj_13 obj_12 - object)
(:init
(pred_4 obj_09 obj_11)
(pred_1 obj_09 obj_14)
(pred_1 obj_09 obj_08)
(pred_4 obj_03 obj_10)
(pred_1 obj_03 obj_07)
(pred_1 obj_03 obj_06)
(pred_3 obj_05 obj_11)
(pred_3 obj_01 obj_11)
(pred_3 obj_13 obj_04)
(pred_3 obj_12 obj_11)
)
(:goal
(and
(pred_3 obj_05 obj_10)
(pred_3 obj_01 obj_11)
(pred_3 obj_13 obj_10)
(pred_3 obj_12 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_02)))
)
)