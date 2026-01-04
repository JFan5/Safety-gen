(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_02 - type_2
obj_01 obj_10 obj_09 obj_12 - type_3
obj_06 obj_13 obj_05 obj_07 - type_1
obj_11 obj_14 obj_04 obj_08 - object)
(:init
(pred_4 obj_03 obj_06)
(pred_1 obj_03 obj_01)
(pred_1 obj_03 obj_10)
(pred_4 obj_02 obj_06)
(pred_1 obj_02 obj_09)
(pred_1 obj_02 obj_12)
(pred_3 obj_11 obj_06)
(pred_3 obj_14 obj_06)
(pred_3 obj_04 obj_05)
(pred_3 obj_08 obj_05)
)
(:goal
(and
(pred_3 obj_11 obj_13)
(pred_3 obj_14 obj_07)
(pred_3 obj_04 obj_06)
(pred_3 obj_08 obj_13)
)
)

(:constraints
  (always (not (pred_4 obj_03 obj_05)))
)
)