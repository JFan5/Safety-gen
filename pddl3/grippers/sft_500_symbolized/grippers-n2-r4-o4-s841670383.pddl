(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_12 - type_1
obj_08 obj_11 obj_14 obj_05 - type_3
obj_10 obj_03 obj_02 obj_01 - type_2
obj_06 obj_07 obj_13 obj_04 - object)
(:init
(pred_4 obj_09 obj_02)
(pred_1 obj_09 obj_08)
(pred_1 obj_09 obj_11)
(pred_4 obj_12 obj_03)
(pred_1 obj_12 obj_14)
(pred_1 obj_12 obj_05)
(pred_2 obj_06 obj_10)
(pred_2 obj_07 obj_01)
(pred_2 obj_13 obj_10)
(pred_2 obj_04 obj_01)
)
(:goal
(and
(pred_2 obj_06 obj_02)
(pred_2 obj_07 obj_10)
(pred_2 obj_13 obj_03)
(pred_2 obj_04 obj_10)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_01)))
)
)