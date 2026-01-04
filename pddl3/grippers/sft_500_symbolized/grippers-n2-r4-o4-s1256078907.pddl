(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_12 - type_1
obj_06 obj_03 obj_01 obj_10 - type_3
obj_04 obj_08 obj_14 obj_05 - type_2
obj_07 obj_09 obj_13 obj_11 - object)
(:init
(pred_3 obj_02 obj_08)
(pred_2 obj_02 obj_06)
(pred_2 obj_02 obj_03)
(pred_3 obj_12 obj_04)
(pred_2 obj_12 obj_01)
(pred_2 obj_12 obj_10)
(pred_1 obj_07 obj_04)
(pred_1 obj_09 obj_05)
(pred_1 obj_13 obj_14)
(pred_1 obj_11 obj_04)
)
(:goal
(and
(pred_1 obj_07 obj_08)
(pred_1 obj_09 obj_04)
(pred_1 obj_13 obj_08)
(pred_1 obj_11 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_14)))
)
)