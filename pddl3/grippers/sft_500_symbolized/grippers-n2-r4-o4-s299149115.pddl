(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_09 - type_3
obj_12 obj_08 obj_05 obj_07 - type_1
obj_04 obj_01 obj_06 obj_14 - type_2
obj_13 obj_03 obj_10 obj_11 - object)
(:init
(pred_4 obj_02 obj_06)
(pred_1 obj_02 obj_12)
(pred_1 obj_02 obj_08)
(pred_4 obj_09 obj_04)
(pred_1 obj_09 obj_05)
(pred_1 obj_09 obj_07)
(pred_3 obj_13 obj_04)
(pred_3 obj_03 obj_06)
(pred_3 obj_10 obj_06)
(pred_3 obj_11 obj_14)
)
(:goal
(and
(pred_3 obj_13 obj_14)
(pred_3 obj_03 obj_06)
(pred_3 obj_10 obj_06)
(pred_3 obj_11 obj_01)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_14)))
)
)