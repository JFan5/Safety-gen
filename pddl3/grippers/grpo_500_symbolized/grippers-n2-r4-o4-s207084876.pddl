(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_05 - type_1
obj_08 obj_04 obj_13 obj_12 - type_3
obj_14 obj_06 obj_11 obj_02 - type_2
obj_03 obj_07 obj_01 obj_09 - object)
(:init
(pred_4 obj_10 obj_11)
(pred_2 obj_10 obj_08)
(pred_2 obj_10 obj_04)
(pred_4 obj_05 obj_11)
(pred_2 obj_05 obj_13)
(pred_2 obj_05 obj_12)
(pred_3 obj_03 obj_14)
(pred_3 obj_07 obj_02)
(pred_3 obj_01 obj_14)
(pred_3 obj_09 obj_02)
)
(:goal
(and
(pred_3 obj_03 obj_14)
(pred_3 obj_07 obj_14)
(pred_3 obj_01 obj_14)
(pred_3 obj_09 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_02)))
)
)