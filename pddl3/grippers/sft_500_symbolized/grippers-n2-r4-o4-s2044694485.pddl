(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_03 - type_1
obj_06 obj_02 obj_14 obj_12 - type_2
obj_13 obj_04 obj_10 obj_01 - type_3
obj_09 obj_11 obj_08 obj_05 - object)
(:init
(pred_4 obj_07 obj_10)
(pred_3 obj_07 obj_06)
(pred_3 obj_07 obj_02)
(pred_4 obj_03 obj_10)
(pred_3 obj_03 obj_14)
(pred_3 obj_03 obj_12)
(pred_2 obj_09 obj_10)
(pred_2 obj_11 obj_13)
(pred_2 obj_08 obj_01)
(pred_2 obj_05 obj_13)
)
(:goal
(and
(pred_2 obj_09 obj_04)
(pred_2 obj_11 obj_01)
(pred_2 obj_08 obj_13)
(pred_2 obj_05 obj_10)
)
)

(:constraints
  (always (not (pred_4 obj_07 obj_01)))
)
)