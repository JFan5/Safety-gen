(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_09 - type_1
obj_08 obj_02 obj_06 obj_07 - type_2
obj_01 obj_10 obj_14 obj_13 - type_3
obj_05 obj_04 obj_11 obj_03 - object)
(:init
(pred_1 obj_12 obj_13)
(pred_3 obj_12 obj_08)
(pred_3 obj_12 obj_02)
(pred_1 obj_09 obj_14)
(pred_3 obj_09 obj_06)
(pred_3 obj_09 obj_07)
(pred_2 obj_05 obj_10)
(pred_2 obj_04 obj_10)
(pred_2 obj_11 obj_14)
(pred_2 obj_03 obj_01)
)
(:goal
(and
(pred_2 obj_05 obj_13)
(pred_2 obj_04 obj_14)
(pred_2 obj_11 obj_01)
(pred_2 obj_03 obj_10)
)
)

(:constraints
  (always (not (pred_1 obj_12 obj_14)))
)
)