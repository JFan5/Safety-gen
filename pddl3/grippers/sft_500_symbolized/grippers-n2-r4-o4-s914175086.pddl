(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_07 - type_3
obj_12 obj_04 obj_08 obj_09 - type_1
obj_11 obj_06 obj_14 obj_01 - type_2
obj_13 obj_10 obj_05 obj_02 - object)
(:init
(pred_3 obj_03 obj_14)
(pred_4 obj_03 obj_12)
(pred_4 obj_03 obj_04)
(pred_3 obj_07 obj_06)
(pred_4 obj_07 obj_08)
(pred_4 obj_07 obj_09)
(pred_1 obj_13 obj_06)
(pred_1 obj_10 obj_06)
(pred_1 obj_05 obj_11)
(pred_1 obj_02 obj_01)
)
(:goal
(and
(pred_1 obj_13 obj_06)
(pred_1 obj_10 obj_14)
(pred_1 obj_05 obj_01)
(pred_1 obj_02 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_01)))
)
)