(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_06 - type_1
obj_14 obj_04 obj_05 obj_11 - type_3
obj_10 obj_03 obj_01 obj_12 - type_2
obj_13 obj_08 obj_02 obj_07 - object)
(:init
(pred_4 obj_09 obj_12)
(pred_2 obj_09 obj_14)
(pred_2 obj_09 obj_04)
(pred_4 obj_06 obj_12)
(pred_2 obj_06 obj_05)
(pred_2 obj_06 obj_11)
(pred_3 obj_13 obj_03)
(pred_3 obj_08 obj_01)
(pred_3 obj_02 obj_10)
(pred_3 obj_07 obj_10)
)
(:goal
(and
(pred_3 obj_13 obj_01)
(pred_3 obj_08 obj_10)
(pred_3 obj_02 obj_01)
(pred_3 obj_07 obj_12)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_01)))
)
)