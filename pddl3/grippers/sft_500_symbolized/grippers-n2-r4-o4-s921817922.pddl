(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_04 - type_1
obj_08 obj_01 obj_07 obj_10 - type_2
obj_02 obj_03 obj_14 obj_11 - type_3
obj_09 obj_05 obj_12 obj_06 - object)
(:init
(pred_1 obj_13 obj_11)
(pred_3 obj_13 obj_08)
(pred_3 obj_13 obj_01)
(pred_1 obj_04 obj_03)
(pred_3 obj_04 obj_07)
(pred_3 obj_04 obj_10)
(pred_2 obj_09 obj_03)
(pred_2 obj_05 obj_11)
(pred_2 obj_12 obj_14)
(pred_2 obj_06 obj_11)
)
(:goal
(and
(pred_2 obj_09 obj_02)
(pred_2 obj_05 obj_11)
(pred_2 obj_12 obj_11)
(pred_2 obj_06 obj_03)
)
)

(:constraints
  (always (not (pred_1 obj_13 obj_14)))
)
)