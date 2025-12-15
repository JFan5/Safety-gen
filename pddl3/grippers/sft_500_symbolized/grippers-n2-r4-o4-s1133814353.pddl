(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_03 - type_3
obj_04 obj_07 obj_10 obj_02 - type_2
obj_05 obj_12 obj_01 obj_11 - type_1
obj_09 obj_13 obj_08 obj_06 - object)
(:init
(pred_1 obj_14 obj_11)
(pred_4 obj_14 obj_04)
(pred_4 obj_14 obj_07)
(pred_1 obj_03 obj_05)
(pred_4 obj_03 obj_10)
(pred_4 obj_03 obj_02)
(pred_2 obj_09 obj_11)
(pred_2 obj_13 obj_05)
(pred_2 obj_08 obj_11)
(pred_2 obj_06 obj_12)
)
(:goal
(and
(pred_2 obj_09 obj_01)
(pred_2 obj_13 obj_01)
(pred_2 obj_08 obj_11)
(pred_2 obj_06 obj_11)
)
)

(:constraints
  (always (not (pred_1 obj_14 obj_01)))
)
)