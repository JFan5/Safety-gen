(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_09 - type_3
obj_02 obj_07 obj_12 obj_01 - type_2
obj_13 obj_06 obj_11 obj_05 - type_1
obj_08 obj_04 obj_14 obj_10 - object)
(:init
(pred_3 obj_03 obj_11)
(pred_4 obj_03 obj_02)
(pred_4 obj_03 obj_07)
(pred_3 obj_09 obj_06)
(pred_4 obj_09 obj_12)
(pred_4 obj_09 obj_01)
(pred_1 obj_08 obj_11)
(pred_1 obj_04 obj_06)
(pred_1 obj_14 obj_13)
(pred_1 obj_10 obj_06)
)
(:goal
(and
(pred_1 obj_08 obj_05)
(pred_1 obj_04 obj_13)
(pred_1 obj_14 obj_05)
(pred_1 obj_10 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_05)))
)
)