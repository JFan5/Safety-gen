(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_10 - type_1
obj_09 obj_11 obj_12 obj_05 - type_2
obj_13 obj_14 obj_01 obj_06 - type_3
obj_07 obj_08 obj_02 obj_03 - object)
(:init
(pred_3 obj_04 obj_06)
(pred_1 obj_04 obj_09)
(pred_1 obj_04 obj_11)
(pred_3 obj_10 obj_14)
(pred_1 obj_10 obj_12)
(pred_1 obj_10 obj_05)
(pred_4 obj_07 obj_14)
(pred_4 obj_08 obj_06)
(pred_4 obj_02 obj_01)
(pred_4 obj_03 obj_06)
)
(:goal
(and
(pred_4 obj_07 obj_13)
(pred_4 obj_08 obj_06)
(pred_4 obj_02 obj_06)
(pred_4 obj_03 obj_14)
)
)

(:constraints
  (always (not (pred_3 obj_04 obj_01)))
)
)