(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_08 - type_1
obj_03 obj_12 obj_10 obj_06 - type_3
obj_07 obj_05 obj_01 obj_04 - type_2
obj_11 obj_09 obj_02 - object)
(:init
(pred_4 obj_13 obj_04)
(pred_2 obj_13 obj_03)
(pred_2 obj_13 obj_12)
(pred_4 obj_08 obj_04)
(pred_2 obj_08 obj_10)
(pred_2 obj_08 obj_06)
(pred_3 obj_11 obj_05)
(pred_3 obj_09 obj_05)
(pred_3 obj_02 obj_01)
)
(:goal
(and
(pred_3 obj_11 obj_05)
(pred_3 obj_09 obj_01)
(pred_3 obj_02 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_13 obj_01)))
)
)