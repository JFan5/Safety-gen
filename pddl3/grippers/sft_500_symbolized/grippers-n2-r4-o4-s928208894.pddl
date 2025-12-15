(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_12 - type_1
obj_04 obj_02 obj_11 obj_01 - type_3
obj_07 obj_03 obj_14 obj_10 - type_2
obj_08 obj_13 obj_05 obj_06 - object)
(:init
(pred_3 obj_09 obj_07)
(pred_2 obj_09 obj_04)
(pred_2 obj_09 obj_02)
(pred_3 obj_12 obj_10)
(pred_2 obj_12 obj_11)
(pred_2 obj_12 obj_01)
(pred_4 obj_08 obj_14)
(pred_4 obj_13 obj_03)
(pred_4 obj_05 obj_03)
(pred_4 obj_06 obj_07)
)
(:goal
(and
(pred_4 obj_08 obj_14)
(pred_4 obj_13 obj_03)
(pred_4 obj_05 obj_03)
(pred_4 obj_06 obj_14)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_14)))
)
)