(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_12 - type_3
obj_11 obj_03 obj_08 obj_05 - type_1
obj_10 obj_04 obj_14 obj_06 - type_2
obj_09 obj_01 obj_13 obj_07 - object)
(:init
(pred_2 obj_02 obj_10)
(pred_1 obj_02 obj_11)
(pred_1 obj_02 obj_03)
(pred_2 obj_12 obj_04)
(pred_1 obj_12 obj_08)
(pred_1 obj_12 obj_05)
(pred_3 obj_09 obj_10)
(pred_3 obj_01 obj_04)
(pred_3 obj_13 obj_06)
(pred_3 obj_07 obj_06)
)
(:goal
(and
(pred_3 obj_09 obj_14)
(pred_3 obj_01 obj_06)
(pred_3 obj_13 obj_14)
(pred_3 obj_07 obj_14)
)
)

(:constraints
  (always (not (pred_2 obj_02 obj_14)))
)
)